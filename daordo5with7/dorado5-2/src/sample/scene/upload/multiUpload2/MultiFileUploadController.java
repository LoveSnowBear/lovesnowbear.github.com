package sample.scene.upload.multiUpload2;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import com.bstek.dorado.action.Action;
import com.bstek.dorado.action.Controller;
import com.bstek.dorado.action.mapping.ActionForward;
import com.bstek.dorado.common.DoradoContext;

/**
 * 多文件上传控制器。<br/>
 * 该类采用commons-upload 1.2版本实现。<br/>
 * @author frank.zhang
 * @version 1.0
 */
public class MultiFileUploadController extends Controller{
	/** 上传文件结果 */
	private List uploadResults;
	/** serialVersionUID */
	private static final long serialVersionUID = -2759484714143932993L;
	/**
	 * 文件上传信息，采用ThreadLocal。
	 */
	public static ThreadLocal uploadInfo = new ThreadLocal();
	/**
	 * 上传文件最大大小，程序来控制，若超过最大大小，则status设置为exceedMaxFileSize。<br/>
	 * 这里默认设置为100MB。
	 */
	private int maxFileSize = 100*1024*1024;
	/**
	 * @return the maxFileSize
	 */
	public int getMaxFileSize() {
		return maxFileSize;
	}
	/**
	 * @param maxFileSize the maxFileSize to set
	 */
	public void setMaxFileSize(int maxFileSize) {
		this.maxFileSize = maxFileSize;
	}
	/*
	 * (non-Javadoc)
	 * @see com.bstek.dorado.action.Controller#doAction(com.bstek.dorado.action.Action, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doAction(Action action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//取得web目录的绝对路径
		String webappPath = request.getSession().getServletContext().getRealPath("/");
		//创建一个DiskFileItemFactory
		DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建一个ServletFileUpload
        ServletFileUpload upload = new ServletFileUpload(factory);
        //设置编码，解决上传中文名乱码问题
        upload.setHeaderEncoding("utf-8");
        //初始化上传结果List
        uploadResults = new ArrayList();
        //创建一个新的ProgressListener
        ProgressListener listener = new ProgressListener(){
        	/**
        	 * 用来控制上传多大的尺寸才更新session的标识符
        	 */
        	private long kiloBytes = 0;
        	/**
        	 * 上传开始时间
        	 */
        	private long startTime = 0;
        	/**
        	 * 上传是否开始的开始的标识符
        	 */
        	private boolean startFlag = false;
        	/* (non-Javadoc)
        	 * @see org.apache.commons.fileupload.ProgressListener#update(long, long, int)
        	 * 
        	 */
        	public void update(long pBytesRead, long pContentLength, int pItems) {
        		if (!startFlag) {
        			startTime = System.currentTimeMillis();
        			UploadInfo newUploadInfo = new UploadInfo();
        			newUploadInfo.setStatus("progress");
        			uploadInfo.set(newUploadInfo);
        			startFlag = true;
        		}
        		// 在这里控制上传多少就去写一下session，比如10k就设置为10000。
        		// 一般来说100k足够，也就是100000。
        		long kBytes = pBytesRead / 100000;
        		if (kiloBytes == kBytes) {
        			return;
        		}
        		kiloBytes = kBytes;
        		
        		if (pContentLength != -1) {
        			//填充上传进度信息
        			UploadInfo info = (UploadInfo)uploadInfo.get();
        			info.setFileIndex(pItems);
        			info.setTotalRead(pBytesRead);
        			info.setTotalFileSize(pContentLength);
        			info.setElapsedTime(System.currentTimeMillis() - startTime);
        			MultiFileUploadController.uploadInfo.set(info);
        			//把上传进度信息放置在Session中。         			
					DoradoContext context = DoradoContext.getContext();
        			context.setAttribute(DoradoContext.SESSION, "uploadInfo", info);
        		}
        	}
        };
        //设置ProgressListener
        upload.setProgressListener(listener);
        try{
        	//取得要上传的文件。
            List items = upload.parseRequest(request);
            //对上传的多个文件进行遍历，并进行处理。
            Iterator iterator = items.iterator();
            while(iterator.hasNext()){
                FileItem item = (FileItem)iterator.next();
                //如果是文件，则进行处理，否则则忽略。
                if(!item.isFormField()){
                	String fileFullName = item.getName();
					long size = item.getSize();
					if ((fileFullName == null || fileFullName.equals("")) && size == 0){
						continue;
					}
					// 上传该文件
					uploadFileItem(item, fileFullName, size, webappPath);
                }
            }
        } catch (FileUploadException e){
        	e.printStackTrace();
            throw new Exception("上传出现错误。");
        }finally{
        	//在上传文件结束后，对uploadInfo和uploadResult进行处理。
        	afterFileUpload();
        }
        return null;
	}

	/**
	 * 上传文件并处理UploadResult。<br/>
	 * 该方法流程如下：
	 * <p>
	 * <ol>
	 * 	<li>取得文件名。</li>
	 *  <li>填充上传文件的uploadResult。</li>
	 *  <li>判断是否符合文件大小限制，若超过则设置起status为exceedMaxFileSize。若不超过，则上传该文件，且设置起staus为done。</li>
	 *  <li>把上传结果添加到uploadResults中。</li>
	 * </ol>
	 * </p>
	 * @param item 要上传的文件信息
	 * @param fileName 上传文件全名
	 * @param size 要上传的文件大小
	 * @param webappPath web目录的绝对路径
	 * @throws Exception 在写文件的时候可能会出现IO异常。
	 */

	private void uploadFileItem(FileItem item, String fileFullName,
			long size, String webappPath) throws Exception {
		String fileName = null;
		// get the file name
		String[] splitResult = StringUtils.split(fileFullName, "\\"); 
		fileName = splitResult[splitResult.length - 1];
		
		UploadResult result = new UploadResult();
		result.setFileName(fileName);
		result.setFileFormat(getFileFormat(fileName));
		result.setSize((int)size);
		if(size > maxFileSize){
			result.setStatus("exceedMaxFileSize");
		}else{
			// 保存上传的文件到指定的目录
			item.write(new File(webappPath + "upload/" + fileName));
			result.setServerStoreDir("upload/" + fileName);
			result.setStatus("done");
			UploadDemoViewModel.uploadedFiles.add(result);
		}
		uploadResults.add(result);
	}
	
	/**
	 * 取得文件格式。
	 * <p>
	 * 该方法取得文件名最后一个"."所在的位置，然后返回该位置后的字符串。
	 * </p>
	 * @param fileName 文件名
	 * @return String 文件格式
	 */
	private String getFileFormat(String fileName){
		int dotIndex = fileName.lastIndexOf('.');
		return dotIndex == -1 ? null : fileName.substring(dotIndex + 1);
	}
	
	/**
	 * 文件完成上传后对session的处理。
	 * <p>
	 * 流程如下：
	 * <ol>
	 * 	<li>取得uploadInfo，并设置uploadInfo的status为done。</li>
	 * 	<li>把uploadInfo和uploadResult都填充到Session中。</li>
	 * </ol>
	 * </p>
	 */
	private void afterFileUpload() {
		UploadInfo tempInfo =  (UploadInfo)uploadInfo.get();
		if(tempInfo == null){
			tempInfo = new UploadInfo();
			tempInfo.setStatus("progress");
			uploadInfo.set(tempInfo);
		}
		tempInfo.setStatus("done");
		uploadInfo.set(tempInfo);	
		DoradoContext context = DoradoContext.getContext();
		context.setAttribute(DoradoContext.SESSION, "uploadInfo", tempInfo);
		context.setAttribute(DoradoContext.SESSION, "uploadResult", uploadResults);
	}
}

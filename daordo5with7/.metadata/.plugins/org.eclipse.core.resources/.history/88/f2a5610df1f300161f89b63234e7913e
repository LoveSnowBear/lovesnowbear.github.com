package sample.scene.upload.simpleUpload;

import java.io.File;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;

import sample.FileController;

import com.bstek.dorado.utils.MetaData;

/**
 * UploadController
 */
public class UploadController extends FileController {

	/**
	 * 用来存储文件路径
	 */
	public static String filePath = null;
	/**
	 * 用来存储文件名
	 */
	public static String fileName = null;
	
	protected void initFileUpload(HttpServletRequest request,
			FileUploadBase fileUpload) {
		fileUpload.setSizeMax(1024 * 10000); // 设定可接受的最大上传文件的大小10M
	}

	/**
	 * 取得存放上传文件的工作目录
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param parameters
	 *            MetaData
	 * @return String
	 */
	protected File getUploadWorkDirectory(HttpServletRequest request,
			MetaData parameters) {
		return new File(request.getSession().getServletContext().getRealPath(
				"/")
				+ "upload");
	}

	/**
	 * 取得存储上传文件的文件名
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param fileName
	 *            String
	 * @param parameters
	 *            MetaData
	 * @return String
	 */
	protected String getStoreFileName(HttpServletRequest request,
			String fileName, MetaData parameters) {
		int pos = fileName.lastIndexOf(".");
		String extName;
		if (pos > 0) {
			extName = fileName.substring(pos);
		} else {
			extName = "";
		}
		String fullFileName = System.currentTimeMillis() + extName;
		String filePath = "upload/" + fullFileName;
		request.setAttribute("fileName", fullFileName);
		request.setAttribute("filePath", filePath);
		return fullFileName;
	}

	/**
	 * 存储已经上传的文件
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param fileItem
	 *            String
	 * @param storeFile
	 *            String
	 * @param parameters
	 *            MetaData
	 * @throws Exception
	 */
	protected void storeUploadFile(HttpServletRequest request,
			FileItem fileItem, File storeFile, MetaData parameters)
			throws Exception {
		super.storeUploadFile(request, fileItem, storeFile, parameters);
		//如果存在原来上传的文件，则删除这个文件。
		if (UploadController.filePath != null) {
			String webappPath = request.getSession().getServletContext()
					.getRealPath("/");
			File file = new File(webappPath + UploadController.filePath);
			if (file.exists()){
				file.delete();
			}
		}
		UploadController.filePath = (String) request.getAttribute("filePath");
		UploadController.fileName = (String) request.getAttribute("fileName");
	}

	/**
	 * 取得将要下载的文件的文件名
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	protected String getDownLoadFileName(HttpServletRequest request) {
		return null;
	}

	/**
	 * 取得将要被下载的文件的文件输入流
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @throws Exception
	 * @return InputStream
	 */
	protected InputStream getDownloadFileInputStream(HttpServletRequest request)
			throws Exception {
		return null;
	}

}

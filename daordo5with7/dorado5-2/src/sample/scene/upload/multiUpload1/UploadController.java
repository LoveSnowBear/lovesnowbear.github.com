package sample.scene.upload.multiUpload1;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;

import sample.FileController;

import com.bstek.dorado.utils.MetaData;

/**
 * UploadController
 */
public class UploadController extends FileController {

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

		Map fileMap = new HashMap();
		fileMap.put("fileName", request.getAttribute("fileName"));
		fileMap.put("filePath", request.getAttribute("filePath"));
		UploadDemoViewModel.fileList.add(fileMap);
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

package sample;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;

import com.bstek.dorado.action.Action;
import com.bstek.dorado.action.Controller;
import com.bstek.dorado.action.mapping.ActionForward;
import com.bstek.dorado.utils.MetaData;
import com.bstek.dorado.utils.StringHelper;
import com.bstek.dorado.common.log.Log;
import com.bstek.dorado.common.Setting;

/**
 * 用于协助用户完成文件上传和下载的Controller. 支持多文件的同时上传.
 * 
 */
public abstract class FileController extends Controller {
	private static final int BUFFER_SIZE = 2048;

	public static final String CONTENT_DISPOSITION = "content-disposition";
	public static final String CONTENT_TYPE_OCTET_STREAM = "application/octet-stream";
	public static final String CONTENT_TYPE_MS_DOWNLOAD = "application/x-msdownload";
	public static final String CONTENT_TYPE_MS_WORD = "application/msword";
	public static final String CONTENT_TYPE_MS_EXCEL = "application/vnd.ms-excel";
	public static final String CONTENT_TYPE_MS_POWERPOINT = "application/vnd.ms-powerpoint";
	public static final String CONTENT_TYPE_PDF = "application/pdf";
	public static final String CONTENT_TYPE_XML = "text/xml";
	public static final String CONTENT_TYPE_HTML = "text/html";

	/**
	 * 取得存放上传文件的工作目录
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param parameters
	 *            MetaData
	 * @return File
	 */
	protected File getUploadWorkDirectory(HttpServletRequest request,
			MetaData parameters) {
		return new File(System.getProperty("java.io.tmpdir"));
	}

	/**
	 * 设定 FileUpload 的相关属性.
	 * <p>
	 * 关于FileUpload, 可以到www.apache.org/commons查找FileUpload的文档
	 * </p>
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param fileUpload
	 *            FileUploadBase
	 */
	protected abstract void initFileUpload(HttpServletRequest request,
			FileUploadBase fileUpload);

	/**
	 * 取得存储上传文件的文件名
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param fileName
	 *            String 默认文件名
	 * @param parameters
	 *            MetaData
	 * @return String
	 */
	protected String getStoreFileName(HttpServletRequest request,
			String fileName, MetaData parameters) {
		String storeFileName;
		int pos = fileName.lastIndexOf(File.separator);
		if (pos >= 0 && pos < fileName.length() - 1) {
			storeFileName = fileName.substring(pos + 1);
		} else {
			storeFileName = fileName;
		}
		return storeFileName;
	}

	/**
	 * 取得将要下载的文件的文件名
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	protected abstract String getDownLoadFileName(HttpServletRequest request);

	/**
	 * 执行文件上传
	 * 
	 * @param action
	 *            Action
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @throws Exception
	 * @return ActionForward
	 */
	public ActionForward doUpload(Action action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 得到所有的文件
		ServletFileUpload fu = new ServletFileUpload(new DiskFileItemFactory());

		// 设定DiskFileUpload的相关属性
		initFileUpload(request, fu);

		List fileItems = fu.parseRequest(request);

		MetaData parameters = new MetaData();
		for (int i = 0; i < fileItems.size(); i++) {
			FileItem fi = (FileItem) fileItems.get(i);
			if (fi.isFormField()) {
				parameters.setString(fi.getFieldName(), fi.getString());
			}
		}

		processUploadFiles(request, fileItems, parameters);
		return action.findDefaultForward();
	}

	protected void processUploadFiles(HttpServletRequest request, List fileItems,
			MetaData parameters) throws Exception {
		// 存放文件的目标目录，文件夹不存在就自动创建
		File file = getUploadWorkDirectory(request, parameters);
		if (!file.exists()) {
			file.mkdirs();
		}

		for (int i = 0; i < fileItems.size(); i++) {
			FileItem fi = (FileItem) fileItems.get(i);
			if (!fi.isFormField()) {
				// 获得文件名，这个文件名包括路径
				String fileName = fi.getName();
				if (StringHelper.isNotEmpty(fileName)) {
					// 写入文件，也可以从fileName中提取文件名
					String storeFileName = file.getAbsolutePath()
							+ File.separator
							+ getStoreFileName(request, fileName, parameters);
					if (storeFileName.indexOf("..") >= 0) {
						throw new SecurityException();
					}

					File storeFile = new File(storeFileName);
					storeUploadFile(request, fi, storeFile, parameters);
				}
			}
		}
	}

	/**
	 * 存储已经上传的文件
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param fileItem
	 *            FileItem
	 * @param storeFile
	 *            File
	 * @param parameters
	 *            MetaData
	 * @throws Exception
	 */
	protected void storeUploadFile(HttpServletRequest request,
			FileItem fileItem, File storeFile, MetaData parameters)
			throws Exception {
		fileItem.write(storeFile);
	}

	/**
	 * 取得将要被下载的文件的文件输入流
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @throws Exception
	 * @return InputStream
	 */
	protected abstract InputStream getDownloadFileInputStream(
			HttpServletRequest request) throws Exception;

	/**
	 * 向Response对象中写入文件数据
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @throws IOException
	 * @throws Exception
	 */
	protected void outputDownloadFile(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception {
		InputStream in = getDownloadFileInputStream(request);
		if (in != null) {
			OutputStream out = response.getOutputStream();
			try {
				byte[] buffer = new byte[BUFFER_SIZE];
				int len = in.read(buffer);
				while (len != -1) {
					out.write(buffer, 0, len);
					len = in.read(buffer);
				}
				out.flush();
			} catch (IOException ex) {
				/**
				 * to avoid "java.net.SocketException: Connection reset by peer:
				 * socket write error"
				 */
			} finally {
				in.close();
				out.close();
			}
		}
	}

	/**
	 * 返回向Response输出时使用的ContentType
	 * 
	 * @return String
	 */
	protected String getOutputContentType(HttpServletRequest request) {
		return CONTENT_TYPE_OCTET_STREAM;
	}

	/**
	 * 直接把文件显示到浏览器中
	 * 
	 * @param action
	 *            Action
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @throws Exception
	 * @return ActionForward
	 */
	public ActionForward doOutput(Action action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			String contentType = getOutputContentType(request);
			response.setContentType(contentType);
			response.setHeader(CONTENT_DISPOSITION, "inline");
			response.setHeader("Connection", "close");

			/* 向Response对象中写入数据 */
			outputDownloadFile(request, response);
		} catch (Exception ex) {
			Log.error(ex);
		}
		return null;
	}

	/**
	 * 文件下载
	 * 
	 * @param action
	 *            Action
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @throws Exception
	 * @return ActionForward
	 */
	public ActionForward doDownload(Action action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			response.setContentType(CONTENT_TYPE_OCTET_STREAM);
			String fileName = getDownLoadFileName(request);
			fileName = StringHelper.translate(fileName, System
					.getProperty("file.encoding"), Setting.getString(
					"common.requestCharsetName", "ISO8859-1"));

			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ fileName + "\"");
			response.setHeader("Connection", "close");

			/* 向Response对象中写入数据 */
			outputDownloadFile(request, response);
		} catch (Exception ex) {
			Log.error(ex);
		}
		return null;
	}

}

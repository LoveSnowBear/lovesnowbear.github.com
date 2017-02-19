package sample.scene.submit;

import java.io.File;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadBase;

import sample.FileController;

import com.bstek.dorado.common.UserConfig;
import com.bstek.dorado.utils.MetaData;

public class ExcelController extends FileController {
	public static final String UPLOAD_WORK_PATH = UserConfig.getString("picture-path");
	
	protected File getUploadWorkDirectory(HttpServletRequest request,MetaData parameters) {
		return new File(UPLOAD_WORK_PATH);
	}
	
	protected String getStoreFileName(HttpServletRequest request,
			String fileName, MetaData parameters) {
		int pos = fileName.lastIndexOf(".");
		String extName;
		if (pos > 0) {
			extName = fileName.substring(pos);
		} else {
			extName = "";
		}
		String storeFileName=System.currentTimeMillis() + extName;
		request.setAttribute("fileName", storeFileName);
		return storeFileName;
	}

	protected String getDownLoadFileName(HttpServletRequest request) {
		return "employees.xls";
	}

	protected InputStream getDownloadFileInputStream(HttpServletRequest request)
			throws Exception {
		return this.getClass().getResourceAsStream(getDownLoadFileName(request));
	}

	protected void initFileUpload(HttpServletRequest request, FileUploadBase fileUpload) {
		fileUpload.setHeaderEncoding("UTF-8");
	}

}

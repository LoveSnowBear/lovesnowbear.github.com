package sample.skills.other.picture;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;

import sample.FileController;

import com.bstek.dorado.common.UserConfig;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.MetaData;
import com.bstek.dorado.utils.StringHelper;
import com.bstek.dorado.utils.variant.VariantSet;

/**
 * PictureController
 */
public class PictureController extends FileController {
	protected File getPicturePath() {
		return new File(UserConfig.getString("picture-path"));
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
	protected void initFileUpload(HttpServletRequest request,
			FileUploadBase fileUpload) {
		fileUpload.setSizeMax(1024 * 100); // 设定可接受的最大上传文件的大小100K
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
		return getPicturePath();
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
		// 注意： 此处的代码仅用于演示上传文件的处理方式。
		// 以系统时间戳为文件命名并不能有效的避免文件重名！
		int pos = fileName.lastIndexOf(".");
		String extName;
		if (pos > 0) {
			extName = fileName.substring(pos);
		} else {
			extName = "";
		}
		return System.currentTimeMillis() + extName;
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

		String employee_id = parameters.getString("employee_id");
		DBStatement st = new DBStatement();
		try {
			st
					.setSql("SELECT image FROM employee WHERE employee_id = :employee_id");
			st.parameters().setString("employee_id", employee_id);
			VariantSet v = st.query();
			String pictureFileName = v.getString("image");
			if (StringHelper.isNotEmpty(pictureFileName)) {
				File oldFile = new File(getPicturePath().getAbsolutePath()
						+ File.separator + pictureFileName);
				if (oldFile.exists()) {
					oldFile.delete(); // 删除原有的图片
				}
			}

			st.setSql(DBStatement.UPDATE, "employee", "employee_id");
			st.parameters().setString("employee_id", employee_id);
			st.parameters().setString("image", storeFile.getName());
			st.execute();

			request.setAttribute("uploaded.employee_id", employee_id);
		} finally {
			st.close();
		}
	}

	/**
	 * 取得将要下载的文件的文件名
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @return String
	 */
	protected String getDownLoadFileName(HttpServletRequest request) {
		return request.getParameter("employee_id");
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
		String employee_id = request.getParameter("employee_id");
		String pictureFileName = null;

		DBStatement st = new DBStatement();
		try {
			st
					.setSql("SELECT image FROM employee WHERE employee_id = :employee_id");
			st.parameters().setString("employee_id", employee_id);
			VariantSet v = st.query();
			pictureFileName = v.getString("IMAGE");
		} finally {
			st.close();
		}

		if (pictureFileName != null) {
			return new FileInputStream(getPicturePath().getAbsolutePath()
					+ File.separator + pictureFileName);
		} else {
			return null;
		}
	}

}

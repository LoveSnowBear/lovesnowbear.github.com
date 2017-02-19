package sample.scene.upload.multiUpload1;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.common.HttpDoradoContext;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.view.DefaultViewModel;

/** * UploadViewModel */
public class UploadDemoViewModel extends DefaultViewModel {	
  // 用来保存上传文件的list，里面放置多个map。	
  public static List fileList = new ArrayList();	
  
  /**	 * 移除文件的远程方法	 
  * @param parameters 传入参数	 
  * @param outParameters 传出参数	 
  * @throws Exception 默认不抛出异常	 
  */	
  public void removeFile(ParameterSet parameters, ParameterSet outParameters)	throws Exception {
  	String filePath = (String) parameters.getValue("filePath");
  	HttpDoradoContext context = (HttpDoradoContext) DoradoContext.getContext();
  	HttpServletRequest request = context.getRequest();
  	String webappPath = request.getSession().getServletContext().getRealPath("/");
  	if (!filePath.equals("")) {
  		File file = new File(webappPath + filePath);
  		if (file.exists()){
  			deleteFileRecord(filePath);
  			file.delete();
  		}
  	}
  }	
  
  /**	 
  * 移除文件的记录	 
  * @param path 文件的路径	 
  */	
  private void deleteFileRecord(String path){		
    for(int i = 0 , j =fileList.size();i < j;i++){			
      Map map = (Map)fileList.get(i);			
      String filePath  = (String)map.get("filePath");			
      if(filePath.equals(path)){				
        fileList.remove(i);				
        return;			
       }
      }	
   }
   /* (non-Javadoc)	 
   * @see com.bstek.dorado.view.ViewModelSupport#doLoadData()	 
   */	
   public void doLoadData() throws Exception {		
     Dataset dsFiles = getDataset("dsFiles");		
     dsFiles.fromDO(UploadDemoViewModel.fileList);		
     super.doLoadData();	
    }
  }
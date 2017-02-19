package sample.scene.upload.multiUpload1;



import java.util.List;






import com.bstek.dorado.view.DefaultViewModel;

/**

  // 用来保存上传文件的list，里面放置多个map。
  public static List fileList = new ArrayList();
  
  /**
  * @param parameters 传入参数
  * @param outParameters 传出参数
  * @throws Exception 默认不抛出异常
  */
  public void removeFile(ParameterSet parameters, ParameterSet outParameters)
  	String filePath = (String) parameters.getValue("filePath");
  	HttpDoradoContext context = (HttpDoradoContext) DoradoContext
  	HttpServletRequest request = context.getRequest();
  	String webappPath = request.getSession().getServletContext()
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
  
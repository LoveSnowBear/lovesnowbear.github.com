<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>多文件上传(有进度条)</title>
<link href="upload.css" type="text/css" rel="stylesheet" />
</head>
<body>
  <d:View config="sample.scene.upload.multiUpload2.UploadDemo">
   <d:Layout type="vflow">
      <d:Pane align="right">
         <d:Button id="buttonAdd" />&nbsp;
         <d:Button id="buttonRemove" />
      </d:Pane>
      <d:Pane align="center">
         <d:DataTable id="tableUploadedFiles" />
      </d:Pane>
    </d:Layout>

    <d:SubWindow id="swUpload">
      <d:Layout type="border">
        <d:Pane position="center" align="center">
             <d:DataTable id="tableUploadFiles" />
             <div id ="msg" style="height:300px;width:200px;display:none;text-align:center;">
             <d:Layout type="vflow" width="100%">
               <d:Pane>
                 <d:ProgressBar id="progressbar" />
               </d:Pane>
               <d:Pane>
                 正在上传第<d:Label id="fileIndex" text="0"/>个文件
               </d:Pane>
               <d:Pane>
                 已用时间：<d:Label id="elapsedTime" text="0"/>秒
               </d:Pane>
               <d:Pane>
                 上传大小：<d:Label id="totalRead" text="0" />/<d:Label id="totalFileSize" text="0" />KB
               </d:Pane>
             </d:Layout>
          </div>
        </d:Pane>
        <d:Pane position="bottom" width="100%">
          <d:Layout type="Hflow" width="100%">
            <d:Pane width="70px">
              <div id="filesDiv" style="display:ininle;position:relative;overflow:hidden;">
        	      <d:Button id="browseButton" />
        	      <form style="padding:0px;margin:0px;" target="upload" action="<%=request.getContextPath()%>/multiUpload2.d" id="uploadForm" name="uploadForm" encType="multipart/form-data" method="post">
                            <input type="file" id="file1" name="file1" class="hiddenFile"/>
        	      </form>
	      </div>
            </d:Pane>
            <d:Pane width="70px">
              <d:Button id="removeFileButton" />
            </d:Pane>
            <d:Pane align="right">
              <d:Button id="uploadButton" />
            </d:Pane>
          </d:Layout>
        </d:Pane>
      </d:Layout>
    </d:SubWindow>
    <iframe name="upload" style="display:none"></iframe>
  </d:View>
</body>
</html>

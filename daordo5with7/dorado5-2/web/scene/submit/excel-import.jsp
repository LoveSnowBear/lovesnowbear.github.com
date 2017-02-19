<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sample-center.css"/>
<title></title>
</head>
<body style="margin:2px;overflow:auto;">
<d:View config="sample.scene.submit.ExcelImport">
    <d:Layout type="border">
      <d:Pane position="top">
	  	<p class="hint">这是一个允许用户向服务端批量上传数据的例子。
	     	 首先<a href="<%=request.getContextPath() %>/excel.download.d" target="downloadFrame">下载Excel模板</a>，
	      	按照你的意愿增加、修改或删除一些数据并保存，然后点击右边“浏览”选择你刚才的文件并“上传”，服务端会解析这个Excel文件，你将在下面的表格中看到这些数据。
	  	</p>
        <form id="excelForm" style="padding-top:5px" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/excel.upload.d" target="uploadFrame">
	    	<input name="data" id="dataFile" type="file" class="TextEditor" style="font-size:13px;width:400" size="46">&nbsp;<d:Button id="buttonUpload"></d:Button>
	  	</form>		   
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
    <iframe name="downloadFrame" style="width:0;height:0px;display:none" ></iframe>
    <iframe name="uploadFrame" style="width:0;height:0;display:none" ></iframe>
</d:View>
</body>
</html>
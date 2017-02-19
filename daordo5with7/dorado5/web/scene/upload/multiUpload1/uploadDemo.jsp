<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>多文件上传(无进度条)</title>
</head>
<body>
  <d:View config="sample.scene.upload.multiUpload1.UploadDemo">
    <d:Layout type="border">
      <d:Pane position="top" align="right">
        <d:Button id="btnAddFile" />&nbsp;
        <d:Button id="btnRemoveFile" />
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableFiles" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

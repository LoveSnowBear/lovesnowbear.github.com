<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>文件上传</title>
</head>
<body style="font-size:9pt;">
  <d:View>
    <%
    String fileName = (String)request.getAttribute("fileName");
    String filePath = (String)request.getAttribute("filePath");
    if(fileName != null && !fileName.equals("") && filePath != null && !filePath.equals("")){
    %>
    <script>
      parent.uploadSuccess("<%=fileName%>","<%=filePath%>");
      SubWindow.hideParent();
    </script>
    <%
    }
    %>
     <center>    
       <form method="post" enctype="multipart/form-data"
              action="<%=request.getContextPath()%>/multiUpload1.upload.d">
          <d:Layout type="vflow" width="90%">
            <d:Pane valign="middle" height="60">
              请选择要上传的文件:
              <input class="TextEditor" type="file" name="file" style="width: 100%" size="46">
            </d:Pane>
            <d:Pane align="center">
              <input class="Button" type="submit" value=" 上传 ">
            </d:Pane>
          </d:Layout>
       </form>
      </center>
   </d:View>
</body>
</html>

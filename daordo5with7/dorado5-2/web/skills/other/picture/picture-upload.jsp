<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>图片上传</title>
</head>
<body>
  <d:View config="sample.skills.other.picture.PictureUpload">  
<%
String employee_id = (String)request.getAttribute("uploaded.employee_id");
if (employee_id != null) {
%>
    <script language="javascript">
      parent.refreshCurrentImage();
      SubWindow.hideParent();
      alert("\"<%=employee_id%>\"的肖像已上传成功！");
    </script>  
<%
}
else {
%>
    <center>    
      <form method="post" enctype="multipart/form-data"
        action="<%=request.getContextPath()%>/picture.upload.d">
        <input type="hidden" name="employee_id" value="<%=request.getParameter("employee_id")%>">
        <d:Layout type="vflow" width="90%">
          <d:Pane valign="middle" height="60">
            请选择要上传的文件:
            <input class="TextEditor" type="file" name="file" style="width: 100%">
          </d:Pane>
          <d:Pane align="center">
            <input class="Button" type="submit" value=" 上传 ">
          </d:Pane>
        </d:Layout>
      </form>
    </center> 
<%
}
%> 
  </d:View>
</body>
</html>


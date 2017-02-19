<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title></title>
</head>
<body>
<script>
var fileName = "<%=request.getAttribute("fileName")%>";
var ds = parent.datasetEmployee;
ds.parameters().setValue("fileName",fileName);
ds.flushDataAsync(function(success){
  if(success){
    alert("成功上传" + ds.getPossibleRecordCount()+"条记录.");
  }
});
</script>
</body>
</html>

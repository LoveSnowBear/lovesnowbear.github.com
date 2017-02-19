<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.table.test.DataTable">
    <%
    out.println(sample.skills.table.test.CssOutputter.getCssString("Table"));
    %>
    <d:DataTable id="tableEmployee" />
  </d:View>
</body>
</html>

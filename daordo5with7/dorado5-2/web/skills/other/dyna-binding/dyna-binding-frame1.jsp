<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.other.dynaBinding.DynaBinding_Frame1">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:Button id="buttonOpenDialog" />
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

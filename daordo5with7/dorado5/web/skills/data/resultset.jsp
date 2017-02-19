<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.data.ResultSet">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

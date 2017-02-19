<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body>
  <d:View config="sample.skills.other.dynaBinding.DynaBinding_Frame1_Dialog">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:DataPilot id="datapilotEmployee" />
      </d:Pane>
      <d:Pane position="center">
        <d:AutoForm id="formEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

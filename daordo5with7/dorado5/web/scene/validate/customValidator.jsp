<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>自定义校验器</title>
</head>
<body style="margin: 0px; overflow: hidden;">
  <d:View config="sample.scene.validate.custom.CustomValidator">
  <d:Layout type="border">
    <d:Pane position="top">
      <d:AutoForm id="formEmployee" />
    </d:Pane>
    <d:Pane position="center">
    <d:DataTable id="tableEmployee" />
    </d:Pane>
    <d:Pane position="bottom">
    <d:Layout type="Hflow" width="100%">
      <d:Pane>
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
      <d:Pane>
      </d:Pane>
      <d:Pane width="1">
        <d:Button id="buttonSave" />
      </d:Pane>
    </d:Layout>
    </d:Pane>
  </d:Layout>
  </d:View>
</body>
</html>

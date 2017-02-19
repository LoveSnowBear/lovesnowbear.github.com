<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="margin:0px;padding:0px;overflow:hidden;">
  <d:View config="sample.scene.submit.SimpleRecord1">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:AutoForm id="formEmployee" />
        <d:Layout type="Hflow" height="1">
          <d:Pane>
            <d:DataPilot id="datapilotEmployee" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonSave" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
      <d:Pane position="bottom" align="right">
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

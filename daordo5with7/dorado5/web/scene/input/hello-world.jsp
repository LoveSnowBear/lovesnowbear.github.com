<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="margin:0px;overflow:hidden;">
  <d:View config="sample.scene.input.HelloWorld">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:MenuBar id="menubar1" />
        <d:AutoForm id="formCondition" />
        <d:Layout type="Hflow" width="100%" height="30">
          <d:Pane width="1">
            <d:Button id="buttonCreateEmployee" />
          </d:Pane>
          <d:Pane width="1">
            <d:Button id="buttonEditEmployee" />
          </d:Pane>
          <d:Pane width="1">
            <d:Button id="buttonRaiseSalary" />
          </d:Pane>
          <d:Pane></d:Pane>
          <d:Pane width="350" align="right">
            <d:PagePilot id="pagepilotEmployee" />
          </d:Pane>
          <d:Pane width="80">
            <d:Button id="buttonQuery" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
      <d:Pane position="right">
      </d:Pane>
      <d:Pane position="bottom">
      </d:Pane>
    </d:Layout>
    
    <d:SubWindow id="subWindowEmployee">
      <d:AutoForm id="formEmployee" />
      <d:Layout type="Hflow" width="100%" height="30">
        <d:Pane align="left">
          <d:Button id="buttonDeleteCurrentEmployee" />
        </d:Pane>
        <d:Pane width="80">
          <d:Button id="buttonSubmitCurrentEmployee" />
        </d:Pane>
        <d:Pane width="80">
          <d:Button id="buttonCancelCurrentEmployee" />
        </d:Pane>
      </d:Layout>
    </d:SubWindow>
  </d:View>
</body>
</html>

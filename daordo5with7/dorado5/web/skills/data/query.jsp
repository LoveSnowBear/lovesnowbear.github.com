<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
</head>
<body>
  <d:View config="sample.skills.data.Query">
    <d:Layout type="vflow" width="100%" height="100%">
      <d:Pane>
        <d:AutoForm id="formCondition" />
      </d:Pane>
      <d:Pane align="right" >
        <d:PagePilot id="pilotEmployee" />
      </d:Pane>
      <d:Pane height="100%">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

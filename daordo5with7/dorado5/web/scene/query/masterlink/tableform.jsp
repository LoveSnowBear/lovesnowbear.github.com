<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="margin:0px;padding:0px;overflow:hidden;">
  <d:View config="sample.scene.query.masterlink.TableForm">
  <d:Layout type="border">
    <d:Pane position="center">
      <d:DataTable id="tableEmployee" />
    </d:Pane>
    <d:Pane position="bottom">
      <d:AutoForm id="formEmployee" />
    </d:Pane>
  </d:Layout>
    
    
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>选择员工</title>
</head>
<body>
  <d:DropDownView config="sample.scene.input.inputAssist.DropDownEmployeeMultiSel">
    <d:Layout type="border">
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
      <d:Pane position="bottom" align="right">
        <d:Button id="buttonOK" />
      </d:Pane>
    </d:Layout>
  </d:DropDownView>
</body>
</html>

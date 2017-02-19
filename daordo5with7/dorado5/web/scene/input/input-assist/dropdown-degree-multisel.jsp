<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body>
  <d:DropDownView config="sample.scene.input.inputAssist.DropDownDegreeMultiSel">
    <d:Layout type="border">
      <d:Pane position="center">
        <d:DataTable id="tableDegree" />
      </d:Pane>
      <d:Pane position="bottom" align="right">
        <d:Button id="buttonOK" />
      </d:Pane>
    </d:Layout>
  </d:DropDownView>
</body>
</html>

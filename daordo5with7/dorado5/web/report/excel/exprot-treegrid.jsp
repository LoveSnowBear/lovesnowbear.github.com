<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.report.excel.TreeGrid">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:Button id="buttonExport2Excel" />
      </d:Pane>
      <d:Pane position="center">
        <d:TreeGrid id="treegridProject" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>主页面</title>
<script src="nav.js"></script>
</head>
<body style="margin:0px;padding:0px;overflow:hidden;">
  <d:View config="sample.scene.main.Style3">
    <d:SplitPanel id="spMain" showButtons="true">
      <d:OutlookBar id="olMain" />
    <d:Splitter />
      <d:TabSet id="tabsetMain" />
    </d:SplitPanel>
  </d:View>
</body>
</html>

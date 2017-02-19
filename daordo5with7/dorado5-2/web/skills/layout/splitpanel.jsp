<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
  <d:View>
    <d:SplitPanel id="splitpanel1" orientation="horizontal" width="100%" height="100%" position="150" showButtons="true">
      <div style="width: 100%; height: 100%; background-color: #CCFFFF">&nbsp;</div>
    <d:Splitter />
      <d:SplitPanel id="splitpanel2" orientation="vertical" width="100%" height="100%" position="150" showButtons="true">
        <div style="width: 100%; height: 100%; background-color: #FFDDFF">&nbsp;</div>
      <d:Splitter />
        <d:SplitPanel id="splitpanel3" orientation="horizontal" width="100%" height="100%" position="150" showButtons="false">
          <div style="width: 100%; height: 100%; background-color: #FFFFB3">&nbsp;</div>
        <d:Splitter />
          <d:SplitPanel id="splitpanel4" orientation="vertical" width="100%" height="100%" position="150" showButtons="false">
            <div style="width: 100%; height: 100%; background-color: #FFFFFF">&nbsp;</div>
          <d:Splitter />
            <div style="width: 100%; height: 100%; background-color: #F0F0F0">&nbsp;</div>
          </d:SplitPanel>
        </d:SplitPanel>
      </d:SplitPanel>
    </d:SplitPanel>
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
<d:View config="sample.integration.chart.combine.CombineView">
  <d:SplitPanel id="splitpanel2" orientation="vertical" position="230" width="100%" height="100%" showButtons="true">
    <d:Layout type="border">
      <d:Pane position="center">
        <d:DataTable id="table1" />
      </d:Pane>
      <d:Pane position="bottom">
        <d:PagePilot id="pagepilot1" />
      </d:Pane>
    </d:Layout>
  <d:Splitter />    
    <div style="width: 100%; height: 100%;">
      <iframe name="charFrame" src="" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0"></iframe>
    </div>
  </d:SplitPanel>
</d:View>
</body>
</html>

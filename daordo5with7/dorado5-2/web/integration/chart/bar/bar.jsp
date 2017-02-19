<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d"%>
<html>
<body style="margin: 0; overflow: hidden">
<d:View config="sample.integration.chart.bar.BarView">
  <d:SplitPanel id="splitpanel1" position="200" width="100%" height="100%" showButtons="false">
    <d:DataTree id="treeNav" />
    <d:Splitter />
    <d:SplitPanel id="splitpanel2" orientation="vertical" position="200" width="100%" height="100%" showButtons="true">
      <d:DataTable id="tableEmployee" />
    <d:Splitter />
      <div style="width: 100%; height: 100%;">
        <iframe name="barFrame" src="" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0"></iframe>
      </div>
    </d:SplitPanel>
  </d:SplitPanel>

  <d:SubWindow id="subwindowDetail">
    <d:AutoForm id="formEmployeeDetail" />
  </d:SubWindow>
</d:View>
</body>
</html>

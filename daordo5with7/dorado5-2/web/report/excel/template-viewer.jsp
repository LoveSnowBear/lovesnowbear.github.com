<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.report.excel.TemplateViewer">
    <d:Layout type="border">
      <d:Pane position="top" style="background-color: buttonface">
        <d:Layout type="Hflow" width="100%">
          <d:Pane width="100%">
            <d:Label id="labelTemplate" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonShowReport" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonGetTemplate" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center" showBorder="true">
        <iframe name="frameReport" frameborder="0" style="width: 100%; height: 100%"></iframe>
      </d:Pane>
    </d:Layout>    
  </d:View>
</body>
</html>

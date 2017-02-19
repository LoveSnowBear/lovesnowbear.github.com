<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.report.excel.ReadOnlyReport">
    <d:Layout type="border">
      <d:Pane position="top" style="background-color: buttonface">
        <d:Layout type="Hflow">
          <d:Pane>
            请选择一个虚拟的用户以访问报表:
          </d:Pane>
          <d:Pane>
            <d:RadioGroup id="editorUser" />
          </d:Pane>
          <d:Pane valign="bottom">
            <d:Button id="buttonRefreshReport" />
          </d:Pane>
          <d:Pane valign="bottom">
            <d:Button id="buttonShowReport" />
          </d:Pane>
          <d:Pane valign="bottom">
            <d:Button id="buttonGetTemplate" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center" showBorder="true">
        <div id="frameDiv" style="width: 100%; height: 100%">
        </div>
      </d:Pane>
    </d:Layout>    
  </d:View>
</body>
</html>


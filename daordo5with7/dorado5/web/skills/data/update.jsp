<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.data.Update">
    <d:SplitPanel id="splitpanel1" orientation="vertical" width="100%" height="100%" position="70%">
      <d:Layout type="border" padding="1">
        <d:Pane position="top">
          <d:Layout type="Hflow">
            <d:Pane>
              <d:Button id="buttonSave" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonDeleteSelection" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonRaiseSalary" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonSaveAndLog" />
            </d:Pane>
          </d:Layout>
        </d:Pane>
        <d:Pane position="center">
          <d:DataTable id="tableEmployee" />
        </d:Pane>
      </d:Layout>
    <d:Splitter />
      <d:DataTable id="tableLog" />
    </d:SplitPanel>
  </d:View>
</body>
</html>

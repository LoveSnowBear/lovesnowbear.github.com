<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.admin.SampleTreeMaintain">
    <d:SplitPanel id="splitpanel1" orientation="horizontal" position="200" showButtons="false">
      <d:DataTree id="treeSample" />
    <d:Splitter />
      <d:Layout type="border">
        <d:Pane position="center">
          <d:TabSet id="tabsetForm">
            <d:Tab name="tabCategory">
              <d:AutoForm id="formCategory" />
            </d:Tab>
            <d:Tab name="tabSample">
              <d:AutoForm id="formSample" />
            </d:Tab>
          </d:TabSet>
        </d:Pane>
        <d:Pane position="bottom" align="right">
          <d:Layout type="Hflow">
            <d:Pane>
              <d:Button id="buttonUpdate" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonCancel" />
            </d:Pane>
          </d:Layout>
        </d:Pane>
      </d:Layout>
    </d:SplitPanel>
  </d:View>
</body>
</html>

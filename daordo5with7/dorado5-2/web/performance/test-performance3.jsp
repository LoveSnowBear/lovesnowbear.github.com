<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.performance.TestPerformance3">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:Layout type="Hflow">
          <d:Pane>
            <d:Button id="buttonCopy" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonDelete" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center">
        <d:SplitPanel id="splitpanel1" orientation="horizontal" position="50%">
          <d:DataTable id="table1" />
        <d:Splitter />
          <d:DataTable id="table2" />
        </d:SplitPanel>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

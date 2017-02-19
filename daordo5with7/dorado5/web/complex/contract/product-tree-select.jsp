<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>选择产品</title>
</head>
<body>
  <d:View config="sample.complex.contract.ProductTreeSelect">
    <d:Layout type="border">
      <d:Pane position="center">
        <d:DataTree id="treeProduct" />
      </d:Pane>
      <d:Pane position="bottom" align="right">
        <d:Layout type="Hflow">
          <d:Pane>
            <d:Button id="buttonInsert" />
          </d:Pane>
          <d:Pane>
           <d:Button id="buttonInsertAndClose" />
          </d:Pane>
        </d:Layout>        
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

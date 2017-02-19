<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.complex.contract.ContractQuery">
    <d:Layout type="vflow" height="100%">
      <d:Pane>
        <d:AutoForm id="formCondition" />
      </d:Pane>
      <d:Pane align="right">
        <d:Layout type="Hflow">
          <d:Pane>
            <d:Button id="buttonQuery" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonAdd" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonEdit" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonDelete" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane height="100%">
        <d:DataTable id="tableContract" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

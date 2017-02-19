<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>
<%
out.print(("add".equals(request.getParameter("op")))?"新增合同":"查看/修改合同");
%>
</title>
</head>
<body>
  <d:View config="sample.complex.contract.ContractMaintain">
    <d:Layout type="vflow" height="100%">
      <d:Pane>
        <d:AutoForm id="formContract" />
      </d:Pane>
      <d:Pane align="right">
        <d:Layout type="Hflow">
          <d:Pane>
            <d:Button id="buttonCopyAdd" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonBatchAdd" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonDelete" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane height="100%">
        <d:DataTable id="tableContractItems" />
      </d:Pane>
      <d:Pane align="right">
        <d:Layout type="Hflow">
          <d:Pane>
            <d:Button id="buttonSave" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonSaveAndBack" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonBack" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="overflow: hidden">
  <d:View config="sample.skills.table.Table">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:AutoForm id="formOption" />
        <br>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

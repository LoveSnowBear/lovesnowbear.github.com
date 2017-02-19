<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.table.DataBlock">
    <d:Layout type="border">
      <d:Pane position="center">
        <d:DataBlock id="datablockEmployee" />
      </d:Pane>
      <d:Pane position="bottom">
        <d:AutoForm id="formEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

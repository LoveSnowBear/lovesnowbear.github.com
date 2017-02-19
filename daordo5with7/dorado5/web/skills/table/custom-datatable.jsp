<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.table.CustomDataTable">
    <d:Layout type="vflow">
      <d:Pane>
        <p class="hint">开发人员可以通过DataTable提供的各种属性和事件对表格的显示方式进行定制.
  您在下方的表格中所看到的各种效果都是通过表格列的onRefresh事件实现的.</p>
      </d:Pane>
      <d:Pane>
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

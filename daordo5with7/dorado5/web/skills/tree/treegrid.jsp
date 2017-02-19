<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.tree.TreeGrid">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">树型表格实现了与数据表格相似的性能优化,可以支持对大数据量的展示和操作.<br>
注意: 表中的进度条是利用ProgressBar控件结合Column的onCreateCellRenderer事件实现嵌入的.</p>
      </d:Pane>
      <d:Pane position="center">
        <d:TreeGrid id="treegridProject" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.performance.TestPerformance2">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">本例向您展示了dorado5在单次通过DataTable显示2000条记录时的性能表现.<br>
  由于本页面中包含了2000条的数据的XML信息, 整个HTML的内容超过了300K.
  所以如果您的网速不够快的话, 页面弹出的速度仍可能会有点慢.<br>
  注意: 尽管如此, 考虑到浏览器的承受能力, 我们仍不建议您一次性的向客户端输出如此多的数据!</p>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="table1" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

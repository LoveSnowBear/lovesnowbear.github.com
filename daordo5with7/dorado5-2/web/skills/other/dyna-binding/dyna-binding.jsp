<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.other.dynaBinding.DynaBinding">
    <d:Layout type="vflow" height="100%">
      <d:Pane height="1">
        <p class="hint">
          本例演示了如何实现动态的数据绑定、跨越浏览器框架的数据绑定.<br>
          注意： 此处的多页标签中的内容分别是3个IFrame，它们引用了3个不同的JSP。
        </p>
      </d:Pane>
      <d:Pane height="1">
        <d:DataPilot id="datapilot" />
      </d:Pane>
      <d:Pane height="100%">
        <d:TabSet id="tabset" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

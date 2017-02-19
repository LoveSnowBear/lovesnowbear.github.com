<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body>
  <d:View>
    <p class="hint">您在下面看到的是在同一个页面中的同一个视图模型的三个实例.
dorado通过命名空间的方式有效的避免了各个视图模型的JavaScript之间的相互混淆和冲突!</p>
    <d:SubWindow id="window1" title="Portlet1" left="20" top="80" width="400" height="200" showCloseButton="true">
      <d:View config="sample.skills.other.Portlet" namespace="ns1">
        <d:DataTable id="tableEmployee" />
      </d:View>
    </d:SubWindow>

    <d:SubWindow id="window2" title="Portlet2" left="120" top="180" width="400" height="200" showCloseButton="true">
      <d:View config="sample.skills.other.Portlet" namespace="ns2">
        <d:DataTable id="tableEmployee" />
      </d:View>
    </d:SubWindow>

    <d:SubWindow id="window3" title="Portlet3" left="220" top="280" width="400" height="200" showCloseButton="true">
      <d:View config="sample.skills.other.Portlet" namespace="ns3">
        <d:DataTable id="tableEmployee" />
      </d:View>
    </d:SubWindow>

  </d:View>
</body>
</html>

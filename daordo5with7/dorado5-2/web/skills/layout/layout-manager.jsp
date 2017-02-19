<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body>
  border布局:
  <d:Layout type="border" border="1" borderColor="gray" width="300" height="200" padding="8px">
    <d:Pane position="top" style="background-color: #CCFFFF">
      top
    </d:Pane>
    <d:Pane position="left" style="background-color: #FFDDFF">
      left
    </d:Pane>
    <d:Pane position="center" style="background-color: #F0F0F0">
      center
    </d:Pane>
    <d:Pane position="right" style="background-color: #FFFFB3">
      right
    </d:Pane>
    <d:Pane position="bottom" style="background-color: #D7D7FF">
      bottom
    </d:Pane>
  </d:Layout>

  <br>

  hflow布局:
  <d:Layout type="hflow" border="1" borderColor="gray" height="60" padding="8px">
    <d:Pane style="background-color: #CCFFFF">
      pane1
    </d:Pane>
    <d:Pane style="background-color: #FFDDFF">
      pane2
    </d:Pane>
    <d:Pane style="background-color: #F0F0F0">
      pane3
    </d:Pane>
    <d:Pane style="background-color: #FFFFB3">
      pane4
    </d:Pane>
    <d:Pane style="background-color: #D7D7FF">
      pane5
    </d:Pane>
  </d:Layout>

  <br>

  vflow布局:
  <d:Layout type="vflow" border="1" borderColor="gray" width="60" padding="8px">
    <d:Pane style="background-color: #CCFFFF">
      pane1
    </d:Pane>
    <d:Pane style="background-color: #FFDDFF">
      pane2
    </d:Pane>
    <d:Pane style="background-color: #F0F0F0">
      pane3
    </d:Pane>
    <d:Pane style="background-color: #FFFFB3">
      pane4
    </d:Pane>
    <d:Pane style="background-color: #D7D7FF">
      pane5
    </d:Pane>
  </d:Layout>

  <br>

  混合布局:
  <d:Layout type="border" border="1" borderColor="gray" width="500" height="300" padding="8px">
    <d:Pane position="top" align="right" style="background-color: #CCFFFF">
      <d:Layout type="hflow" border="1" borderColor="gray" padding="8px" style="background-color: #FFFFB3">
        <d:Pane>
          pane1
        </d:Pane>
        <d:Pane>
          pane2
        </d:Pane>
        <d:Pane>
          pane3
        </d:Pane>
        <d:Pane>
          pane4
        </d:Pane>
        <d:Pane>
          pane5
        </d:Pane>
      </d:Layout>
    </d:Pane>
    <d:Pane position="left" style="background-color: #FFDDFF">
      <d:Layout type="vflow" border="1" borderColor="gray" height="100%" padding="8px" style="background-color: #D7D7FF">
        <d:Pane>
          pane1
        </d:Pane>
        <d:Pane>
          pane2
        </d:Pane>
        <d:Pane>
          pane3
        </d:Pane>
        <d:Pane>
          pane4
        </d:Pane>
        <d:Pane>
          pane5
        </d:Pane>
        <d:Pane>
          pane6
        </d:Pane>
      </d:Layout>
    </d:Pane>
    <d:Pane position="center" style="background-color: #F0F0F0">
      center
    </d:Pane>
  </d:Layout>
</body>
</html>

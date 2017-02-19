<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.controls.Menu">
    <d:SplitPanel id="spiltpanel" height="100%" orientation="horizontal" position="120" showButtons="true">
      <d:OutlookBar id="outlookbar1" >
      </d:OutlookBar>
    <d:Splitter />
      <div style="width: 100%; height: 100%; padding: 10">
        <p>
          与菜单绑定的工具栏<br>
          <d:MenuBar id="menubar1" />
        </p>
        <br>
        <p>
          与菜单绑定的按钮<br>
          <d:Button id="button1" />
        </p>
        <br>
        <p>
          鼠标右键菜单<br>
          <d:SubWindow id="subwindowPopupContainer" title="请在此出单击鼠标右键 ..." width="300" height="200" draggable="false" showMinimizeButton="false"  showMaximizeButton="false" showCloseButton="false">
          </d:SubWindow>
        </p>
      </div>
    </d:SplitPanel>
  </d:View>
</body>
</html>

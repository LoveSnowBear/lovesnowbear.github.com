<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>表格属性设置</title>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.table.test.TableProperties">
    <d:SplitPanel id="sp1" orientation="horizontal" position="350" width="100%" height="100%" showButtons="true">
      <d:SubWindow
        id="subwindow1"
        title="属性设置窗口"
        width="100%"
        height="100%"
        draggable="false"
        resizable="false"
        status="normal"
        showMinimizeButton="false"
        showMaximizeButton="true"
        showCloseButton="false">
        <d:OutlookBar id="outlookBar1" width="100%" height="100%">
          <d:OutlookBarGroup name="group1" label="表格属性设置">
            <div style="width: 100%; height: 100%; overflow: auto">
              <d:AutoForm id="formTable"/>
            </div>
          </d:OutlookBarGroup>
          <d:OutlookBarGroup name="group2" label="列属性设置">
            <div style="width: 100%; height: 100%; overflow: auto">
              <d:DataTable id="tableColumn"/>
              <d:AutoForm id="formColumn"/>
            </div>
          </d:OutlookBarGroup>
        </d:OutlookBar>
      </d:SubWindow>
      <d:Splitter/>
      <d:SubWindow
        id="subwindow3"
        title="预览窗口"
        width="100%"
        height="100%"
        draggable="false"
        resizable="false"
        status="normal"
        showMinimizeButton="false"
        showMaximizeButton="true"
        showCloseButton="false">
        <d:DataTable id="tableEmployee"/>
      </d:SubWindow>
    </d:SplitPanel>
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>表格皮肤设置</title>
<link rel="stylesheet" type="text/css" href="../../../sample-center.css"/>
</head>
<body style="overflow: hidden; margin: 0">
  <d:View config="sample.skills.table.test.TableCss">
    <d:SplitPanel id="sp1" orientation="horizontal" position="50%" width="100%" height="100%" showButtons="true">
      <d:SubWindow
        id="subwindow1"
        title="CSS编辑窗口"
        width="100%"
        height="100%"
        draggable="false"
        resizable="false"
        status="normal"
        showMinimizeButton="false"
        showMaximizeButton="true"
        showCloseButton="false">
        <d:SplitPanel id="sp2" orientation="vertical" position="60%" width="100%" height="100%" showButtons="true">
          <d:DataTable id="tableCSS"/>
          <d:Splitter/>
          <d:TabSet id="tabset1" currentTab="tab2">
            <d:Tab name="tab1" label="自定义CSS">
              <d:AutoForm id="formCss"/>
            </d:Tab>
            <d:Tab name="tab2" label="参考代码">
              <p class="hint" style="width: 100%; height: 100%">
                <d:DataLabel id="datalabelSample"/>
              </p>
            </d:Tab>
          </d:TabSet>
        </d:SplitPanel>
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
        <iframe name="cssView" src="table-review.jsp" frameborder="0" marginWidth="0" style="width:100%; height:100%">      </iframe>
      </d:SubWindow>
    </d:SplitPanel>
  </d:View>
</body>
</html>

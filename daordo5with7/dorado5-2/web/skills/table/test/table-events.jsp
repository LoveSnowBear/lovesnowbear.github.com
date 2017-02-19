<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>表格事件设置</title>
<LINK REL ="stylesheet" TYPE="text/css" HREF="stylesheet.css" TITLE="Style">
<link rel="stylesheet" type="text/css" href="../../../sample-center.css"/>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.table.test.TableEvents">
  <d:SplitPanel id="sp1" orientation="horizontal" position="50%" width="100%" height="100%" showButtons="true">
    <d:SubWindow
      id="subwindow1"
      title="事件定义窗口"
      width="100%"
      height="100%"
      draggable="false"
      resizable="false"
      status="normal"
      showMinimizeButton="false"
      showMaximizeButton="true"
      showCloseButton="false">
      <d:OutlookBar id="outlookBar1" width="100%" height="100%">
        <d:OutlookBarGroup name="group1">
          <d:Layout type="border">
            <d:Pane position="top" height="145px">
              <d:DataTable id="tableEvents"/>
            </d:Pane>
            <d:Pane position="center">
              <d:TabSet id="tabset1">
                <d:Tab name="tab1" label="事件说明" padding="8">
                  <d:DataLabel id="datalabelRemark"/>
                </d:Tab>
                <d:Tab name="tab2" label="事件代码">
                  <d:AutoForm id="formEvents"/>
                </d:Tab>
                <d:Tab name="tab3" label="事件范例" padding="4">
                  <p class="hint" style="width: 100%; height: 100%">
                    <d:DataLabel id="datalabelSample"/>
                  </p>
                </d:Tab>
              </d:TabSet>
            </d:Pane>
          </d:Layout>
        </d:OutlookBarGroup>
        <d:OutlookBarGroup name="group2">
          <d:Layout type="border">
            <d:Pane position="center">
              <d:SplitPanel id="sp2" orientation="horizontal" position="100" width="100%" height="100%" showButtons="true">
                <d:DataTable id="tableColumns"/>
                <d:Splitter/>
                <d:DataTable id="tableColumnEvents"/>
              </d:SplitPanel>
            </d:Pane>
            <d:Pane position="bottom" height="290px">
              <d:TabSet id="tabset2">
                <d:Tab name="tab1" label="事件范例">
                  <p class="hint" style="width: 100%; height: 100%;padding:20px">
                    <d:DataLabel id="datalabelColumnSample"/>
                  </p>
                </d:Tab>
                <d:Tab name="tab2" label="事件代码">
                  <d:AutoForm id="formColumnEvents"/>
                </d:Tab>
              </d:TabSet>
            </d:Pane>
          </d:Layout>
        </d:OutlookBarGroup>
      </d:OutlookBar>
    </d:SubWindow>
    <d:Splitter/>
    <d:SubWindow
      id="subwindow2"
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

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.other.picture.Picture">
    <d:TabSet id="tabset1">
      <d:Tab name="tab1" label="按表单方式浏览" padding="16">
        <d:Layout type="border">
          <d:Pane position="top">
            <d:Layout type="Hflow">
              <d:Pane>
                <d:DataPilot id="datapilot1" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonUpload" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonDownload" />
              </d:Pane>
            </d:Layout>
          </d:Pane>
          <d:Pane position="center">
            <d:AutoForm id="formEmployee" />
          </d:Pane>
        </d:Layout>
      </d:Tab>
      <d:Tab name="tab2" label="按表格方式浏览">
        <d:DataTable id="tableEmployee" />
      </d:Tab>
      <d:Tab name="tab3" label="幻灯片方式浏览">
        <d:Layout type="border">
          <d:Pane position="top">
            <d:Layout type="Hflow">
              <d:Pane>
                <d:DataPilot id="datapilot2" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonZoomIn" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonZoomOut" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonReset" />
              </d:Pane>
            </d:Layout>
          </d:Pane>
          <d:Pane position="center" align="center" valign="middle" style="background-color: #F0F0F0">
            <d:DataLabel id="labelImage" />
          </d:Pane>
          <d:Pane position="bottom" align="center">
            <d:DataLabel id="labelEmployeeName" />
          </d:Pane>
        </d:Layout>
      </d:Tab>
    </d:TabSet>
  </d:View>
</body>
</html>

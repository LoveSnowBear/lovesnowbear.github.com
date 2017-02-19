<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="sample-center.css"/>
<title>Dorado Sample Center</title>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.SampleCenter">
    <d:SplitPanel id="splitpanel1" orientation="horizontal" position="0" width="100%" height="100%" padding="0">
      <d:SplitPanel id="splitpanel2" orientation="vertical" position="80%" width="100%" height="100%" padding="0" showButtons="true">
        <d:OutlookBar id="outlookbarNav" width="100%" height="100%">
          <d:OutlookBarGroup name="groupTree">
            <d:Tree id="treeSample"/>
          </d:OutlookBarGroup>
          <d:OutlookBarGroup name="groupSearch">
            <d:Layout type="border">
              <d:Pane position="top">
                <d:Layout type="Hflow" width="100%">
                  <d:Pane width="100%">
                    <d:TextEditor id="editorSearch" />
                  </d:Pane>
                  <d:Pane>
                    <d:Button id="buttonSearch" />
                  </d:Pane>
                </d:Layout>
              </d:Pane>
              <d:Pane position="center">
                <d:DataTree id="treeSearchResult" />
              </d:Pane>
            </d:Layout>
          </d:OutlookBarGroup>
        </d:OutlookBar>
      <d:Splitter/>
        <d:SubWindow id="windowDescription" title="说明" width="100%" height="100%" showMinimizeButton="false" showMaximizeButton="true" draggable="false" resizable="false">
          <div style="width: 100%; height: 100%; overflow: auto">
            <div id="divDescription" style="padding: 8px"></div>
          </div>
        </d:SubWindow>
      </d:SplitPanel>
    <d:Splitter/>
      <d:SubWindow id="windowSample" title="Sample" width="100%" height="100%" showMinimizeButton="false" showMaximizeButton="true" draggable="false" resizable="false">
        <div id="sssss" style="width: 100%; height: 100%; position: relative;">
          <iframe id="frameSample" name="sample" frameborder="0" style="width: 100%; height: 100%;" onload="hideCovering()">            </iframe>
          <div id="frameCovering" style="left: 0; top: 0; width: 100%; height: 100%; position: absolute; background-color: white; padding: 12; display: none">
            <table>
              <tr>
                <td>
                  <img src="images/loading.gif">
                </td>
                <td>
                  <b>Loading...</b>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </d:SubWindow>
    </d:SplitPanel>
  </d:View>
</body>
</html>

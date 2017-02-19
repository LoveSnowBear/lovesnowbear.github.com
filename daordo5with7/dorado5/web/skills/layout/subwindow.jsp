<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.layout.SubWindow">
    <d:Layout type="border" padding="0">
      <d:Pane position="top">
        <d:SubWindow id="windowToolbar" title="操作按钮" width="100%" draggable="false" resizable="false" showMinimizeButton="true"  showMaximizeButton="true" showCloseButton="false">
          <d:Layout type="Hflow">
            <d:Pane>
              <d:Button id="buttonNewWindow1" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonNewWindow2" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonCloseAll" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonShowExclusiveWindow" />
            </d:Pane>
          </d:Layout>
        </d:SubWindow>
      </d:Pane>
      <d:Pane position="center">
        <d:SubWindow id="windowContent" title="工作区" width="100%" height="100%" draggable="false" resizable="false" showMinimizeButton="false"  showMaximizeButton="true" showCloseButton="false">
          <div id="windowContainer" style="width: 100%; height: 100%; overFlow: auto">
          </div>
        </d:SubWindow>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

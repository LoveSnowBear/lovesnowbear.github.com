<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.other.RoleConfig">
    <d:Layout type="border">
      <d:Pane position="top">
        <d:Layout type="hflow">
          <d:Pane>
            角色
          </d:Pane>
          <d:Pane>
            <d:TextEditor id="editorRole" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonRefresh" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center">
        <d:SubWindow id="subwindow" width="100%" height="100%" draggable="false" resizable="false" showMinimizeButton="false" showMaximizeButton="false">
          <d:Layout type="border">
            <d:Pane position="top">
              <d:MenuBar id="menubar1" />
            </d:Pane>
            <d:Pane position="center">
              <d:DataTable id="tableEmployee" />
            </d:Pane>
            <d:Pane position="bottom">
              <d:Layout type="hflow" height="1">
                <d:Pane>
                  <d:Button id="button1" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="button2" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="button3" />
                </d:Pane>
              </d:Layout>
            </d:Pane>
          </d:Layout>
        </d:SubWindow>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

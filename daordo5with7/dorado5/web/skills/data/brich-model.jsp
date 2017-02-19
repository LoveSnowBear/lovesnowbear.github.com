<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="margin: 0; overflow: hidden">
<d:View config="sample.skills.data.BRichModel">
  <d:Layout type="border">
    <d:Pane position="top" height="200">
      <d:TabSet id="tabset1">
        <d:Tab name="model" label="对象模型">
          <d:Layout type="border">
            <d:Pane position="center">
              <d:Layout type="vflow">
                <d:Pane>
                  请在下面的编辑框中输入或选择用于测试的Script:
                </d:Pane>
                <d:Pane>
                  <d:TextEditor id="editorScript" />
                </d:Pane>
                <d:Pane align="right">
                  <d:Button id="buttonEvaluation" />
                </d:Pane>
              </d:Layout>
            </d:Pane>
            <d:Pane position="right">
              <p class="hint" style="width: 200; height: 100%">dorado的BRich Client拥有完整的对象模型,
提供了丰富的属性和方法结构, 以便于开发人员更加方便的使用和扩展dorado的功能.<br>
您也可以按下Ctrl+Shift+Alt+F12或Ctrl+Shift+Alt+F11调出dorado的客户端调试器.</p>
            </d:Pane>
          </d:Layout>
        </d:Tab>
        <d:Tab name="event" label="客户端事件">
          <d:Layout type="border">
            <d:Pane position="center">
              <d:Layout type="border">
                <d:Pane position="top">
                  事件日志:
                </d:Pane>
                <d:Pane position="center">
                  <d:TextEditor id="editorLog" />
                </d:Pane>
                <d:Pane position="bottom" align="right">
                  <d:Button id="buttonClear" />
                </d:Pane>
              </d:Layout>
            </d:Pane>
            <d:Pane position="right">
              <p class="hint" style="width: 200; height: 100%">dorado的BRich Client提供丰富的事件编程接口,
开发人员可以通过这些事件接口对视图进行定制.<br>
你可以在页面下方的表格中进行一系列的操作, 以便在日志框中观察事件的触发情况.</p>
            </d:Pane>
          </d:Layout>
        </d:Tab>
      </d:TabSet>
    </d:Pane>
    <d:Pane position="center">
      <d:Layout type="border">
        <d:Pane position="top">
          <d:DataPilot id="datapilotEmployee" />
        </d:Pane>
        <d:Pane position="center">
          <d:DataTable id="tableEmployee" />
        </d:Pane>
      </d:Layout>
    </d:Pane>
  </d:Layout>
</d:View>
</body>
</html>

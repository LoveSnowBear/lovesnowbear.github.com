<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="margin: 2; overflow: hidden">
  <d:View config="sample.skills.controls.Calendar">
    <d:Layout type="border">
      <d:Pane position="center">
        <d:Calendar id="calendarSchedule" />
      </d:Pane>
      <d:Pane position="right">
        <d:Layout type="vflow" width="200" height="100%">
          <d:Pane align="right">
            <d:Layout type="Hflow" padding="1">
              <d:Pane>
                <d:Button id="buttonAdd" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonEdit" />
              </d:Pane>
              <d:Pane>
                <d:Button id="buttonDelete" />
              </d:Pane>
            </d:Layout>
          </d:Pane>
          <d:Pane height="100%">
            <d:DataTable id="tableSchedule" />
          </d:Pane>
          <d:Pane>
            <p class="hint" style="width: 100%; height: 100%">
本例是一个简单的日程安排表.<br>
在制作时使用了一个Dataset来实现任务信息的分月下载,
并且我们可以利用Calendar的功能方便的对每个月的任务信息进行按天的索引,
这样我们就可以灵活的定制Calendar中单元格的显示方式.<br>
同时本例中还使用了Dataset的onFilterRecord事件来控制DataTable中要显示的记录,
利用SubWindow来代替传统开发模式中常用的模态窗口.<br>
(出于性能考虑, 我们不推荐您在Dataset的Client端数据较多的情况下使用onFilterRecord来过滤记录.)
            </p>
          </d:Pane>
        </d:Layout>
      </d:Pane>
    </d:Layout>
    <d:SubWindow id="subwindowTask" title="任务属性" width="350" height="260" draggable="true" resizable="true" showMinimizeButton="false"  showMaximizeButton="false" showCloseButton="true">
      <d:Layout type="border">
        <d:Pane position="top">
        <d:AutoForm id="formTask" />
        </d:Pane>
        <d:Pane position="center" align="right">
          <d:Layout type="Hflow">
            <d:Pane>
              <d:Button id="buttonOK" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonCancel" />
            </d:Pane>
          </d:Layout>
        </d:Pane>
      </d:Layout>
    </d:SubWindow>
  </d:View>
</body>
</html>

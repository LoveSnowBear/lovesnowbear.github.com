<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.data.MasterDetail2">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">连续的输入或修改多条主从记录并且一次性完成整个数据提交的动作.
在提交的过程中dorado会自动的获取到主表在数据库中产生的自动主键, 为您补充好主从表之间的外键,
重新提取服务器端的逻辑代码向Dataset中补充的数据, 并最终重新显示到界面当中.<br>
注意: 以下的这些的高级功能并非只支持dorado的直连数据库的开发模式!</p>
      </d:Pane>
      <d:Pane position="center">
        <d:SplitPanel id="splitpanel1" orientation="vertical" width="100%" height="100%" position="50%" showButtons="false">
          <d:Layout type="border">
            <d:Pane position="top">
              <d:Layout type="Hflow" width="100%" padding="0">
                <d:Pane>
                  <d:DataPilot id="datapilotMaster" />
                </d:Pane>
                <d:Pane align="right">
                  <d:Button id="buttonUpdate" />
                </d:Pane>
              </d:Layout>
            </d:Pane>
            <d:Pane position="center">
              <d:DataTable id="tableMaster" />
            </d:Pane>
          </d:Layout>
        <d:Splitter />
          <d:Layout type="border">
            <d:Pane position="top">
              <d:DataPilot id="datapilotDetail" />
            </d:Pane>
            <d:Pane position="center">
              <d:DataTable id="tableDetail" />
            </d:Pane>
          </d:Layout>
        </d:SplitPanel>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

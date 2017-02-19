<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.data.MasterDetail1">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">
          下列的两个Dataset已建立了主从绑定的关系. 从表总是会自动显示与主表当前记录相对应的数据.<br>
          注意: 从表中的员工信息并不是一次性的从服务器上下载下来的, 而是随着的主表当前记录的变化动态的从服务器上下载的.
        </p>
      </d:Pane>
      <d:Pane position="center">
        <d:SplitPanel id="splitpanel2" orientation="vertical" width="100%" height="100%" position="30%" showButtons="false">
          <d:DataTable id="tableBranch" />
        <d:Splitter />
          <d:DataTable id="tableEmployee" />
        </d:SplitPanel>
      </d:Pane>
      <d:Pane position="bottom" align="right">
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

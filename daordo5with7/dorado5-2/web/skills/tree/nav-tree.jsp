<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.tree.NavTree">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">
          您可以在右侧的表单修改部门名称, 新的名称将会自动更新到相应的树节点中.<br>
          您也可以尝试利用鼠标将树中的某个部门节点拖放到另外一个分公司当中.
        </p>
      </d:Pane>
      <d:Pane position="center">
        <d:SplitPanel id="splitpanel1" position="200" width="100%" height="100%" showButtons="false">
          <d:DataTree id="treeNav" />
        <d:Splitter />
          <d:Layout type="border" padding="1">
            <d:Pane position="top">
              <d:SubWindow id="window1" title="部门信息" width="100%" draggable="false" resizable="false" showMinimizeButton="true"  showMaximizeButton="true" showCloseButton="false" titleDblClickAction="minimize">
                <d:AutoForm id="formDept" />
              </d:SubWindow>
            </d:Pane>
            <d:Pane position="center">
              <d:SubWindow id="window2" title="员工信息" width="100%" height="100%" draggable="false" resizable="false" showMinimizeButton="false"  showMaximizeButton="true" showCloseButton="false">
                <d:DataTable id="tableEmployee" />
              </d:SubWindow>
            </d:Pane>
          </d:Layout>
        </d:SplitPanel>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

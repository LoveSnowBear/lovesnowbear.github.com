<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.tree.DynaDataTree">
    <d:Layout type="VFlow" width="400" height="100%">
      <d:Pane>
        <p class="hint">
          dorado中的数据树可以自动监听绑定的Dataset中记录的数据变化和删除等事件，
          但不能自动处理新增的操作（包括利用flushData()等操作从服务端新下载的记录）。
          因此当我们希望在数据树中能够出现与新增记录绑定的节点时必须手工进行添加。
        </p>
      </d:Pane>
      <d:Pane>
        <d:Layout type="HFlow">
          <d:Pane>
            请选择一个分公司:
          </d:Pane>
          <d:Pane>
            <d:TextEditor id="editorBranch" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonQuery" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane height="100%">
        <d:DataTree id="treeEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

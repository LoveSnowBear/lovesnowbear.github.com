<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.tree.DataTree">
    <d:TabSet id="tabset1">
      <d:Tab name="tab1" label="数据绑定树">
        <d:Layout type="border">
          <d:Pane position="center">
            <d:DataTree id="treeHR" />
          </d:Pane>
          <d:Pane position="right">
            <p class="hint" style="width: 200; height: 100%">数据树中的SimpleTreeLevel对象使您可以非常快速的将一组带有主从绑定的关系的Dataset显示为树状的结构.
同时, 数据树还可以借助Dataset的动态数据装载功能实现节点信息的动态装载, 以避免因为数据结构过于复杂而导致页面效率降低.<br>
本例树中的每一层节点代表了一个Dataset中的数据.</p>
          </d:Pane>
        </d:Layout>
      </d:Tab>
      <d:Tab name="tab2" label="递归绑定树">
        <d:Layout type="border">
          <d:Pane position="center">
            <d:DataTree id="treeCategory" />
          </d:Pane>
          <d:Pane position="right">
            <p class="hint" style="width: 200; height: 100%">数据树中的RecrusiveTreeLevel对象对象使您可以非常快速的定义出一棵递归结构的树.<br>
递归结构的数据树同样可以借助Dataset的动态数据装载功能实现节点信息的动态装载.</p>
          </d:Pane>
        </d:Layout>
      </d:Tab>
    </d:TabSet>
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.tree.ProductTree">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">使用Dorado的数据树可以轻松的制作出各种复杂的,可维护的树状列表.<br>
本例使用了CustomDataset来构造事实上并不存在的根节点.
另外,您还可以通过鼠标的拖拽操作来移动树中的节点.</p>
      </d:Pane>
      <d:Pane position="center">
        <d:SplitPanel id="splitpanel1" orientation="horizontal" width="100%" height="100%" showButtons="true">
          <d:DataTree id="treeProduct" />
        <d:Splitter />
          <d:TabSet id="tabsetDetail" showFrame="false">
            <d:Tab name="category" visible="false" padding="12">
              <d:Layout type="Hflow" height="30">
                <d:Pane>
                  <d:Button id="buttonAddCategory" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="buttonAddChildCategory" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="buttonDelCategory" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="buttonAddChildProduct" />
                </d:Pane>
              </d:Layout>
              <d:AutoForm id="formCategory" />
            </d:Tab>
            <d:Tab name="product" visible="false" padding="12">
              <d:Layout type="Hflow" height="30">
                <d:Pane>
                  <d:Button id="buttonAddProduct" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="buttonDelProduct" />
                </d:Pane>
              </d:Layout>
              <d:AutoForm id="formProduct" />
            </d:Tab>
          </d:TabSet>
          &nbsp;
        </d:SplitPanel>
      </d:Pane>
      <d:Pane position="bottom" align ="right" padding="6" style="background-color: #f0f0f0">
        <d:Button id="buttonSave" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

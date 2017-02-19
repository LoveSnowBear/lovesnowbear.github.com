<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sample-center.css"/>
<title></title>
</head>
<body style="margin:2px;overflow:auto;">
  <d:View config="sample.scene.query.TreeQuery">
    <d:Layout type="border">
      <d:Pane position="top">
      <p class="hint">
      这是一个快速定位树节点的例子，通过双击右边表格中的记录定位对应在左边树上的节点。这里展示了三种定位方法：<br>
      第一种，定位简单树节点。在层次确定的树中定位某个节点，为了给用户提供快速定位的能力提供了查询功能。<br>
      第二种，定位迭代树节点。在层次不确定的树中定位某个节点，当数据的不一致时给出了删除功能。（例如，产品048和产品050）<br>
      第三种，应对大体积树的方案。如果树节点非常多，可以在定位时仅在树上添加路径上的节点提高效率。
      </p>
      </d:Pane>
      <d:Pane position="center">
          <d:TabSet id="tabset1" >
            <d:Tab name="tab1">
                <d:Layout type="border">
                  <d:Pane position="top">
                  </d:Pane>
                  <d:Pane position="left" width="200">
                    <d:DataTree id="treeEmployee" />
                  </d:Pane>
                  <d:Pane position="center">
                    <d:Layout type="border">
                      <d:Pane position="top">
                        <d:AutoForm id="formCondition" />
                        <d:Layout type="Hflow" width="100%" height="25">
                          <d:Pane width="150">
                            <d:Button id="buttonGoSimpleNode" />
                          </d:Pane>
                          <d:Pane align="right">
                            <d:PagePilot id="pagepilotEmployee" />
                          </d:Pane>
                          <d:Pane width="70">
                            <d:Button id="buttonQuery" />
                          </d:Pane>
                        </d:Layout>
                      </d:Pane>
                      <d:Pane position="center">
                        <d:DataTable id="tableEmployee" />
                      </d:Pane>
                      <d:Pane position="bottom">
                      </d:Pane>
                    </d:Layout>
                  </d:Pane>
                  <d:Pane position="bottom">
                  </d:Pane>
                </d:Layout>
            </d:Tab>
            <d:Tab name="tab2">
                <d:Layout type="border">
                  <d:Pane position="top">
                  </d:Pane>
                  <d:Pane position="left" width="300">
                    <d:DataTree id="treeProduct" />
                  </d:Pane>
                  <d:Pane position="center" width="100%" height="100%">
                    <d:Layout type="border">
                      <d:Pane position="top">
                        <d:Button id="buttonGoRescursiveNode" />
                      </d:Pane>
                      <d:Pane position="center">
                        <d:DataTable id="tableProduct" />
                      </d:Pane>
                    </d:Layout>
                  </d:Pane>
                </d:Layout>
            </d:Tab>
            <d:Tab name="tab3">
            <jsp:include page="tree-query2-inner.jsp"/>
            </d:Tab>
          </d:TabSet>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

  <%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
  <%@ page language="java" pageEncoding="UTF-8"%>
  <d:View config="sample.scene.query.TreeQuery2" namespace="TreeQuery2">
    <script src="tree-query2.js" type="text/javascript"></script>
    <d:Layout type="border"  padding="0">
      <d:Pane position="center">
          <d:Layout type="border" padding="0">
            <d:Pane position="top">
            </d:Pane>
            <d:Pane position="left" width="200">
              <d:Layout type="border">
                <d:Pane position="top">
	                <d:CheckBox id="editorShowOnlyOnePath" />是否仅显示定位的节点路径
                </d:Pane>
                <d:Pane position="center">
                  <d:DataTree id="treeEmployee" />
                </d:Pane>
              </d:Layout>
            </d:Pane>
            <d:Pane position="center">
              <d:Layout type="border">
                <d:Pane position="top">
                  <d:AutoForm id="formCondition"/>
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
      </d:Pane>
    </d:Layout>
  </d:View>

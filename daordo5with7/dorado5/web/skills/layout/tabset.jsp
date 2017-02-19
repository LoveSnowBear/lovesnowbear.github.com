<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.layout.TabSet">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">
          此例中的后4个标签是利用IFrame(FrameTab)实现的.
        </p>
      </d:Pane>
      <d:Pane position="center">
        <d:TabSet id="tabset1">
          <d:Tab name="tab1">
            <d:Layout type="border">
              <d:Pane position="top">
                <d:Layout type="Hflow">
                  <d:Pane>
                    <d:Button id="buttonAddTab" />
                  </d:Pane>
                  <d:Pane>
                    <d:Button id="buttonDisableCurrent" />
                  </d:Pane>
                  <d:Pane>
                    <d:Button id="buttonRemoveCurrent" />
                  </d:Pane>
                  <d:Pane>
                    <d:Button id="buttonRemoveAll" />
                  </d:Pane>
                </d:Layout>
              </d:Pane>
              <d:Pane position="center">
                <d:TabSet id="tabset2" height="300">
                </d:TabSet>
              </d:Pane>
            </d:Layout>
          </d:Tab>
          <d:Tab name="tab2">
            <d:Layout type="border">
              <d:Pane position="top">
                <d:Button id="buttonHideTabs" />
              </d:Pane>
              <d:Pane position="center">
                <d:TabSet id="tabset3">
                  <d:Tab name="tab1">
                    <p style="margin: 20">
                      标签1中的文字
                    </p>
                  </d:Tab>
                  <d:Tab name="tab2">
                    <p style="margin: 20">
                      标签2中的文字
                    </p>
                  </d:Tab>
                  <d:Tab name="tab3">
                    <p style="margin: 20">
                      标签3中的文字
                    </p>
                  </d:Tab>
                  <d:Tab name="tab4">
                    <p style="margin: 20">
                      标签4中的文字
                    </p>
                  </d:Tab>
                  <d:Tab name="tab5">
                    <p style="margin: 20">
                      标签5中的文字
                    </p>
                  </d:Tab>
                </d:TabSet>
              </d:Pane>
              <d:Pane position="right">
                <d:DataTable id="tableTab" />
              </d:Pane>
            </d:Layout>
          </d:Tab>
          <d:Tab name="tab3">
            <div style="width: 100%; height: 100%; background-color: #FFDDFF"></div>
          </d:Tab>
          <d:Tab name="tab4">
            <div style="width: 100%; height: 100%; background-color: #FFFFB3"></div>
          </d:Tab>
          <d:Tab name="tab5">
            <div style="width: 100%; height: 100%; background-color: #CCFFFF"></div>
          </d:Tab>
        </d:TabSet>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

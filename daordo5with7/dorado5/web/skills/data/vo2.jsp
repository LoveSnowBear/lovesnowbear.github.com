<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="margin: 0; overflow: hidden">
  <d:View config="sample.skills.data.VO2">
    <d:SplitPanel id="splitpanel1" orientation="horizontal" position="200" width="100%" height="100%" showButtons="true">
      <d:DataTree id="treeEmployee" />
    <d:Splitter />
      <d:Layout type="border">
        <d:Pane position="top">
          <p class="hint" style="width: 100%">
            本例利用Hibernate提取了一组Branch（分公司）对象，
            其中Branch对象中包含了Dept（部门）的集合，Dept对象中又包含了Employee（员工）的集合。
            它们之间的关系如下：<br>
            <br>
            &nbsp;&nbsp;<img src="hr-inherit.gif" style="align: center"><br>
            <br>
            注意观察本例的视图模型中Dataset的MasterLink以及MasterLink中detailProperty的设置。
          </p>
        </d:Pane>
        <d:Pane position="center" padding="10">
          <d:TabSet id="tabsetContent">
            <d:Tab name="tabBranch">
              <d:AutoForm id="formBranch" />
            </d:Tab>
            <d:Tab name="tabDept">
              <d:AutoForm id="formDept" />
            </d:Tab>
            <d:Tab name="tabEmployee">
              <d:AutoForm id="formEmployee" />
            </d:Tab>
          </d:TabSet>
        </d:Pane>
      </d:Layout>
    </d:SplitPanel>
  </d:View>
</body>
</html>

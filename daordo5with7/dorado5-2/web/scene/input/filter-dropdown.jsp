<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sample-center.css"/>
<title></title>
</head>
<body style="margin:0px;overflow:auto;">
  <d:View config="sample.scene.input.FilterDropDown">
    <d:Layout type="border">
      <d:Pane position="top">
      <p class="hint">这是一个根据用户在编辑框中输入的内容过滤选项的例子，可以帮助用户快速录入。<br>
      自动过滤下拉框：根据用户在编辑框中输入的内容及时显示匹配的选项。<br>
      简单过滤下拉框：只有在用户点击Enter或F2键后才根据下拉框的内容显示匹配的选项。<br>
      可以在“员工编号”输入：ma,li,zhou等；“姓名”输入：马,李,周等；“部门”输入上海,销售,研发等。<br>
      注：在表格中可以通过Insert键添加记录。
      </p>
      </d:Pane>
      <d:Pane position="center">
        <d:TabSet id="tabset1">
          <d:Tab name="tab1">
            <d:Layout type="border">
              <d:Pane position="top">
                <d:AutoForm id="form1" />
              </d:Pane>
              <d:Pane position="center">
                <d:DataTable id="table1" />
              </d:Pane>
              <d:Pane position="bottom" align="right">
                <d:Button id="buttonInsert1" />
              </d:Pane>
            </d:Layout>
          </d:Tab>
          <d:Tab name="tab2">
            <d:Layout type="border">
              <d:Pane position="top">
                <d:AutoForm id="form2" />
              </d:Pane>
              <d:Pane position="center">
                <d:DataTable id="table2" />
              </d:Pane>
              <d:Pane position="bottom" align="right">
                <d:Button id="buttonInsert2" />
              </d:Pane>
            </d:Layout>
          </d:Tab>
        </d:TabSet>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

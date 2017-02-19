<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../sample-center.css"/>
</head>
<body>
  <d:View config="sample.performance.TestPerformance1">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">本页面包含:<br>
6个Dataset,每个Dataset包含100个Field和10条记录.<br>
3个AutoForm,每个AutoForm内包含100个编辑框,其中每10个编辑框分为一组.<br>
3个DataTable,每个DataTable包含20个Column.<br>
注意: 尽管如此, 考虑到浏览器的承受能力, 我们仍不建议您将单个界面设计到如此复杂的程度!
        </p>
      </d:Pane>
      <d:Pane position="center">
        <d:TabSet id="tabset">
          <d:Tab name="tab1" label="Form 1" padding="8">
            <d:AutoForm id="form1" />
          </d:Tab>
          <d:Tab name="tab2" label="Form 2" padding="8">
            <d:AutoForm id="form2" />
          </d:Tab>
          <d:Tab name="tab3" label="Form 3" padding="8">
            <d:AutoForm id="form3" />
          </d:Tab>
          <d:Tab name="tab4" label="Table 1" padding="8">
            <d:DataTable id="table1" />
          </d:Tab>
          <d:Tab name="tab5" label="Table 2" padding="8">
            <d:DataTable id="table2" />
          </d:Tab>
          <d:Tab name="tab6" label="Table 3" padding="8">
            <d:DataTable id="table3" />
          </d:Tab>
        </d:TabSet>
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>唯一性校验示例(辅助Dataset方式)</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/sample-center.css"/>
</head>
<body style="margin: 0px; overflow: hidden;">
  <d:View config="sample.scene.validate.UniqueValidateByDataset">
    <d:Layout type="border">
      <d:Pane position="top">
       <div class="hint">
         该示例用来校验员工ID的唯一性。<br />
         该示例中使用了另一辅助Dataset，在主Dataset修改数据之后，会通过辅助Dataset来完成数据校验。<br />
         datasetEmployee中使用了另外一个字段ID，用来保存上次的修改记录，该字段的值用于在校验失败后将上一次的值填回去。
       </div>
       <d:AutoForm id="formEmployee" />
      </d:Pane>
      <d:Pane position="center">
      <d:DataTable id="tableEmployee" />
      </d:Pane>
      <d:Pane position="bottom">
      <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

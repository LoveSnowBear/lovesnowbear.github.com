<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>唯一性校验示例(在保存之前进行校验)</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/sample-center.css"/>
</head>
<body>
  <d:View config="sample.scene.validate.UniqueValidateBeforeSave">
    <d:Layout type="border">
    <d:Pane position="top">
      <div class="hint">
         该示例用来校验员工ID的唯一性。<br />
         在保存之前会对新增和修改的员工进行唯一性校验，若不符合唯一性的规定，则抛出异常，不对该记录进行保存。<br />
       </div>
      <d:AutoForm id="formEmployee" />
    </d:Pane>
    <d:Pane position="center">
    <d:DataTable id="tableEmployee" />
    </d:Pane>
    <d:Pane position="bottom">
    <d:Layout type="Hflow" width="100%">
      <d:Pane>
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
      <d:Pane>
      </d:Pane>
      <d:Pane width="1">
        <d:Button id="buttonSave" />
      </d:Pane>
    </d:Layout>
    </d:Pane>
  </d:Layout>
  </d:View>
</body>
</html>

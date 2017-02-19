<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>选择员工</title>
</head>
<body style="margin:0px;padding:0px;overflow:hidden;">
<d:View config="sample.scene.input.inputAssist.left2right">
  <d:Layout type="border">
    <d:Pane position="center">
      <d:Layout type="Hflow" width="100%" height="100%">
        <d:Pane>
          <d:DataTable id="table1" />
        </d:Pane>
        <d:Pane width="50px;">
          <d:Button id="button1" />
          <div style="height:10px;"></div>
          <d:Button id="button2" />
        </d:Pane>
        <d:Pane>
          <d:DataTable id="table2" />
        </d:Pane>
      </d:Layout>
    </d:Pane>
    <d:Pane position="bottom" align="center">
      <d:Button id="buttonSubmit" />
    </d:Pane>
  </d:Layout>

</d:View>
</body>
</html>

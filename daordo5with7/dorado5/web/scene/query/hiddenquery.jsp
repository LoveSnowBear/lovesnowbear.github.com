<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d"%>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sample-center.css"/>
</head>
<body scroll="no">
<d:View config="sample.scene.query.Hiddenquery">
	<p class="hint">
      	此例展示的是自定义快捷键功能。<br>
      	查询条件按钮快捷键为：Ctrl+Shift+A  ；查询按钮快捷键为：Ctrl+Shift+Q  ；<br>
      	清空条件按钮快捷键为：Ctrl+Shift+S  ；关闭按钮快捷键为：Ctrl+Shift+Z  ；
    </p>
	<d:Layout type="Vflow" width="100%" height="90%">
		<d:Pane align="right">
			<d:Button id="buttonShowCondition" />
		</d:Pane>
		<d:Pane height="100%">
			<d:DataTable id="tableEmployee" />
		</d:Pane>
		<d:Pane align="right">
			<d:PagePilot id="pilotEmployee" />
		</d:Pane>
	</d:Layout>
	<d:SubWindow id="subwindowCondition">
		<d:Layout type="Vflow">
			<d:Pane>
				<d:AutoForm id="formCondition" />
			</d:Pane>
			<d:Pane align="Center">
				<d:Button id="buttonQuery" /> &nbsp
				<d:Button id="buttonClear" />&nbsp
				<d:Button id="buttonCloseCondition" />
			</d:Pane>
		</d:Layout>
	</d:SubWindow>
</d:View>
</body>
</html>

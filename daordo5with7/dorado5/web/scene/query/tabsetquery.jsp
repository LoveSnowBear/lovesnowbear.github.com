<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d"%>
<html>
<head>
<title></title>
</head>
<body scroll="no">
<d:View config="sample.scene.query.Tabsetquery">
	<d:Layout type="vflow" width="100%" height="100%">
		<d:Pane>
			<d:TabSet id="tabsetCondition" >
				<d:Tab name="tab1">
					<d:AutoForm id="formCondition1" />
				</d:Tab>
				<d:Tab name="tab2">
					<d:AutoForm id="formCondition2" />
				</d:Tab>
			</d:TabSet>
		</d:Pane>
		<d:Pane align="right">
			<d:Button id="buttonQuery" />&nbsp
			<d:Button id="buttonClear" />
		</d:Pane>
		<d:Pane height="100%">
			<d:DataTable id="tableEmployee" />
		</d:Pane>
		<d:Pane align="right">
			<d:PagePilot id="pilotEmployee" />
		</d:Pane>
	</d:Layout>
</d:View>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d"%>
<html>
	<head>
		<title>Select Style</title>
	</head>
	<body>
		<d:View config="sample.scene.SelectStyle">
			<table width="100%" height="100%">
				<tr>
					<td align="center" valign="middle">
						<d:GroupBox id="groupbox1" title="Please select a style" width="400" height="305" showExpandButton="false">
							<d:Layout type="border" style="margin: 1px">
								<d:Pane position="center">
									<d:DataTable id="tableStyle" />
								</d:Pane>
								<d:Pane position="bottom" align="center">
									<d:Button id="buttonOK" />
								</d:Pane>
							</d:Layout>
						</d:GroupBox>
					</td>
				</tr>
			</table>
		</d:View>
	</body>
</html>

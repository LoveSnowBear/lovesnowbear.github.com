%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.bstek.com/dorado" prefix="d"%>
<html>
	<head>
		<title>Dorado Sample Center</title>
	</head>
	<body style="margin: 0; overflow: hidden">
		<d:View config="Main">
			<d:Layout type="border" padding="0">
				<d:Pane position="top">
					<d:MenuBar id="menubarMain" />
				</d:Pane>
				<d:Pane position="center">
					<div style="width: 100%; height: 100%; position: relative">
						<iframe id="frameContent" name="content" frameborder="0"
							style="width: 100%; height: 100%" onload="hideCovering()"></iframe>
						<div id="frameCovering"
							style="left: 0; top: 0; width: 100%; height: 100%; position: absolute; background-color: white; padding: 12; display: none">
							<table>
								<tr>
									<td>
										<img src="images/loading.gif">
									</td>
									<td>
										<b>Loading...</b>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</d:Pane>
			</d:Layout>
		</d:View>
	</body>
</html>

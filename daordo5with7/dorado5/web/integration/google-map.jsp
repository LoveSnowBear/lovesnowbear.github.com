<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="/dorado/exception.d"%>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../../sample-center.css" />
		<title></title>
		<script
			src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAJNaKrkNRuQehZUwYjhNgIxQA99y78qKclH0fyofjC85RdXomiRTTxOZdb8sV8sBi-afzHpQFNdGI1w">
  </script>
	</head>
	<body style="overflow: hidden">
		<d:View config="sample.integration.GoogleMap">
			<d:Layout type="border">
				<d:Pane position="center">
					<div id="map" style="width: 100%; height: 100%"></div>
					<d:SubWindow id="subwindow1" title="公司详细信息" width="700px"
						height="100%" draggable="true" resizable="true" status="hidden"
						showMinimizeButton="true" showMaximizeButton="true"
						showCloseButton="true">
						<div style="width: 100%; height: 100%; position: relative">
							<iframe id="frameSample" name="sample" frameborder="0"
								style="width: 100%; height: 100%" onload="hideCovering()"></iframe>
							<div id="frameCovering"
								style="left: 0; top: 0; width: 100%; height: 100%; position: absolute; background-color: white; padding: 12; display: none">
								<table>
									<tr>
										<td>
											<img src="../../images/loading.gif">
										</td>
										<td>
											<b>Loading ... ...</b>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</d:SubWindow>
				</d:Pane>
				<d:Pane position="right">
					<d:Layout type="border" width="300px">
						<d:Pane position="top">
							<p class="hint">
								选择左边的省份并输入查询条件搜索您要的数据。
							</p>
							<d:AutoForm id="formQuery" />
						</d:Pane>
						<d:Pane position="center">
							<d:SubWindow id="subwindow2" title="查询列表" width="100%"
								height="100%" draggable="true" resizable="true" status="normal"
								showMinimizeButton="false" showMaximizeButton="true"
								showCloseButton="false">
								<d:Layout type="border">
									<d:Pane position="center">
										<d:Layout type="border">
											<d:Pane position="top" align="right">
												<d:Button id="buttonAdd" />&nbsp;
                <d:Button id="buttonEdit" />&nbsp;
                <d:Button id="buttonDelete" />
											</d:Pane>
											<d:Pane position="center">
												<d:DataTable id="tableCompany" />
											</d:Pane>
										</d:Layout>
									</d:Pane>
									<d:Pane position="bottom" align="right">
										<d:PagePilot id="pagepilotCompany" />
									</d:Pane>
								</d:Layout>
							</d:SubWindow>
						</d:Pane>
					</d:Layout>
				</d:Pane>
			</d:Layout>
		</d:View>
	</body>
</html>

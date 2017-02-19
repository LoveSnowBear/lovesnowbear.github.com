<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>主页面</title>
<script src="nav.js"></script>
</head>
<body style="margin:0px;padding:0px;overflow:hidden;">
  <d:View config="sample.scene.main.Style2">
      <d:Layout type="border">
        <d:Pane position="top">
        <d:MenuBar id="menubarMain" />
        </d:Pane>
         <d:Pane position="center">     
      <div style="width: 100%; height: 100%; position: relative">
        <iframe id="frameContent" src="welcome.html" name="content" frameborder="0"
        	style="width: 100%; height: 100%;padding:0;" onload="hideCovering();">
        </iframe>
        <div id="frameCovering"
        	style="left: 0; top: 0; width: 100%; height: 100%; position: absolute; background-color: white; padding: 0px; display: none">
          <table width='100%' height='100%'>
          	<tr>
          		<td valign='middle' align='center'>
          		<table>
          			<tr>
          				<td><img src='../../images/loading.gif'></td>
          				<td><b>正在加载，请稍候......</b></td>
          			</tr>
          		</table>
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

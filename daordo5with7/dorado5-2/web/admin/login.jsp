<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title>请输入用户名和口令</title>
</head>
<body style="overflow: hidden; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#FFFFFF, endColorstr=#DAE4F3);">
  <d:View config="sample.admin.Login">
    <p><b><font color="red">      
      <d:MessageIterator>
        <li><d:Message /></li>
      </d:MessageIterator>      
    </font></b></p>
    <form id="formLogin" method="post" action="access.login.d">
      <table>
        <tr>
          <td align="right"><d:FieldLabel id="fieldlabelUser" />&nbsp;</td>
          <td><d:TextEditor id="editorUser" /></td>
        </tr>
        <tr>
          <td align="right"><d:FieldLabel id="fieldlabelPassword" />&nbsp;</td>
          <td><d:TextEditor id="editorPassword" /></td>
        </tr>
        <tr>
          <td>
          </td>
          <td align="right">
            <img border="0" src="images/next.gif" onclick="formLogin.submit();">
          </td>
        </tr>
      </table>
    </form>
  </d:View>
</body>
</html>

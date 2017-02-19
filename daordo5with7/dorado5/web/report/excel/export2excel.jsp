<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
  <title>Excel数据导出</title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.report.excel.Export2Excel">
    <d:Layout type="vflow" height="100%">
      <d:Pane>
        <p class="hint">
        利用下面的表格我们可以动态的控制Excel文件中输出的数据列和他们之间的顺序。
        您可以利用表格的属性页或列拖动操作来改变表格的显示，从而改变Excel导出的格式。
        (在表格中按下Ctrl+T可以打开表格的属性页)
        </p>
      </d:Pane>
      <d:Pane>
        <table cellpadding="4">
          <tr>
            <td nowrap bgcolor="#F5F7F9">数据提取模式:</td>
            <td bgcolor="#F5F7F9"><d:RadioGroup id="editorDataMode" /></td>
          </tr>
          <tr>
            <td nowrap bgcolor="#F5F7F9">输出方式:</td>
            <td bgcolor="#F5F7F9"><d:RadioGroup id="editorExportMode" /></td>
          </tr>
          <tr>
            <td nowrap bgcolor="#F5F7F9">模版文件:</td>
            <td bgcolor="#F5F7F9"><d:TextEditor id="editorTemplateFile" /></td>
          </tr>
          <tr>
            <td align="right" colspan="2"><d:Button id="buttonExcel" /></td>
          </tr>
        </table>
      </d:Pane>
      <d:Pane height="100%">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
      <d:Pane align="right">
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

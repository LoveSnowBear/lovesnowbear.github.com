<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.scene.input.inputAssist.InputAssist">
    <d:Layout type="border">
      <d:Pane position="top">
        <p class="hint">
ListDropDown和DatasetDropDown可以帮助您将代码显示为实际的内容,
例如本例中的部门名称就是通过一个DatasetDropDown完成显示转换的.<br>
同时ListDropDown和DatasetDropDown也可以和RadioGroup对象进行绑定,
这样我们就可以非常快速的创建出一组RadioBox了.<br>
通过CustomDropDown您可以非常灵活的扩展下拉框的功能,
本例中展示了多个通过CustomDropDown实现的功能.
        </p>
        <table>
          <tr height="30">
            <td nowrap>性别编辑:</td>
            <td><d:TextEditor id="editorSex" /></td>
            <td colSpan="2"><d:RadioGroup id="radioGroupSex" /></td>
          </tr>
          <tr height="30">
            <td nowrap>部门选择:</td>
            <td><d:TextEditor id="editorDept" /></td>
            <td colSpan="2"><d:RadioGroup id="radioGroupDept" /></td>
          </tr>
          <tr height="30">
            <td nowrap>员工选择:</td>
            <td><d:TextEditor id="editorEmployee" /></td>
            <td><d:TextEditor id="editorCustom" /></td>
            <td width="100%">(树型自定义下拉框)</td>
          </tr>
          <tr height="30">
            <td nowrap>多选下拉:</td>
            <td><d:TextEditor id="editorDegreeMultiSel" /></td>
            <td></td>
            <td></td>
          </tr>
          <tr height="30">
            <td nowrap>其它:</td>
            <td><d:TextEditor id="editorEmployeeMultiSel1" /></td>
            <td><d:TextEditor id="editorEmployeeMultiSel2" /></td>
            <td><d:TextEditor id="editorEmployeeMultiSel3" /></td>
          </tr>
        </table>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

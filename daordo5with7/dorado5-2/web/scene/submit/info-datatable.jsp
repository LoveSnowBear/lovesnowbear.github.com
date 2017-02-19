<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sample-center.css"/>
<title></title>
</head>
<body style="margin:2px;overflow:auto;">
  <d:View config="sample.scene.submit.InfoDataTable" namespace="InfoDataTable">
    <d:Layout type="border" padding="0">
      <d:Pane position="top">
        <d:Layout type="vflow">
          <d:Pane>
            <p class="hint" style="margin-bottom:2px;">
           	 这是一个演示快速填入信息的例子。如果用户确切知道一条记录的主键信息，就可以快速将它的内容填入下面的表格中。<br>
			可以在“员工编号”中输入：ANLIN、BAIXIAOBO、CHENGYU、CHENHAO、DENGIUXIAN、FANGSHIZE、FENGJIE、GUAILING等。
            </p>
          </d:Pane>
          <d:Pane>
	        <d:Layout type="Hflow" width="100%">
	          <d:Pane>
				如果根据员工编号的查询结果多于一条记录时，是否要给出选择列表<d:CheckBox id="editorCheckMultiRecord" />，否则以第一条记录为准。
	          </d:Pane>
	          <d:Pane width="72">
	            <d:Button id="buttonInsert" />
	          </d:Pane>
	        </d:Layout>
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
    </d:Layout>
    <d:SubWindow id="subwindowMultiEmployee">
      <d:Layout type="border">
        <d:Pane position="center">
          <d:DataTable id="tableEmployee_dic" />
        </d:Pane>
        <d:Pane position="bottom">
          <d:Layout type="Hflow" width="100%" height="25">
            <d:Pane>
            </d:Pane>
            <d:Pane width="75">
              <d:Button id="buttonOk1Emp" />
            </d:Pane>
            <d:Pane width="75">
              <d:Button id="buttonClose" />
            </d:Pane>
          </d:Layout>
        </d:Pane>
      </d:Layout>
    </d:SubWindow>
  </d:View>
</body>
</html>

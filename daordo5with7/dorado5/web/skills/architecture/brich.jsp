<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
<d:View config="sample.skills.architecture.BRich">
  <d:Layout type="vflow" height="100%">
    <d:Pane>
      <d:Layout type="Hflow" width="100%">
        <d:Pane>
          <d:DataPilot id="datapilot1"/>
        </d:Pane>
        <d:Pane align="right">
          <a href="client-inherit.png" target="_blank">查看Brich的Client端对象结构图</a>&nbsp;&nbsp;
        </d:Pane>
      </d:Layout>
    </d:Pane>
    <d:Pane>
      <d:Layout type="border">
        <d:Pane position="center">
          <d:AutoForm id="form1"/>
        </d:Pane>
        <d:Pane position="right">
          <p class="hint" style="width: 200; height: 175">
            MVC的主要特征就是数据模型与表现形式的松耦合和任意绑定. 在本例中你可以看到对于同样一份由Dataset
            进行管理的数据可以有表单、表格等多种表现形式, 他们之间可以自然的形成连动的关系.
            <br>
            如果我们在一种数据控件中对数据作了调整就可以立刻在其它的数据控件中看到相应的变化.            
          </p>
        </d:Pane>
      </d:Layout>
    </d:Pane>
    <d:Pane height="100%">
      <d:SplitPanel id="spiltpanel1" orientation="horizontal" position="50%" width="100%" height="100%" showButtons="false">
        <d:DataTable id="table1"/>
        <d:Splitter/>
        <d:DataTable id="table2"/>
      </d:SplitPanel>
    </d:Pane>
    <d:Pane align="right">
      <d:PagePilot id="pagepilot1"/>
    </d:Pane>
  </d:Layout>
</d:View>
</body>
</html>

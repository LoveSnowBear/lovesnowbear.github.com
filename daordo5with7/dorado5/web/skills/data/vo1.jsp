<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.data.VO1">
    <d:Layout type="vflow" height="100%">
      <d:Pane>
        <p class="hint" style="width: 100%">
          本例利用了Hibernate作为数据提取和持久化的后端实现。但本例旨在演示如何通过VO
          利用dorado的Dataset与后台业务逻辑进行交互，而不在于演示如何使用Hibernate！
          相反此处直接在ViewModel的实现类和Dataset的监听器中调用Hibernate的使用方法并
          不是一种很好的实践。<br>
          注意： 在ViewModel实现类的raiseSalary中我们通过直接向Employee对象设置数值的方式
          将后台产生的数据返回到Client端。此处的Employee对象必须是通过Dataset的toDO或
          toSingleDO等方法获得的。您也可以借助这种方式将新增记录在Server端生成的新的主键值
          直接返回给Client端。
        </p>
      </d:Pane>
      <d:Pane>
        <d:Layout type="Hflow">
          <d:Pane>
            <d:Button id="buttonUpdateEmployees" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonRaiseSalary" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane height="100%">
        <d:DataTable id="tableEmployee" />
      </d:Pane>
      <d:Pane>
        <d:PagePilot id="pagepilotEmployee" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>

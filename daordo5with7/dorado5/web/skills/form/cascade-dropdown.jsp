<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/dorado/exception.d" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="margin: 20">
  <d:View config="sample.skills.form.CascadeDropDown">
    <d:AutoForm id="formForTest1">
      <d:FormElementRenderer group="groupMain" element="description">
        <p class="hint" style="width: 100%; height: 80; overflow: auto">
          此处使用了dorado中的3个DatasetDropDown，分别绑定到一个Dataset，
          同时这三个Dataset之间有建立了主从绑定的关系。这样，3个下拉框自然就形成了联动的关系。<br>
          此种方式可达到很好的操作效果，但页面的加载速度可能稍慢。
        </p>
      </d:FormElementRenderer>
    </d:AutoForm>
    <br>
    <d:AutoForm id="formForTest2">
      <d:FormElementRenderer group="groupMain" element="description">
        <p class="hint" style="width: 100%; height: 80; overflow: auto">
         此处使用了dorado中的3个DynamicDropDown，
         利用下拉框的onSelect事件为下一级下拉框设置查询参数。<br>
         此种方式页面的加载速度较快，但下拉框的展开速度可能稍慢。
        </p>
      </d:FormElementRenderer>      
    </d:AutoForm>
  </d:View>
</body>
</html>

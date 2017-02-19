<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<title></title>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.controls.OutlookBar">
    <d:OutlookBar id="outlookbar1">
      <d:OutlookBarGroup name="group1" label="第一个组">
        <d:Tree id="tree1" />
      </d:OutlookBarGroup>
      <d:OutlookBarGroup name="group2" label="第二个组" padding="12"> 
        <d:AutoForm id="formEmployee" />
      </d:OutlookBarGroup>
      <d:OutlookBarGroup name="group3" label="第三个组" padding="12"> 
        <d:Calendar id="calendar1" />
      </d:OutlookBarGroup>
      <d:OutlookBarGroup name="group4" label="第四个组"> 
        <div style="width: 100%; height: 100%; background-color: #FFDDFF"></div>
      </d:OutlookBarGroup>
      <d:OutlookBarGroup name="group5" label="第五个组"> 
        <div style="width: 100%; height: 100%; background-color: #FFFFB3"></div>
      </d:OutlookBarGroup>
      <d:OutlookBarGroup name="group6" label="第六个组"> 
        <div style="width: 100%; height: 100%; background-color: #CCFFFF"></div>
      </d:OutlookBarGroup>
    </d:OutlookBar>
  </d:View>
</body>
</html>

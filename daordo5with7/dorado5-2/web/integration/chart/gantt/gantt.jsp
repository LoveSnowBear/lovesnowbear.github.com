<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<%@ taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <style>
  #idDIV{width:100%;height:100%;padding:2px;font-family:verdana,tahoma;font-size:12px ;line-height:17px;overflow:auto;}
  #idCodeDiv{width:100%;padding:4px;font-family:verdana,tahoma;margin:12px 0px 0px 0px;background-color:#EEEEEE;font-weight:bold;}
  </style>
</head>
<body style="margin: 0; overflow: hidden">
<d:View config="sample.integration.chart.gantt.GanttTreeGrid">
  <d:SplitPanel id="testsplitpanel" orientation="vertical" position="200" width="100%" height="100%" showButtons="true">
    <d:TreeGrid id="treegridProject" />
    <d:Splitter />
    <div id="idDIV">
      <jsp:useBean id="ganttPostProcess" class="sample.integration.chart.gantt.GanttPostProcess"></jsp:useBean>
      <jsp:useBean id="toolTipClass" class="sample.integration.chart.gantt.GanttDataProducer"></jsp:useBean>
      <cewolf:chart id="gantt" type="gantt">
        <cewolf:chartpostprocessor id="ganttPostProcess" />
        <cewolf:data>
          <cewolf:producer id="toolTipClass" />
        </cewolf:data>
      </cewolf:chart>
      <cewolf:img chartid="gantt" renderer="/cewolf" width="1200" height="600">
        <cewolf:map linkgeneratorid="toolTipClass" />
      </cewolf:img>
    </div>
  </d:SplitPanel>
</d:View>
</body>
</html>

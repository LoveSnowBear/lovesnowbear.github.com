<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf'%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="margin: 0">
<jsp:useBean id="timeSeriesPostProcessor" class="sample.integration.chart.timeseries.TimeSeriesPostProcess"/>
<jsp:useBean id="timeSeriesProducer" class="sample.integration.chart.timeseries.TimeSeriesProducer"/>

<cewolf:chart id="timeSeries" type="timeseries" title="员工生日与工资" xaxislabel="员工生日" yaxislabel="员工工资">
  <cewolf:chartpostprocessor id="timeSeriesPostProcessor" />
  <cewolf:data>
    <cewolf:producer id="timeSeriesProducer" />
  </cewolf:data>
</cewolf:chart>
<cewolf:img chartid="timeSeries" height="300" width="1000" renderer="/cewolf">
  <cewolf:map linkgeneratorid="timeSeriesProducer" />
</cewolf:img>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf'%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<jsp:useBean id="barDatasetProducer" class="sample.integration.chart.bar.BarDatasetProducer" />
<cewolf:chart id="barChart" type="verticalBar3D">
  <cewolf:data>
    <cewolf:producer id="barDatasetProducer" />
  </cewolf:data>
</cewolf:chart>
<cewolf:img chartid="barChart" height="300" width="750" renderer="/cewolf">
  <cewolf:map linkgeneratorid="barDatasetProducer" />
</cewolf:img>
</body>
</html>

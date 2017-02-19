<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf'%>
<html>
<body style="margin: 0">
<jsp:useBean id="pieProducer" class="sample.integration.chart.combine.PieProducer"/>
<jsp:useBean id="timeSeriesProducer" class="sample.integration.chart.timeseries.TimeSeriesProducer"/>
<cewolf:chart id="pieTest" type="pie" title="根据员工学历分类图">
  <cewolf:data>
    <cewolf:producer id="pieProducer"/>
  </cewolf:data>
</cewolf:chart>
<cewolf:overlaidchart id="combineChart" title="员工生日与工资" type="overlaidxy" xaxistype="date" yaxistype="number" xaxislabel="员工工资" yaxislabel="员工生日">
  <cewolf:plot type="xyline">
    <cewolf:data>
      <cewolf:producer id="timeSeriesProducer"/>
    </cewolf:data>
  </cewolf:plot>
  <cewolf:plot type="xyverticalbar">
    <cewolf:data>
      <cewolf:producer id="timeSeriesProducer"/>
    </cewolf:data>
  </cewolf:plot>
  <cewolf:plot type="xyline">
    <cewolf:data>
      <cewolf:producer id="timeSeriesProducer"/>
    </cewolf:data>
  </cewolf:plot>
  <cewolf:plot type="scatter">
    <cewolf:data>
      <cewolf:producer id="timeSeriesProducer"/>
    </cewolf:data>
  </cewolf:plot>
</cewolf:overlaidchart>

<table>
  <tr>
    <td>
      <cewolf:img chartid="pieTest" renderer="/cewolf" width="350" height="350">
        <cewolf:map linkgeneratorid="pieProducer"/>
      </cewolf:img>
    </td>
    <td>
      <cewolf:img chartid="combineChart" renderer="/cewolf" width="630" height="350">
        <cewolf:map linkgeneratorid="timeSeriesProducer"/>
      </cewolf:img>
    </td>
  </tr>
</table>
</body>
</html>

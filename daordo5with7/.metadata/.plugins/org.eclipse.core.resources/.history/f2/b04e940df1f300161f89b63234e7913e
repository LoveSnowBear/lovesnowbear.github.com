package sample.integration.chart.gantt;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.DateTickUnit;
import org.jfree.chart.plot.CategoryPlot;

import de.laures.cewolf.ChartPostProcessor;

public class GanttPostProcess implements ChartPostProcessor {

	public void processChart(Object chart, Map params) {
		JFreeChart myChart = (JFreeChart) chart;
		CategoryPlot plot = myChart.getCategoryPlot();
		DateAxis axis = (DateAxis) plot.getRangeAxis();
		axis.setDateFormatOverride(new SimpleDateFormat("MM/dd"));
		axis.setTickUnit(new DateTickUnit(DateTickUnit.DAY, 5,
				new SimpleDateFormat("dd")));
		axis.setLowerMargin(0.02);

		CategoryAxis categoryAxis = plot.getDomainAxis();
		categoryAxis.setLowerMargin(0.01);
		categoryAxis.setUpperMargin(0.01);
		categoryAxis.setCategoryLabelPositionOffset(0);
		categoryAxis.setCategoryMargin(0);
		categoryAxis.setFixedDimension(0);
		categoryAxis.setLabelAngle(0);

	}
}

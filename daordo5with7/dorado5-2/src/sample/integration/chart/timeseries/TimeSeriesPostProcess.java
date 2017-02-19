package sample.integration.chart.timeseries;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.plot.XYPlot;

import de.laures.cewolf.ChartPostProcessor;

public class TimeSeriesPostProcess implements ChartPostProcessor {

	public void processChart(Object chart, Map params) {
		JFreeChart obj = (JFreeChart) chart;
		XYPlot plot = obj.getXYPlot();
		DateAxis axis = (DateAxis) plot.getDomainAxis();
		axis.setDateFormatOverride(new SimpleDateFormat("yyyy/MM/dd"));
		axis.setVerticalTickLabels(true);
	}

}

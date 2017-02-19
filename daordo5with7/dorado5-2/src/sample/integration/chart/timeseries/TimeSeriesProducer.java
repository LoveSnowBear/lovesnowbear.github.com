package sample.integration.chart.timeseries;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jfree.data.time.Day;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.time.TimeSeriesDataItem;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.PagingHelper;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.XYItemLinkGenerator;

public class TimeSeriesProducer implements DatasetProducer, XYItemLinkGenerator {

	public String getProducerId() {
		return null;
	}

	public boolean hasExpired(Map params, Date since) {
		return true;
	}

	public Object produceDataset(Map params) throws DatasetProduceException {
		TimeSeries manTime = new TimeSeries("男士工资走势曲线", Day.class);
		TimeSeries womanTime = new TimeSeries("女士工资走势曲线", Day.class);
		DoradoContext context = DoradoContext.getContext();
		String pageIndex = context.getParameter("pageIndex");
		String pageSize = context.getParameter("pageSize");
		if (pageIndex != null && pageSize != null) {
			DBStatement stmt = new DBStatement();
			stmt.setDataSource("doradosample");
			List result = new ArrayList();
			String sql = "select count(*) as c from employee";
			stmt.setSql(sql);
			PagingHelper page = new PagingHelper();
			try {
				VariantSet vs = stmt.query();
				int recordCount = vs.getInt("c");
				page.setPageIndex(Integer.parseInt(pageIndex));
				page.setPageSize(Integer.parseInt(pageSize));
				page.setTotalRow(recordCount);
				sql = "select employee_id,employee_name,birthday,salary,sex from employee";
				stmt.setSql(sql);
				List list = stmt.queryForList();
				for (int i = page.getFromIndex(); i < page.getFromIndex()
						+ page.getPageSize(); i++) {
					if (i > list.size() - 1) {
						break;
					}
					VariantSet variantSet = (VariantSet) list.get(i);
					result.add(variantSet);
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new IllegalArgumentException("数据处理异常.");
			} finally {
				stmt.close();
			}
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");

			for (int i = 0; i < result.size(); i++) {
				VariantSet vSet = (VariantSet) result.get(i);
				boolean sex = vSet.getBoolean("sex");
				double salary = vSet.getDouble("salary");
				String birthday = vSet.getString("birthday");
				try {
					Date date = sd.parse(birthday);
					if (sex) {
						manTime.add(new Day(this
								.getDatePartByFormat("dd", date), this
								.getDatePartByFormat("MM", date), this
								.getDatePartByFormat("yyyy", date)), salary);
					} else {
						womanTime
								.add(new Day(this.getDatePartByFormat("dd",
										date), this.getDatePartByFormat("MM",
										date), this.getDatePartByFormat("yyyy",
										date)), salary);
					}
				} catch (ParseException e) {
					e.printStackTrace();
					throw new IllegalArgumentException("数据处理异常.");
				}
			}
		}
		TimeSeriesCollection tc = new TimeSeriesCollection();
		tc.addSeries(womanTime);
		tc.addSeries(manTime);
		return tc;
	}

	private int getDatePartByFormat(String pattern, Date d) {
		SimpleDateFormat sd = new SimpleDateFormat(pattern);
		return Integer.parseInt(sd.format(d));
	}

	public String generateLink(Object data, int series, int item) {
		TimeSeriesCollection timeseries = (TimeSeriesCollection) data;
		TimeSeries ser = timeseries.getSeries(series);
		StringBuffer sb = new StringBuffer();
		TimeSeriesDataItem it = ser.getDataItem(item);
		double tmp = ((Double) it.getValue()).doubleValue();
		sb.append("javascript:");
		sb.append("var record = parent.dataset1.getFirstRecord();");
		sb.append("while (record) {");
		sb.append("var a=record.getValue('salary');");
		sb.append("if(a=='" + tmp + "'){");
		sb.append("parent.dataset1.setCurrent(record);");
		sb.append("break;");
		sb.append("}");
		sb.append("record = record.getNextRecord();");
		sb.append("}");
		sb.append("alert('" + tmp + "');");
		return sb.toString();
	}
}

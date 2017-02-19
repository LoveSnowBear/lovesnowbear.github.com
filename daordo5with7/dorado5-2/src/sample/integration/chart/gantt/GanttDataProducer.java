package sample.integration.chart.gantt;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jfree.data.category.CategoryDataset;
import org.jfree.data.gantt.Task;
import org.jfree.data.gantt.TaskSeries;
import org.jfree.data.gantt.TaskSeriesCollection;
import org.jfree.data.time.SimpleTimePeriod;

import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.CategoryToolTipGenerator;

public class GanttDataProducer implements DatasetProducer,
		CategoryItemLinkGenerator, CategoryToolTipGenerator {

	public String getProducerId() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean hasExpired(Map params, Date since) {
		// TODO Auto-generated method stub
		return false;
	}

	public Object produceDataset(Map params) throws DatasetProduceException {
		TaskSeriesCollection tc = new TaskSeriesCollection();
		DBStatement stmt = new DBStatement();
		stmt.setDataSource("doradosample");

		String sql = "select * from project where parent_id is null";
		stmt.setSql(sql);
		try {
			List ls = stmt.queryForList();
			for (int i = 0; i < ls.size(); i++) {
				VariantSet vs = (VariantSet) ls.get(i);
				String task_name = vs.getString("task_name");
				String id = vs.getString("id");
				sql = "select * from project where parent_id=" + id + "";
				stmt.setSql(sql);
				List list = stmt.queryForList();
				TaskSeries ts = new TaskSeries(task_name);

				for (int j = 0; j < list.size(); j++) {
					VariantSet variantSet = (VariantSet) list.get(j);
					String sub_name = variantSet.getString("task_name");
					id = variantSet.getString("id");
					Date start_time = variantSet.getDate("start_time");
					Date end_time = variantSet.getDate("end_time");
					double progress = variantSet.getDouble("progress");
					Task task = new Task(sub_name, new SimpleTimePeriod(
							start_time, end_time));
					task.setPercentComplete(progress / 100);
					task.setDescription(sub_name + "-" + id);
					ts.add(task);
				}
				tc.add(ts);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException("数据处理异常.");
		} finally {
			stmt.close();
		}

		return tc;
	}

	public String generateLink(Object dataset, int series, Object category) {
		TaskSeriesCollection c = (TaskSeriesCollection) dataset;
		TaskSeries taskSeries = (TaskSeries) c.getRowKeys().get(series);
		List list = taskSeries.getTasks();
		Task task = null;
		for (int i = 0; i < list.size(); i++) {
			task = (Task) list.get(i);
			if (task.getDescription().equals(category.toString())) {
				break;
			}
		}
		String name = task.getDescription();
		String id = name.substring(name.indexOf("-") + 1, name.length());
		StringBuffer sb = new StringBuffer();
		sb.append("javascript:");
		sb.append("var d=datasetProject;");
		sb.append("var record = d.getFirstRecord();");
		sb.append("while (record) {" + "var id=record.getValue('id');"
				+ "if(id==" + id + "){" + "d.setCurrent(record);" + "break;"
				+ "}" + "record = record.getNextRecord();" + "}");
		return sb.toString();
	}

	public String generateToolTip(CategoryDataset data, int series, int item) {
		TaskSeriesCollection c = (TaskSeriesCollection) data;
		TaskSeries taskSeries = (TaskSeries) c.getRowKeys().get(series);
		List list = taskSeries.getTasks();
		return list.toString();
	}

}

package sample.integration.chart.bar;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.CategoryToolTipGenerator;

public class BarDatasetProducer implements DatasetProducer,
		CategoryToolTipGenerator, CategoryItemLinkGenerator {

	public String getProducerId() {
		return null;
	}

	public boolean hasExpired(Map params, Date since) {
		return true;
	}

	public Object produceDataset(Map params) throws DatasetProduceException {

		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		DoradoContext context = DoradoContext.getContext();
		String deptId = context.getParameter("deptId");
		if (deptId != null) {
			DBStatement stmt = new DBStatement();
			stmt.setDataSource("doradosample");
			String sql = "select employee_id,employee_name,salary from employee where dept_id='"
					+ deptId + "'";
			stmt.setSql(sql);
			try {
				List ls = stmt.queryForList();
				for (int i = 0; i < ls.size(); i++) {
					VariantSet vs = (VariantSet) ls.get(i);
					String employee_id = vs.getString("employee_id");
					String employee_name = vs.getString("employee_name");
					double salary = vs.getDouble("salary");
					dataset.addValue(salary, employee_name + "-" + employee_id,
							employee_name);

				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new IllegalArgumentException("数据处理异常.");
			} finally {
				stmt.close();
			}
		}
		return dataset;
	}

	public String generateLink(Object dataset, int series, Object category) {
		DefaultCategoryDataset ds = (DefaultCategoryDataset) dataset;
		String employeeId = ds.getRowKey(series).toString();
		employeeId = employeeId.substring(employeeId.indexOf("-") + 1,
				employeeId.length());
		StringBuffer sb = new StringBuffer();
		sb.append("javascript:");
		sb.append("var d=parent.datasetEmployee;");
		sb.append("var record = d.getFirstRecord();");
		sb.append("while (record) {");
		sb.append("var employeeId=record.getValue('employee_id');");
		sb.append("if(employeeId=='" + employeeId + "'){");
		sb.append("d.setCurrent(record);");
		sb
				.append("parent.document.getElementById('subwindowDetail').show(true,true);");
		sb.append("break;");
		sb.append("}");
		sb.append("record = record.getNextRecord();");
		sb.append("}");
		return sb.toString();
	}

	public String generateToolTip(CategoryDataset data, int series, int item) {
		return null;
	}

}

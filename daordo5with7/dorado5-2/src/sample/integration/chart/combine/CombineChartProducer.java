package sample.integration.chart.combine;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jfree.data.category.DefaultCategoryDataset;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.PagingHelper;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;

public class CombineChartProducer implements DatasetProducer {

	public String getProducerId() {
		return null;
	}

	public boolean hasExpired(Map params, Date since) {
		return false;
	}

	public Object produceDataset(Map params) throws DatasetProduceException {
		DoradoContext context = DoradoContext.getContext();
		String pageIndex = context.getParameter("pageIndex");
		String pageSize = context.getParameter("pageSize");

		DefaultCategoryDataset d = new DefaultCategoryDataset();
		if (pageIndex != null && pageSize != null) {
			DBStatement stmt = new DBStatement();
			stmt.setDataSource("doradosample");
			List result = new ArrayList();
			List degreeResult = new ArrayList();
			String sql = "select count(*) as c from employee";
			stmt.setSql(sql);
			PagingHelper page = new PagingHelper();
			try {
				VariantSet vs = stmt.query();
				int recordCount = vs.getInt("c");
				page.setPageIndex(Integer.parseInt(pageIndex));
				page.setPageSize(Integer.parseInt(pageSize));
				page.setTotalRow(recordCount);
				sql = "select * from employee";
				stmt.setSql(sql);
				List list = stmt.queryForList();
				for (int i = page.getFromIndex(); i < page.getFromIndex()
						+ page.getPageSize(); i++) {
					if (i > list.size() - 1) {
						break;
					}
					VariantSet variantSet = (VariantSet) list.get(i);
					String degree = variantSet.getString("degree");
					if (!degreeResult.contains(degree)) {
						degreeResult.add(degree);
					}
					result.add(variantSet);
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new IllegalArgumentException("数据处理异常.");
			} finally {
				stmt.close();
			}

			for (int i = 0; i < degreeResult.size(); i++) {
				String degree = (String) degreeResult.get(i);
				String sex = "女";
				for (int j = 0; j < result.size(); j++) {
					int degreeCount = 0;
					VariantSet vs = (VariantSet) result.get(j);
					String de = (String) vs.getString("degree");
					if (de.equals(degree)) {
						degreeCount++;

						d.addValue(vs.getDouble("salary"), sex, degree);
					}
				}
			}

		}
		return d;
	}

}

package sample.skills.data;

import java.util.List;

import org.hibernate.Session;
import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.PagingHelper;
import sample.skills.data.hibernate.HibernateUtils;

/**
 * VO1_dataset1Listener
 */
public class VO1_datasetEmployeeListener extends AbstractDatasetListener {
	public void afterLoadData(Dataset dataset) throws Exception {
		Session session = HibernateUtils.openSession();
		try {
			int pageSize = dataset.getPageSize();
			int rowCount = ((Integer) session.createQuery(
					"select count(*) from Employee").iterate().next())
					.intValue();

			// 利用PagingHelper辅助对List的分页
			PagingHelper paging = new PagingHelper(pageSize, dataset
					.getPageIndex(), rowCount);

			List employees = session.createQuery("from Employee")
					.setFirstResult(paging.getFromIndex()).setMaxResults(
							pageSize).list();

			dataset.fromDO(employees); // 将employees中的数据反射到Dataset中
			dataset.setPossibleRecordCount(rowCount); // 设置Dataset的总记录数
		} finally {
			HibernateUtils.closeSession();
		}
	}

}

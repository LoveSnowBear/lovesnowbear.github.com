package sample.skills.data;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sample.skills.data.hibernate.HibernateUtils;

import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.data.ViewDataset;

/**
 * VO2ViewModel
 */
public class VO2ViewModel extends DefaultViewModel {
	protected void doLoadData() throws Exception {
		super.doLoadData();

		Session session = HibernateUtils.openSession();
		try {
			Query query = session.createQuery("from Branch");
			List branchs = query.list();
			ViewDataset datasetBranch = getDataset("datasetBranch");
			datasetBranch.fromDO(branchs); // 将branchs中的数据反射到datasetBranch中
		} finally {
			HibernateUtils.closeSession();
		}
	}

}

package sample.skills.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bstek.dorado.common.Transaction;
import com.bstek.dorado.common.TransactionManager;
import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.db.DBDataset;

/**
 * ResultSet_dataset1Listener
 */
public class ResultSet_datasetEmployeeListener extends AbstractDatasetListener {
	public boolean beforeLoadData(Dataset dataset) throws Exception {
		Transaction tx = TransactionManager.getTransaction();
		Connection connection = tx.getConnection(null); // 获取我们在setting.xml中配置的默认连接
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM employee");
			((DBDataset) dataset).load(rs);
			rs.close();
			st.close();
		} finally {
			connection.close();
		}
		return false; // 终止Dataset默认的加载数据操作
	}

}

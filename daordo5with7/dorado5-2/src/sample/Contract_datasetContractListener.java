package sample;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.db.DBStatement;

/**
 * Contract_datasetContractListener
 */
public class Contract_datasetContractListener extends AbstractDatasetListener {
	public boolean beforeUpdateData(Dataset dataset) throws Exception {
		// 注意: 本例中使用的新建主键值的方法仅用于演示, 在实际应用中并不可取.
		DBStatement stMaxId = new DBStatement();
		stMaxId.setSql("SELECT MAX(item_id) FROM contract_items");
		long maxId = 0L;
		try {
			maxId = stMaxId.query().getLong(0);
		} finally {
			stMaxId.close();
		}

		dataset.moveFirst();
		while (!dataset.isLast()) {
			if (dataset.getRecordState() == Record.STATE_NEW) {
				dataset.setLong("item_id", ++maxId);
			}
			dataset.moveNext();
		}
		return true;
	}
}

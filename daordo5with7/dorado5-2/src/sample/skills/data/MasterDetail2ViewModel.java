package sample.skills.data;

import java.util.Date;

import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;
import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.data.ViewDataset;

/**
 * NewDatasetViewModel
 */
public class MasterDetail2ViewModel extends DefaultViewModel {

	protected void doUpdateData(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		ViewDataset datasetMaster = getDataset("datasetMaster");
		ViewDataset datasetDetail = getDataset("datasetDetail");

		// 注意: 本例中使用的新建主键值的方法仅用于演示, 在实际应用中并不可取.
		VariantSet varSet;
		DBStatement st = new DBStatement();
		try {
			st.setSql("SELECT MAX(id) FROM TEST_MASTER");
			varSet = st.query();
			long masterId = varSet.getLong(0);

			st.setSql("SELECT MAX(id) FROM TEST_DETAIL");
			varSet = st.query();
			long detailId = varSet.getLong(0);

			datasetMaster.moveFirst();
			while (!datasetMaster.isLast()) {
				if (datasetMaster.getRecordState() == Record.STATE_NEW) {
					datasetMaster.setLong("id", ++masterId);
				}
				datasetMaster.setDouble("field2", Math.random() * 10000);
				datasetMaster.setDate("field3", new Date(System
						.currentTimeMillis()));

				datasetDetail.moveFirst();
				while (!datasetDetail.isLast()) {
					if (datasetDetail.getRecordState() == Record.STATE_NEW) {
						datasetDetail.setLong("id", ++detailId);
					}
					datasetDetail.setDouble("field2", Math.random() * 10000);
					datasetDetail.moveNext();
				}

				datasetMaster.moveNext();
			}
			super.doUpdateData(parameters, outParameters);
		} finally {
			st.close();
		}
	}

}

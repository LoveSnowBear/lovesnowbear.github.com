package sample.complex.contract;

import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * ContractQueryViewModel
 */
public class ContractQueryViewModel extends DefaultViewModel {
	public void deleteContract(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		DBStatement stDelItems = new DBStatement();
		try {
			stDelItems.setSql(DBStatement.DELETE, "contract_items");

			Dataset datasetContract = getDataset("datasetContract");
			if (datasetContract.getCurrent() != null) {
				stDelItems.parameters().setString("contract_no",
						datasetContract.getString("contract_no"));
				stDelItems.execute();
				datasetContract.deleteRecord();
			}
		} finally {
			stDelItems.close();
		}
		super.doUpdateData(parameters, outParameters);
	}

}

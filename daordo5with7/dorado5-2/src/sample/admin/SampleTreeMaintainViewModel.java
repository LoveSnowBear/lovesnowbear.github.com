package sample.admin;

import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * SampleMaintainViewModel
 */
public class SampleTreeMaintainViewModel extends DefaultViewModel {
	public void updateNode(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		super.doUpdateData(parameters, outParameters);
	}

	public void removeNode(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		Dataset datasetSample = getDataset("datasetSample");
		datasetSample.deleteRecord();
		super.doUpdateData(parameters, outParameters);
	}

}

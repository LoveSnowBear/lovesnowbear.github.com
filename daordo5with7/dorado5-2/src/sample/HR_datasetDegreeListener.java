package sample;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;

/**
 * HR_datasetDegreeListener
 */
public class HR_datasetDegreeListener extends AbstractDatasetListener {
	public void afterLoadData(Dataset dataset) throws Exception {
		dataset.insertRecord();
		dataset.setString("degree", "高中");
		dataset.insertRecord();
		dataset.setString("degree", "大专");
		dataset.insertRecord();
		dataset.setString("degree", "大学");
		dataset.insertRecord();
		dataset.setString("degree", "硕士");
		dataset.insertRecord();
		dataset.setString("degree", "博士");
		dataset.insertRecord();
		dataset.setString("degree", "其它");
	}

}

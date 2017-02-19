package sample.performance;

import org.apache.commons.lang.RandomStringUtils;
import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;

/**
 * TestPerformance_dataset1Listener
 */
public class TestPerformance1_datasetListener extends AbstractDatasetListener {
	public boolean beforeCreateFields(Dataset dataset) throws Exception {
		for (int i = 0; i < 100; i++) {
			dataset.addField("field" + i);
		}
		return true;
	}

	public void afterLoadData(Dataset dataset) throws Exception {
		for (int i = 0; i < 10; i++) {
			dataset.insertRecord();
			for (int j = 0; j < 100; j++) {
				dataset.setValue(j, RandomStringUtils.randomAlphabetic(8));
			}
		}
		dataset.moveFirst();
	}

}

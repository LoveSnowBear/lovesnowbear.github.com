package sample.performance;

import java.util.Date;

import org.apache.commons.lang.RandomStringUtils;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * PerformanceViewModel
 */
public class TestPerformance2 extends DefaultViewModel {
	private final static long ONE_YEAR = 365L * 24L * 60L * 60L * 1000L;

	protected void doLoadData() throws Exception {
		super.doLoadData();

		Dataset dataset1 = getDataset("dataset1");
		long now = System.currentTimeMillis();
		for (int i = 0; i < 2000; i++) {
			dataset1.insertRecord();
			dataset1.setString("employee_id", String.valueOf(i + 1));
			dataset1.setString("employee_name", RandomStringUtils
					.randomAlphabetic(8));
			dataset1.setInt("salary", (int) (Math.random() * 8000) + 2000);
			dataset1.setBoolean("sex", (Math.random() > 0.5));
			dataset1.setBoolean("married", (Math.random() > 0.5));
			dataset1.setDate("birthday", new Date(now
					- (long) (Math.random() * ONE_YEAR * 50L)));
			dataset1.setString("degree", RandomStringUtils.randomAlphabetic(8));
			dataset1.setString("email", RandomStringUtils.randomAlphabetic(8));
			dataset1.setString("web", RandomStringUtils.randomAlphabetic(8));
			dataset1.setString("cmnt", RandomStringUtils.randomAlphabetic(8));
		}
		dataset1.moveFirst();
	}

}

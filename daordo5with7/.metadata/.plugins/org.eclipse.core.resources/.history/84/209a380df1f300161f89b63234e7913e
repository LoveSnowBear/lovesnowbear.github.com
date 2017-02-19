package sample.skills.other;

import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * AJAXViewModel
 */
public class AJAXViewModel extends DefaultViewModel {
	public void multiply(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		float num1 = parameters.getFloat("num1");
		float num2 = parameters.getFloat("num2");
		float num3 = num1 * num2;
		outParameters.setFloat("num3", num3);
	}

	public void divide(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		float num1 = parameters.getFloat("num1");
		float num2 = parameters.getFloat("num2");
		if (num2 == 0) {
			throw new IllegalArgumentException("除数不能为零！");
		}

		float num3 = num1 / num2;
		outParameters.setFloat("num3", num3);
	}

	public void getSystemInfo(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		Runtime runtime = Runtime.getRuntime();
		outParameters.setLong("freeMemory", runtime.freeMemory());
		outParameters.setLong("totalMemory", runtime.totalMemory());
	}

	public void heavyOperation(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		Thread.sleep(3000);
	}
}

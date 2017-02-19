package sample.skills.table.test;

import java.util.HashMap;
import java.util.Map;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * EventsViewViewModel
 */
public class EventsViewViewModel extends DefaultViewModel {
	protected void doUpdateData(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		Map localColumnEvents = new HashMap();

		Dataset datasetColumns = getDataset("datasetColumns");
		datasetColumns.moveFirst();
		while (!datasetColumns.isLast()) {
			String column = datasetColumns.getString("column");

			Dataset datasetColumnEvents = getDataset("datasetColumnEvents");
			Map scripts = new HashMap();
			datasetColumnEvents.moveFirst();
			while (!datasetColumnEvents.isLast()) {
				scripts.put(datasetColumnEvents.getString("eventName"),
						datasetColumnEvents.getString("script"));
				datasetColumnEvents.moveNext();
			}
			localColumnEvents.put(column, scripts);

			datasetColumns.moveNext();
		}

		DoradoContext context = DoradoContext.getContext();
		context.setAttribute(DoradoContext.SESSION, "localColumnEvents",
				localColumnEvents);

		super.doUpdateData(parameters, outParameters);
	}

}

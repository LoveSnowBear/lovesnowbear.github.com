package sample.skills.table.test;

import java.util.List;
import java.util.Map;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.utils.StringHelper;

/**
 * ColumnEventsListener
 */
public class ColumnEventsListener extends AbstractDatasetListener {
	public void afterLoadData(Dataset dataset) throws Exception {
		Map columnInfos = ColumnHelper.getColumnInfos();

		String column = dataset.parameters().getString("column");
		if (StringHelper.isNotEmpty(column)) {
			List list = (List) columnInfos.get(column);
			Map scripts = (Map) list.get(2);

			dataset.insertRecord();
			dataset.setString("event", "onRefresh");
			dataset.setString("parameters", "column, row, cell, value, record");
			dataset.setString("sample", (String) scripts.get("onRefresh"));

			dataset.insertRecord();
			dataset.setString("event", "onCreateCellRenderer");
			dataset.setString("parameters", "column");
			dataset.setString("sample", (String) scripts
					.get("onCreateCellRenderer"));

			dataset.insertRecord();
			dataset.setString("event", "onFooterRefresh");
			dataset.setString("parameters", "column, cell, value");
			dataset
					.setString("sample", (String) scripts
							.get("onFooterRefresh"));

			dataset.insertRecord();
			dataset.setString("event", "onGetCellEditor");
			dataset.setString("parameters", "column, cell, editor, record");
			dataset
					.setString("sample", (String) scripts
							.get("onGetCellEditor"));

			dataset.insertRecord();
			dataset.setString("event", "onHeaderRefresh");
			dataset.setString("parameters", "column, cell, value");
			dataset
					.setString("sample", (String) scripts
							.get("onHeaderRefresh"));
		}

	}

}

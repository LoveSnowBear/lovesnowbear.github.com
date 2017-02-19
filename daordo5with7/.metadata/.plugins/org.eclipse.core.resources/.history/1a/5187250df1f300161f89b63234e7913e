package sample.skills.table.test;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;

/**
 * ColumnsListener
 */
public class ColumnsListener extends AbstractDatasetListener {
	public void afterLoadData(Dataset dataset) throws Exception {
		Map map = ColumnHelper.getColumnInfos();
		Iterator iter = map.keySet().iterator();
		while (iter.hasNext()) {
			String columnName = (String) iter.next();
			List list = (List) map.get(columnName);

			dataset.insertRecord();
			dataset.setString("column", columnName);
			dataset.setString("label", (String) list.get(1));
		}
	}

}

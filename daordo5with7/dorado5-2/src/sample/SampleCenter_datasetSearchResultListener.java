package sample;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;

/**
 * SampleCenter_datasetSearchResultListener
 */
public class SampleCenter_datasetSearchResultListener extends
		AbstractDatasetListener {
	private static final int MAX_RESULT = 100;

	public void afterLoadData(Dataset dataset) throws Exception {
		String searchCondition = dataset.parameters().getString(
				"searchCondition");
		if (StringUtils.isEmpty(searchCondition)) {
			return;
		}

		// Search by SQL
		searchCondition = "%" + searchCondition.toUpperCase() + "%";
		StringBuffer sql = new StringBuffer(
				"SELECT S.*, (SELECT COUNT(1) FROM SAMPLE C WHERE C.PARENT_SAMPLE_ID=S.SAMPLE_ID) CHILD_NUM ");
		sql.append("FROM SAMPLE S ");
		sql.append("WHERE ");
		sql.append("UPPER(S.SAMPLE_NAME) LIKE '").append(searchCondition)
				.append("' OR ");
		sql.append("UPPER(S.KEY_WORD) LIKE '").append(searchCondition).append(
				"' OR ");
		sql.append("UPPER(S.PATH) LIKE '").append(searchCondition).append(
				"' OR ");
		sql.append("UPPER(S.DESCRIPTION) LIKE '").append(searchCondition)
				.append("' ");
		sql.append("ORDER BY S.NODE_TYPE");
		DBStatement st = new DBStatement(sql.toString());
		try {
			List list = st.queryForList();
			int size = list.size();
			for (int i = 0; i < size && i < MAX_RESULT; i++) {
				VariantSet vs = (VariantSet) list.get(i);
				dataset.insertRecord();
				dataset.setString("SAMPLE_ID", vs.getString("SAMPLE_ID"));
				dataset.setString("SAMPLE_NAME", vs.getString("SAMPLE_NAME"));
				dataset.setString("PATH", vs.getString("PATH"));
				dataset.setString("NODE_TYPE", vs.getString("NODE_TYPE"));
				dataset.setBoolean("HIGH_LIGHT", vs.getBoolean("HIGH_LIGHT"));
				dataset.setInt("CHILD_NUM", vs.getInt("CHILD_NUM"));
			}
		} finally {
			st.close();
		}
	}

}

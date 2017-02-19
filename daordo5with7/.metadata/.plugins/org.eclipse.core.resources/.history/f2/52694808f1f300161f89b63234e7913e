package sample;

import java.util.List;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;

/**
 * SampleCenter_datasetSampleListener
 */
public class SampleCenter_datasetSampleListener extends AbstractDatasetListener {
	private static final String NULL_PARENT_ID = "$null";
	private static final String START_SAMPLE_PARENT_ID = "$start_sample";
	private static final String NEW_SAMPLE_PARENT_ID = "$new_sample";

	public boolean beforeLoadData(Dataset dataset) throws Exception {
		ParameterSet parameter = dataset.parameters();
		String parentSampleId = parameter.getString("PARENT_SAMPLE_ID");
		if (START_SAMPLE_PARENT_ID.equals(parentSampleId)) {
			StringBuffer sql = new StringBuffer(
					"SELECT S.*, (SELECT COUNT(1) FROM SAMPLE C WHERE C.PARENT_SAMPLE_ID=S.SAMPLE_ID) CHILD_NUM ");
			sql.append("FROM START_SAMPLE START, SAMPLE S ");
			sql.append("WHERE START.SAMPLE_ID = S.SAMPLE_ID ");
			sql.append("ORDER BY START.SORT_ORDER");
			DBStatement st = new DBStatement(sql.toString());
			try {
				List list = st.queryForList();
				int size = list.size();
				for (int i = 0; i < size; i++) {
					VariantSet vs = (VariantSet) list.get(i);
					dataset.insertRecord();
					dataset.setString("SAMPLE_ID", vs.getString("SAMPLE_ID"));
					dataset.setString("SAMPLE_NAME", vs
							.getString("SAMPLE_NAME"));
					dataset.setString("PATH", vs.getString("PATH"));
					dataset.setString("NODE_TYPE", vs.getString("NODE_TYPE"));
					dataset.setBoolean("HIGH_LIGHT", vs
							.getBoolean("HIGH_LIGHT"));
					dataset.setInt("CHILD_NUM", vs.getInt("CHILD_NUM"));
				}
			} finally {
				st.close();
			}
			return false;
		} else if (NEW_SAMPLE_PARENT_ID.equals(parentSampleId)) {
			parameter.setBoolean("HIGH_LIGHT", true);
			parameter.remove("PARENT_SAMPLE_ID");
			return true;
		} else {
			if (NULL_PARENT_ID.equals(parentSampleId)) {
				int startNum = 0;
				int newNum = 0;
				DBStatement st = new DBStatement();
				try {
					st
							.setSql("SELECT COUNT(1) CHILD_NUM FROM SAMPLE WHERE HIGH_LIGHT=:HIGH_LIGHT");
					st.parameters().setBoolean("HIGH_LIGHT", true);
					VariantSet vs = st.query();
					newNum = vs.getInt("CHILD_NUM");

					st.setSql("SELECT COUNT(1) CHILD_NUM FROM START_SAMPLE");
					vs = st.query();
					startNum = vs.getInt("CHILD_NUM");
				} finally {
					st.close();
				}

				dataset.insertRecord();
				dataset.setString("SAMPLE_ID", NEW_SAMPLE_PARENT_ID);
				dataset.setString("SAMPLE_NAME", "最新示例");
				dataset.setInt("NODE_TYPE", 1);
				dataset.setInt("CHILD_NUM", newNum);

				dataset.insertRecord();
				dataset.setString("SAMPLE_ID", START_SAMPLE_PARENT_ID);
				dataset.setString("SAMPLE_NAME", "快速体验");
				dataset.setInt("NODE_TYPE", 1);
				dataset.setInt("CHILD_NUM", startNum);
			}

			parameter.remove("HIGH_LIGHT");
			return true;
		}
	}

}

package sample.skills.tree;

import java.util.List;

import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.RecordIterator;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * ProductTreeViewModel
 */
public class ProductTreeViewModel extends DefaultViewModel {
	protected void doUpdateData(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		DBStatement stCategory = new DBStatement();
		stCategory.setSql(DBStatement.SELECT, "category");

		DBStatement stDelCategory = new DBStatement();
		stDelCategory.setSql(DBStatement.DELETE, "category");

		DBStatement stDelProduct = new DBStatement();
		stDelProduct.setSql(DBStatement.DELETE, "product");

		try {
			Dataset datasetCategory = getDataset("datasetCategory");
			RecordIterator iter = datasetCategory.recordIterator();
			iter.setVisibility(Dataset.FILTER_DELETED);
			while (iter.hasNext()) {
				Record record = iter.nextRecord();
				deleteChildCategory(record.getString("category_id"),
						stCategory, stDelCategory, stDelProduct);
			}
		} finally {
			stCategory.close();
			stDelCategory.close();
			stDelProduct.close();
		}
		super.doUpdateData(parameters, outParameters);
	}

	private void deleteChildCategory(String categoryId, DBStatement stCategory,
			DBStatement stDelCategory, DBStatement stDelProduct)
			throws Exception {
		stCategory.parameters().setString("parent_id", categoryId);
		List list = stCategory.queryForList();
		int size = list.size();
		for (int i = 0; i < size; i++) {
			VariantSet category = (VariantSet) list.get(i);
			deleteChildCategory(category.getString("category_id"), stCategory,
					stDelCategory, stDelProduct);
		}

		stDelCategory.parameters().setString("category_id", categoryId);
		stDelCategory.execute();

		stDelProduct.parameters().setString("category_id", categoryId);
		stDelProduct.execute();
	}

}

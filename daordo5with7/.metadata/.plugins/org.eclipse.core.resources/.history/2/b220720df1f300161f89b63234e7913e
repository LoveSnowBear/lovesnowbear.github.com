package sample.scene.query;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;
import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.data.ViewDataset;

/**
 * TreeQueryViewModel
 */
public class TreeQueryViewModel extends DefaultViewModel {
	public void getNodePath(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		String productId = parameters.getString("productId");
		String categoryId = parameters.getString("categoryId");
		List categoryList = new ArrayList();
		DBStatement dbStmt = new DBStatement();
		categoryList.add(productId);
		try {
			while (categoryId != null) {
				categoryList.add(categoryId);
				dbStmt.setSql("select PARENT_ID from CATEGORY where CATEGORY_ID=:categoryId");
				dbStmt.parameters().setString("categoryId", categoryId);
				VariantSet vs = dbStmt.query();
				if (vs == null) {
					throw new Exception("这不是一个正确的树节点，因为没有编号为" + categoryId + "的节点");
				}
				categoryId = vs.getString(0);
			}
			Object[] categoryArray = categoryList.toArray();
			ArrayUtils.reverse(categoryArray);
			String nodePath = StringUtils.join(categoryArray, ',');
			outParameters.setString("nodePath", nodePath);
			outParameters.setString("productId", productId);
		} catch (Exception e) {
			throw e;
		} finally {
			dbStmt.close();
		}
	}

	public void deleteProduct(ParameterSet parameters, ParameterSet outParameters) throws Exception {
		ViewDataset datasetProduct = this.getDataset("datasetProduct");
		datasetProduct.getCurrent().setState(Record.STATE_DELETED);
		//datasetProduct.update();
	}
}

package sample.skills.other;

import java.util.List;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;
import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.control.Menu;
import com.bstek.dorado.view.control.MenuItem;
import com.bstek.dorado.view.control.MenuItemContainer;

/**
 * RoleConfigViewModel
 */
public class RoleConfigViewModel extends DefaultViewModel {
	private void createMenuItem(MenuItemContainer itemContainer, String parentId)
			throws Exception {
		DBStatement st = new DBStatement();
		try {
			st.setSql(DBStatement.SELECT, "category");
			if (parentId == null) {
				st.parameters().setString("parent_id", "$null");
			} else {
				st.parameters().setString("parent_id", parentId);
			}

			List list = st.queryForList();
			int sz = list.size();
			for (int i = 0; i < sz; i++) {
				VariantSet category = (VariantSet) list.get(i);
				String categoryId = category.getString("category_id");
				MenuItem item = itemContainer.addItem(categoryId, category
						.getString("category_name")
						+ "[" + categoryId + "]");
				createMenuItem(item, categoryId);
			}
		} finally {
			st.close();
		}
	}

	public void init(int state) throws Exception {
		DoradoContext context = DoradoContext.getContext();
		setRole(context.getParameter("role"));
		super.init(state);
	}

	protected void initControls() throws Exception {
		super.initControls();

		Menu menu1 = (Menu) getControl("menu1");
		createMenuItem((MenuItemContainer) menu1, null);
	}

}

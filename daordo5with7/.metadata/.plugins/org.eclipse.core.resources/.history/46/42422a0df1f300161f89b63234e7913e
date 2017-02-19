package sample.skills.table;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.utils.variant.VariantHelper;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * NewTableViewModel
 */
public class TableViewModel extends DefaultViewModel {
	protected void initDatasets() throws Exception {
		super.initDatasets();
		DoradoContext context = DoradoContext.getContext();
		if (getState() == STATE_VIEW
				&& VariantHelper.parseBoolean(context
						.getParameter("autoLoadPage"))) {
			Dataset dataset = getDataset("datasetEmployee");
			dataset.setPageSize(VariantHelper.parseInt(context
					.getParameter("pageSize")));
		}
	}

}

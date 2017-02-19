package sample.skills.layout;

import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.control.tabset.TabElement;
import com.bstek.dorado.view.control.tabset.TabSet;

/**
 * TabSetViewModel
 */
public class TabSetViewModel extends DefaultViewModel {
	protected void initControls() throws Exception {
		Dataset dataset = getDataset("datasetTab");
		TabSet tabset3 = (TabSet) getControl("tabset3");

		int size = tabset3.getTabCount();
		for (int i = 0; i < size; i++) {
			TabElement tab = tabset3.getTab(i);
			dataset.insertRecord();
			dataset.setString("name", tab.getName());
			dataset.setString("label", tab.getLabel());
		}
		dataset.moveFirst();
	}

}

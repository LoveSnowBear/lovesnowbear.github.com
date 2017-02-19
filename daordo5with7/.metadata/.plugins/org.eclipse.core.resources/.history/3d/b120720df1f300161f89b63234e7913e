package sample.scene.query;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;

/**
 * ProductTree_datasetRootListener
 */
public class ProductTree_datasetRootListener
    extends AbstractDatasetListener {
  public void afterLoadData(Dataset dataset)
      throws Exception {
    dataset.insertRecord();
    dataset.setString("category_id", "$null");
    dataset.setString("category_name", "<产品目录>");
  }

}

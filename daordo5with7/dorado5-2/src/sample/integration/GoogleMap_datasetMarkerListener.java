package sample.integration;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;

/**
 * CompanyQuery_datasetMarkerListener
 */
public class GoogleMap_datasetMarkerListener extends AbstractDatasetListener {
	public void afterLoadData(Dataset dataset) throws Exception {
		// 上海
		dataset.insertRecord();
		dataset.setDouble("xpoint", 31.02544756511612);
		dataset.setDouble("ypoint", 121.45546875);
		dataset.setString("name", "上海");
		// 北京
		dataset.insertRecord();
		dataset.setDouble("xpoint", 39.50404070558415);
		dataset.setDouble("ypoint", 115.77216796875);
		dataset.setString("name", "北京");
		// 浙江
		dataset.insertRecord();
		dataset.setDouble("xpoint", 29.20365531807151);
		dataset.setDouble("ypoint", 120.359375);
		dataset.setString("name", "浙江");
		// 河北
		dataset.insertRecord();
		dataset.setDouble("xpoint", 38.37268853598097);
		dataset.setDouble("ypoint", 114.33203125);
		dataset.setString("name", "河北");
		// 南京
		dataset.insertRecord();
		dataset.setDouble("xpoint", 32.00298618122413);
		dataset.setDouble("ypoint", 119.41064453125);
		dataset.setString("name", "南京");
		// 山东
		dataset.insertRecord();
		dataset.setDouble("xpoint", 36.813476231041935);
		dataset.setDouble("ypoint", 118.8505859375);
		dataset.setString("name", "山东");
		// 山西
		dataset.insertRecord();
		dataset.setDouble("xpoint", 36.74498466889473);
		dataset.setDouble("ypoint", 111.8408203125);
		dataset.setString("name", "山西");
		// 陕西
		dataset.insertRecord();
		dataset.setDouble("xpoint", 34.77071473849608);
		dataset.setDouble("ypoint", 108.40185546875);
		dataset.setString("name", "陕西");
		// 广东
		dataset.insertRecord();
		dataset.setDouble("xpoint", 22.926294766395592);
		dataset.setDouble("ypoint", 113.1923828125);
		dataset.setString("name", "广东");
		// 云南
		dataset.insertRecord();
		dataset.setDouble("xpoint", 24.287026865376436);
		dataset.setDouble("ypoint", 99.755859375);
		dataset.setString("name", "云南");
		// 湖南
		dataset.insertRecord();
		dataset.setDouble("xpoint", 28.632746799225852);
		dataset.setDouble("ypoint", 115.20625);
		dataset.setString("name", "湖南");
		// 四川
		dataset.insertRecord();
		dataset.setDouble("xpoint", 31.27083595165);
		dataset.setDouble("ypoint", 100.8994140625);
		dataset.setString("name", "四川");
		// 重庆
		dataset.insertRecord();
		dataset.setDouble("xpoint", 30.003449456820605);
		dataset.setDouble("ypoint", 105.5107421875);
		dataset.setString("name", "重庆");
		// 新疆
		dataset.insertRecord();
		dataset.setDouble("xpoint", 41.244772343082076);
		dataset.setDouble("ypoint", 87.626953125);
		dataset.setString("name", "新疆");
		// 辽宁
		dataset.insertRecord();
		dataset.setDouble("xpoint", 40.94671366508002);
		dataset.setDouble("ypoint", 123.5537109375);
		dataset.setString("name", "辽宁");
		// 江苏
		dataset.insertRecord();
		dataset.setDouble("xpoint", 34.50298618122413);
		dataset.setDouble("ypoint", 118.01064453125);
		dataset.setString("name", "江苏");
		// 湖北
		dataset.insertRecord();
		dataset.setDouble("xpoint", 30.60365531807151);
		dataset.setDouble("ypoint", 114.359375);
		dataset.setString("name", "湖北");
		// 天津
		dataset.insertRecord();
		dataset.setDouble("xpoint", 38.85682013474361);
		dataset.setDouble("ypoint", 117.076171875);
		dataset.setString("name", "天津");
	}

}

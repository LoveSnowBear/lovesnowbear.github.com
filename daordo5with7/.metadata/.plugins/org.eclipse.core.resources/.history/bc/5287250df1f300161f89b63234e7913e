package sample.skills.table.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.common.HttpDoradoContext;
import com.bstek.dorado.common.Setting;
import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.RecordIterator;
import com.bstek.dorado.utils.StringHelper;

/**
 * Main_datasetCssListener
 */
public class CssListener extends AbstractDatasetListener {
	private Map initStaticCSSMap() {
		Map map = new HashMap();

		String skin = Setting.getString("view.smartweb2.skin", "default");
		HttpDoradoContext context = (HttpDoradoContext) DoradoContext
				.getContext();
		String contextPath = context.getRequest().getContextPath();

		String SKIN_ROOT = contextPath
				+ "/dorado/smartweb2.loadStyleSheet.d?skin=" + skin;

		List list = null;
		StringBuffer css = new StringBuffer("");
		// 表格外套Div
		// List list = new ArrayList();
		// list.add(ataTable"); //key
		// list.add("数据表格"); //label
		// list.add(null); //value
		// list.add("background-color: #F5F7F9;"); //sample
		// map.put("DataTable",list);

		// 外套表格(管理滚动栏)
		// list = new ArrayList();
		// list.add(".DataTable .OuterTable");
		// list.add("外套表格(管理滚动栏)");
		// list.add(null); //value
		// css.append("border-width: 1;\n");
		// css.append("border-color: #C5D9E8;\n");
		// css.append("border-style: solid;\n");
		// css.append("border-collapse: collapse;");
		// list.add(css.toString());
		// map.put("OuterTable", list);

		// 外套表格中的数据表格
		// list = new ArrayList();
		// list.add(".DataTable .InnerTable");
		// list.add("外套表格中的数据表格");
		// list.add(null); //value
		// list.add("border-collapse: collapse;");
		// map.put("InnerTable",list);

		// 嵌套表格头的Div
		// list = new ArrayList();
		// list.add(".DataTable .HeaderDiv");
		// list.add("HeaderDiv");
		// list.add(null); //value
		// css= new StringBuffer("");
		// css.append("background-position-y: 100%;\n");
		// css.append("background-image:
		// url("+SKIN_ROOT+"}/datatable_header.gif);");
		// list.add(css.toString());
		// map.put("HeaderDiv",list);

		// 表格头
		list = new ArrayList();
		list.add(".DataTable .HeaderGrid");
		list.add("表格头");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("color: #405368;\n");
		css.append("border-width: 1;/*边框的宽度*/\n");
		css.append("border-color: #C5D9E8;/*边框的颜色*/\n");
		css
				.append("border-style: solid;/*边框的风格,可选值有:none,dotted,dashed,solid,double,groove,ridge,inset,window-inset,outset*/\n");
		css
				.append("border-collapse: collapse;/*边框是否具有三维效果.可选择值有:separate,collapse*/\n");
		css
				.append("table-layout: fixed;/*表格的宽度是否根据内容自动适应，如果fixed则锁定宽度，可选值有auto,fixed*/");
		list.add(css.toString());
		map.put("HeaderGrid", list);

		// 表格头激活单元格(鼠标的moveover事件)
		list = new ArrayList();
		list.add(".DataTable .HeaderGrid .HotCell");
		list.add("表格头激活单元格(鼠标的moveover事件)");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-position-y: 100%;/*背景图片高度在单元框中的高度*/\n");
		css.append("background-image: url(" + SKIN_ROOT
				+ "/datatable_header_hot.gif);/*背景图片*/");
		list.add(css.toString());
		map.put("HeaderGrid.HotCell", list);

		// 统计栏Grid
		list = new ArrayList();
		list.add(".DataTable .FooterGrid");
		list.add("统计栏Grid");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-color: #E1EAF1;/*背景色*/\n");
		css.append("border-width: 1;/*边框的宽度*/\n");
		css.append("border-color: #C5D9E8;/*边框的颜色*/\n");
		css
				.append("border-style: solid;/*边框的风格,可选值有:none,dotted,dashed,solid,double,groove,ridge,inset,window-inset,outset*/\n");
		css.append("border-collapse: collapse;/*可选择值有:separate,collapse*/\n");
		css
				.append("table-layout: fixed;/*表格的宽度是否根据内容自动适应，如果fixed则锁定宽度，可选值有auto,fixed*/");
		list.add(css.toString());
		map.put("FooterGrid", list);

		// 锁定列所在的表格数据Grid
		list = new ArrayList();
		list.add(".DataTable .FixedDataGrid");
		list.add("锁定列所在的表格数据Grid");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-color: #EDF2F6;/*背景色*/\n");
		css.append("border-width: 1;/*边框的宽度*/\n");
		css.append("border-color: #C5D9E8;/*边框的颜色*/\n");
		css
				.append("border-style: solid;/*边框的风格,可选值有:none,dotted,dashed,solid,double,groove,ridge,inset,window-inset,outset*/\n");
		css.append("border-collapse: collapse;/*可选择值有:separate,collapse*/\n");
		css
				.append("table-layout: fixed;/*表格的宽度是否根据内容自动适应，如果fixed则锁定宽度，可选值有auto,fixed*/");
		list.add(css.toString());
		map.put("FixedDataGrid", list);

		// 锁定列所在的表格数据Grid的行指示器
		list = new ArrayList();
		list.add(".DataTable .FixedDataGrid .Indicator");
		list.add("锁定列表格的行指示器");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-color: #E6EDF2;/*背景色*/");
		list.add(css.toString());
		map.put("FixedDataGrid.Indicator", list);

		// 锁定列所在的表格数据Grid的表格行
		list = new ArrayList();
		list.add(".DataTable .FixedDataGrid .Row");
		list.add("锁定列表格行");
		list.add(null); // value
		list.add(null);
		map.put("FixedDataGrid.Row", list);

		// 锁定列所在的表格数据Grid的虚拟行
		list = new ArrayList();
		list.add(".DataTable .FixedDataGrid .MockRow");
		list.add("锁定列表格虚拟行");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-color: #F0F0F0;/*背景色*/");
		list.add(css.toString());
		map.put("FixedDataGrid.MockRow", list);

		// 锁定列所在的表格数据Grid的当前激活行
		list = new ArrayList();
		list.add(".DataTable .FixedDataGrid .CurrentRow");
		list.add("锁定列表格当前激活行");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-color: #B7F39B;/*背景色*/");
		list.add(css.toString());
		map.put("FixedDataGrid.CurrentRow", list);

		// 表格数据Grid
		list = new ArrayList();
		list.add(".DataTable .DataGrid");
		list.add("表格数据Grid");
		list.add(null); // value
		css = new StringBuffer("");
		css.append("background-color: #F5F7F9;/*背景色*/\n");
		css.append("border-width: 1;/*边框的宽度*/\n");
		css.append("border-color: #C5D9E8;/*边框的颜色*/\n");
		css
				.append("border-style: solid;/*边框的风格,可选值有:none,dotted,dashed,solid,double,groove,ridge,inset,window-inset,outset*/\n");
		css.append("border-collapse: collapse;/*可选择值有:separate,collapse*/\n");
		list.add(css.toString());
		map.put("DataGrid", list);

		// 表格行
		list = new ArrayList();
		list.add(".DataTable .DataGrid .Row");
		list.add("表格行");
		list.add(null); // value
		list.add(null);
		map.put("DataGrid.Row", list);

		// 虚拟行
		list = new ArrayList();
		list.add(".DataTable .DataGrid .MockRow");
		list.add("表格虚拟行");
		list.add(null); // value
		css = new StringBuffer("");
		css.append(" background-color: #F0F0F0;/*背景色*/");
		list.add(css.toString());
		map.put("DataGrid.MockRow", list);

		// 表格激活行
		list = new ArrayList();
		list.add(".DataTable .DataGrid .CurrentRow");
		list.add("表格激活行");
		list.add(null); // value
		css = new StringBuffer("");
		css.append(" background-color: #B7F39B;/*背景色*/");
		list.add(css.toString());
		map.put("DataGrid.CurrentRow", list);

		return map;
	}

	public void afterLoadData(Dataset dataset) throws Exception {
		String eventSet = dataset.parameters().getString("eventSet");
		Map map = getSessionCSS(eventSet);
		int index = 0;
		Iterator iter = map.keySet().iterator();
		while (iter.hasNext()) {
			String cssName = (String) iter.next();
			List list = (List) map.get(cssName);
			dataset.insertRecord();
			dataset.setInt("index", ++index);
			dataset.setString("id", cssName);
			dataset.setString("key", (String) list.get(0));
			dataset.setString("label", (String) list.get(1));
			dataset.setString("value", (String) list.get(2));
			dataset.setString("sample", (String) list.get(3));
		}
	}

	public boolean beforeUpdateData(Dataset dataset) throws Exception {
		String eventSet = dataset.parameters().getString("eventSet");
		Map map = getSessionCSS(eventSet);
		RecordIterator ri = dataset.recordIterator();
		ri.setVisibility(Dataset.FILTER_CHANGED);
		while (ri.hasNext()) {
			Record record = ri.nextRecord();
			String id = record.getString("id");
			String value = record.getString("value");
			List list = (List) map.get(id);
			if (StringHelper.isNotEmpty(value)) {
				list.set(2, value);
			} else {
				list.set(2, null);
			}
		}
		DoradoContext context = DoradoContext.getContext();
		if (map.size() > 0) {
			context.setAttribute(DoradoContext.SESSION, eventSet + ".CSS", map);
		}

		return true;
	}

	private Map getSessionCSS(String eventSet) {
		DoradoContext context = DoradoContext.getContext();
		Object o = context.getAttribute(DoradoContext.SESSION, eventSet
				+ ".CSS");
		if (o != null && o instanceof Map) {
			return (Map) o;
		} else {

			return initStaticCSSMap();
		}
	}

}

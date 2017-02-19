package sample.skills.table.test;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.utils.StringHelper;

public class CssOutputter {
	public static String getCssString(String eventSet) {
		StringBuffer sb = new StringBuffer("");
		DoradoContext context = DoradoContext.getContext();
		Map map = (Map) context.getAttribute(DoradoContext.SESSION, eventSet
				+ ".CSS");
		if (map != null) {
			Iterator iter = map.keySet().iterator();
			while (iter.hasNext()) {
				String id = (String) iter.next();
				List list = (List) map.get(id);
				String key = (String) list.get(0);
				String value = (String) list.get(2);
				if (StringHelper.isNotEmpty(value)) {
					sb.append(key + " {");
					sb.append(value);
					sb.append(" }");
				}
			}
		}
		String cssString = sb.toString();
		return "<style>" + cssString + "</style>";
	}
}

package sample.report.excel;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.report.excel.ExcelProcessorListener;
import com.bstek.dorado.report.excel.engine.Context;
import com.bstek.dorado.report.excel.template.Template;
import jxl.SheetSettings;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ReadOnlyExcelProcessorListener implements ExcelProcessorListener {

	public void afterProcess(Template template, WritableWorkbook workbook,
			WritableSheet sheet, Context context) throws Exception {
		DoradoContext doradoContext = DoradoContext.getContext();
		String user = doradoContext.getParameter("user");
		if ("user1".equals(user)) {
			SheetSettings settings = sheet.getSettings();
			settings.setPassword("123");
			settings.setProtected(true);
		}
	}

	public void beforeProcess(Template template, WritableWorkbook workbook,
			WritableSheet sheet, Context context) throws Exception {
	}
}

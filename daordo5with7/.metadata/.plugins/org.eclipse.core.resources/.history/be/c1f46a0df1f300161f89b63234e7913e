package sample.scene.submit;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.BooleanCell;
import jxl.Cell;
import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;

import com.bstek.dorado.data.AbstractDatasetListener;
import com.bstek.dorado.data.Dataset;

/**
 * ExcelImport_datasetEmployeeListener
 */
public class ExcelImport_datasetEmployeeListener extends
		AbstractDatasetListener {
	public boolean beforeLoadData(Dataset dataset) throws Exception {
		String path = ExcelController.UPLOAD_WORK_PATH+"/"+dataset.parameters().getString("fileName");
		System.out.println("path:"+path);
		List employeeList = parse(path); 
		dataset.fromDO(employeeList);
		dataset.setPossibleRecordCount(employeeList.size());
		return true;
	}

	public  List parse(String path) throws Exception {
		List employeeList = new ArrayList();
		File excelFile = new File(path);
		if(excelFile.exists()){
			Workbook workbook = Workbook.getWorkbook(excelFile);
			Sheet sheet = workbook.getSheet(0);
			for (int i = 2; i < sheet.getRows(); i++) {
				employeeList.add(getEmployee(sheet.getRow(i)));
			}
			workbook.close();
			excelFile.delete();
		}
		return employeeList;
	}

	public Map getEmployee(Cell[] cells) {
		Map employee = new HashMap(12);
		String[] columns = { "employee_id", "employee_name", "dept_name","married", "sex", "birthday", "salary", "degree","email", "web", "cmnt" };
		for (int i = 0, l = Math.min(cells.length, columns.length); i < l; i++) {
			Cell cell = cells[i];
			CellType cellType = cell.getType();
			if(cellType == CellType.NUMBER){
				employee.put(columns[i],  new Double(((NumberCell)cell).getValue()));
			}else if(cellType == CellType.BOOLEAN){
				employee.put(columns[i], new Boolean(((BooleanCell)cell).getValue()));
			}else {
				employee.put(columns[i], cell.getContents());
			}
		}
		return employee;
	}
}

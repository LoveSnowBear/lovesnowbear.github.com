package sample.scene.validate;

import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.DoradoException;
import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.data.ViewDataset;

/**
 * UniqueValidateBeforeSaveViewModel
 */
public class UniqueValidateBeforeSaveViewModel extends DefaultViewModel {
	
	public void updateRecord(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		ViewDataset datasetEmployee = this.getDataset("datasetEmployee");
		Record employee = datasetEmployee.getCurrent();
		switch (employee.getState()) {
		case Record.STATE_MODIFIED:
			if (isExist(employee)) {
				throw new DoradoException("用户名已存在！");
			}
			excuteJdbc(DBStatement.UPDATE, employee);
			break;
		case Record.STATE_NEW:
			excuteJdbc(DBStatement.INSERT, employee);
			break;
		case Record.STATE_DELETED:
			excuteJdbc(DBStatement.DELETE, employee);
			datasetEmployee.deleteRecord(employee);
			break;
		}
		super.doUpdateData(parameters, outParameters);
	}

	private boolean isExist(Record employee) throws Exception {
		DBStatement stmt = new DBStatement();
		stmt.setDataSource("doradosample");
		stmt.setSql("select * from employee where employee_id=:ID");
		stmt.parameters().setString("ID", employee.getString("EMPLOYEE_ID"));
		boolean exist = stmt.queryForList().size() > 0;
		stmt.close();
		return exist;
	}

	private void copyProperties(DBStatement jdbc, Record employee) {
		ParameterSet params = jdbc.parameters();
		params.setString("EMPLOYEE_ID", employee.getString("EMPLOYEE_ID"));
		params.setString("EMPLOYEE_NAME", employee.getString("EMPLOYEE_NAME"));
		params.setString("DEPT_ID", employee.getString("DEPT_ID"));
		params.setBoolean("SEX", employee.getBoolean("SEX"));
		params.setBoolean("MARRIED", employee.getBoolean("MARRIED"));
		params.setDate("BIRTHDAY", employee.getDate("BIRTHDAY"));
		params.setFloat("SALARY", employee.getFloat("SALARY"));
		params.setString("DEGREE", employee.getString("DEGREE"));
		params.setString("EMAIL", employee.getString("EMAIL"));
		params.setString("WEB", employee.getString("WEB"));
		params.setString("CMNT", employee.getString("CMNT"));
	}

	private void excuteJdbc(String executeState, Record employee)
			throws Exception {
		DBStatement stmt = new DBStatement();
		stmt.setDataSource("doradosample");
		stmt.setSql(executeState, "EMPLOYEE", "EMPLOYEE_ID");
		copyProperties(stmt, employee);
		try {
			stmt.execute();
		} catch (Exception e) {
			throw e;
		} finally {
			stmt.close();
		}
	}
}

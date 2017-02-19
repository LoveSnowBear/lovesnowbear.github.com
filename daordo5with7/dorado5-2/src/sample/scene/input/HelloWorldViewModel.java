package sample.scene.input;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import com.bstek.dorado.data.PagingHelper;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.VariantSet;
import com.bstek.dorado.view.data.ViewDataset;


/**
 * HelloWorldViewModel
 */
public class HelloWorldViewModel extends
		com.bstek.dorado.view.impl.DynaViewModel {
	protected void doLoadData(ViewDataset dataset) throws Exception {
	        String datasetId = dataset.getId();
		if ("datasetEmployee".equals(datasetId)) {
			doLoadEmployee(dataset);
		}
		super.doLoadData(dataset);
		if ("datasetEmployee".equals(datasetId)) {
		  dataset.moveFirst();
		  dataset.resetRecordsState();
		}
	}

	// 加载datasetEmployee数据
	private void doLoadEmployee(ViewDataset datasetEmployee) throws Exception {
		DBStatement jdbc = null;
		List employees = null;
		try {
			ParameterSet clientParameters = datasetEmployee.parameters();
			// 构建查询员工的Sql
			String sql = buildQueryEmployeeSql(clientParameters).toString();
			jdbc = new DBStatement();
			jdbc.setSql(sql);
			jdbc.parameters().assign(clientParameters);
			employees = jdbc.queryForList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(jdbc!=null){
				jdbc.close();
			}
		}
		
		PagingHelper pagingHelper = new PagingHelper();
		pagingHelper.setPageIndex(datasetEmployee.getPageIndex());
		pagingHelper.setPageSize(datasetEmployee.getPageSize());
		pagingHelper.setTotalRow(employees.size());
		List employeePage = employees.subList(pagingHelper.getFromIndex(),pagingHelper.getToIndex());
		//datasetEmployee.fromDO(employeePage);
		
		for(int i=0,l=employeePage.size(); i<l; i++){
			VariantSet employeeVs = (VariantSet)employeePage.get(i);
			Record employeeRd = datasetEmployee.insertRecord();
			employeeRd.setString("EMPLOYEE_ID", employeeVs.getString("EMPLOYEE_ID"));
			employeeRd.setString("EMPLOYEE_NAME", employeeVs.getString("EMPLOYEE_NAME"));
			employeeRd.setString("DEPT_ID", employeeVs.getString("DEPT_ID"));
			employeeRd.setBoolean("SEX", employeeVs.getBoolean("SEX"));
			employeeRd.setBoolean("MARRIED", employeeVs.getBoolean("MARRIED"));
			employeeRd.setDate("BIRTHDAY", employeeVs.getDate("BIRTHDAY"));
			employeeRd.setFloat("SALARY", employeeVs.getFloat("SALARY"));
			employeeRd.setString("DEGREE", employeeVs.getString("DEGREE"));
			employeeRd.setString("EMAIL", employeeVs.getString("EMAIL"));
			employeeRd.setString("WEB", employeeVs.getString("WEB"));
			employeeRd.setString("CMNT", employeeVs.getString("CMNT"));
		}
		datasetEmployee.setPossibleRecordCount(employees.size());
		datasetEmployee.setPageCount(pagingHelper.getPageCount());
	}

	// 构建查询员工的Sql
	private StringBuffer buildQueryEmployeeSql(ParameterSet clientParameters) {
		StringBuffer sql = new StringBuffer(50)
				.append("select * from EMPLOYEE");

		List whereUnits = new ArrayList(4);
		StringBuffer sqlWhere = null;
		// Log.debug("Client===" + clientParameters);

		String parameterValue = null;
		parameterValue = clientParameters.getString("employee_id");
		if (!StringUtils.isEmpty(parameterValue)) {
			whereUnits.add(" EMPLOYEE_ID like :employee_id ");
			clientParameters.setString("employee_id", "%" + parameterValue.toUpperCase() + "%");
		}
		parameterValue = clientParameters.getString("employee_name");
		if (!StringUtils.isEmpty(parameterValue)) {
			whereUnits.add(" EMPLOYEE_NAME like :employee_name ");
			clientParameters.setString("employee_name", "%" + parameterValue
					+ "%");
		}
		parameterValue = clientParameters.getString("sex");
		if (!StringUtils.isEmpty(parameterValue)) {
			whereUnits.add(" SEX = :sex ");
		}
		parameterValue = clientParameters.getString("dept_id");
		if (!StringUtils.isEmpty(parameterValue)) {
			whereUnits.add(" DEPT_ID = :dept_id ");
		}

		int countWhereUnits = whereUnits.size();
		if (countWhereUnits > 0) {
			sqlWhere = new StringBuffer().append(" where ").append(
					whereUnits.get(0).toString());
			for (int i = 1; i < countWhereUnits; i++) {
				sqlWhere.append(" and " + whereUnits.get(i).toString());
			}
			sql.append(sqlWhere);
		}
		return sql;
	}

	public void updateCurrentEmployee(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {

		ViewDataset datasetEmployee = this.getDataset("datasetEmployee");
		Record employee = datasetEmployee.getCurrent();

		DBStatement jdbc;
		ParameterSet jdbcParameters;
		switch (employee.getState()) {
		case Record.STATE_MODIFIED:
			jdbc = new DBStatement();
			jdbc.setSql(DBStatement.UPDATE, "EMPLOYEE", "EMPLOYEE_ID");
			jdbcParameters = jdbc.parameters();
			jdbcParameters.setString("EMPLOYEE_ID", employee
					.getString("EMPLOYEE_ID"));
			jdbcParameters.setString("EMPLOYEE_NAME", employee
					.getString("EMPLOYEE_NAME"));
			jdbcParameters.setString("DEPT_ID", employee.getString("DEPT_ID"));
			jdbcParameters.setBoolean("SEX", employee.getBoolean("SEX"));
			jdbcParameters
					.setBoolean("MARRIED", employee.getBoolean("MARRIED"));
			jdbcParameters.setDate("BIRTHDAY", employee.getDate("BIRTHDAY"));
			jdbcParameters.setFloat("SALARY", employee.getFloat("SALARY"));
			jdbcParameters.setString("DEGREE", employee.getString("DEGREE"));
			jdbcParameters.setString("EMAIL", employee.getString("EMAIL"));
			jdbcParameters.setString("WEB", employee.getString("WEB"));
			jdbcParameters.setString("CMNT", employee.getString("CMNT"));
			try {
				jdbc.execute();
				employee.setState(Record.STATE_NONE);
			} catch (Exception e) {
				throw e;
			} finally {
				jdbc.close();
			}

			break;
		case Record.STATE_NEW:
			jdbc = new DBStatement();
			jdbc.setSql(DBStatement.INSERT, "EMPLOYEE", "EMPLOYEE_ID");
			jdbcParameters = jdbc.parameters();
			jdbcParameters.setString("EMPLOYEE_ID", employee
					.getString("EMPLOYEE_ID"));
			jdbcParameters.setString("EMPLOYEE_NAME", employee
					.getString("EMPLOYEE_NAME"));
			jdbcParameters.setString("DEPT_ID", employee.getString("DEPT_ID"));
			jdbcParameters.setBoolean("SEX", employee.getBoolean("SEX"));
			jdbcParameters
					.setBoolean("MARRIED", employee.getBoolean("MARRIED"));
			jdbcParameters.setDate("BIRTHDAY", employee.getDate("BIRTHDAY"));
			jdbcParameters.setFloat("SALARY", employee.getFloat("SALARY"));
			jdbcParameters.setString("DEGREE", employee.getString("DEGREE"));
			jdbcParameters.setString("EMAIL", employee.getString("EMAIL"));
			jdbcParameters.setString("WEB", employee.getString("WEB"));
			jdbcParameters.setString("CMNT", employee.getString("CMNT"));

			try {
				jdbc.execute();
				employee.setState(Record.STATE_NONE);
			} catch (Exception e) {
				throw e;
			} finally {
				jdbc.close();
			}
		}
	}

	public void deleteCurrentEmployee(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		ViewDataset datasetEmployee = this.getDataset("datasetEmployee");
		Record employee = datasetEmployee.getCurrent();

		DBStatement jdbc = new DBStatement();
		jdbc.setSql(DBStatement.DELETE, "EMPLOYEE", "EMPLOYEE_ID");
		ParameterSet jdbcParameters = jdbc.parameters();
		jdbcParameters.setString("EMPLOYEE_ID", employee
				.getString("EMPLOYEE_ID"));

		try {
			jdbc.execute();
			datasetEmployee.deleteRecord(employee);
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc.close();
		}
	}

	public void raiseSalary(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		ViewDataset datasetEmployee = this.getDataset("datasetEmployee");
		Record employee = datasetEmployee.getCurrent();

		float salary = employee.getFloat("SALARY");
		employee.setFloat("SALARY", salary + 500);

		DBStatement jdbc = new DBStatement();
		jdbc.setSql(DBStatement.UPDATE, "EMPLOYEE", "EMPLOYEE_ID");
		jdbc.parameters().setString("EMPLOYEE_ID",
				employee.getString("EMPLOYEE_ID"));
		jdbc.parameters().setFloat("SALARY", employee.getFloat("SALARY"));

		try {
			jdbc.execute();
			employee.setState(Record.STATE_NONE);
			employee.setBoolean("raiseSalaryFlag", true);
			datasetEmployee.resetRecordsState();
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc.close();
		}
	}

}

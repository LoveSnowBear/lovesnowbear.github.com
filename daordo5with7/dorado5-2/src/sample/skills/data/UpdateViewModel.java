package sample.skills.data;

import java.util.Date;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.common.MessageHelper;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.data.Record;
import com.bstek.dorado.data.RecordIterator;
import com.bstek.dorado.data.db.DBStatement;
import com.bstek.dorado.utils.variant.DataType;
import com.bstek.dorado.view.DefaultViewModel;

/**
 * UpdateViewModel
 */
public class UpdateViewModel extends DefaultViewModel {
	public void deleteSelection(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		int count = 0;
		Dataset datasetEmployee = getDataset("datasetEmployee");
		RecordIterator iter = datasetEmployee.recordIterator();
		while (iter.hasNext()) {
			Record record = iter.nextRecord();
			datasetEmployee.deleteRecord(record);
			count++;
		}
		outParameters.setString("$message", "共有" + count + "条记录被删除!");
		super.doUpdateData(parameters, outParameters);
	}

	public void raiseSalary(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		Dataset datasetEmployee = getDataset("datasetEmployee");
		if (datasetEmployee.getCurrent() != null) {
			float salary = datasetEmployee.getFloat("salary") + 500;
			datasetEmployee.setFloat("salary", salary);

			outParameters.setString("$message", "["
					+ datasetEmployee.getString("employee_name") + "]已加薪至"
					+ salary + "!");
		}
		super.doUpdateData(parameters, outParameters);
	}

	public void saveAndLog(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		int count = 0;
		DBStatement statement = new DBStatement();
		statement.setSql(DBStatement.INSERT, "LOG");
		try {
			Dataset datasetEmployee = getDataset("datasetEmployee");
			RecordIterator ri = datasetEmployee.recordIterator();
			ri.setVisibility(Dataset.FILTER_CHANGED); // 确保遍历到每一条有变化的记录
			while (ri.hasNext()) {
				Record record = ri.nextRecord();
				String operation;
				switch (record.getState()) {
				case Record.STATE_NEW:
					operation = "[Insert] ";
					break;
				case Record.STATE_MODIFIED:
					operation = "[Modify] ";
					break;
				case Record.STATE_DELETED:
					operation = "[Delete] ";
					break;
				default:
					operation = "[Unknown]";
				}

				statement.parameters().setDataType("MSG_TIME",
						DataType.DATETIME);
				statement.parameters().setDate("MSG_TIME", new Date());
				statement.parameters().setString("MSG",
						operation + " " + record.getString("employee_name"));
				statement.execute();
				count++;
			}
		} finally {
			statement.close();
		}

		super.doUpdateData(parameters, outParameters);

		if (count > 0) {
			MessageHelper.addMessage(DoradoContext.getContext(), "已添加了\""
					+ count + "\"条日志记录!");
		}
	}
}

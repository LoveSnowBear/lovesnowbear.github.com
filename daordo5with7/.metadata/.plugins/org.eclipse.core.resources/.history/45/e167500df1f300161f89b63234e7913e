package sample.skills.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.common.MessageHelper;
import com.bstek.dorado.data.Dataset;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.view.DefaultViewModel;
import sample.skills.data.hibernate.HibernateUtils;
import sample.skills.data.vo.Employee;

/**
 * VO1ViewModel
 */
public class VO1ViewModel extends DefaultViewModel {
	public void updateEmployees(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		Session session = HibernateUtils.openSession();
		try {
			Transaction tx = session.beginTransaction();

			List employees;
			int size;

			Dataset dataset = getDataset("datasetEmployee");

			// 处理所有被删除的记录
			// 将Dataset中所有被删除的记录转换到List中
			employees = dataset.toDO(Dataset.FILTER_DELETED);
			size = employees.size();
			for (int i = 0; i < size; i++) {
				Employee employee = (Employee) employees.get(i);
				session.delete(employee);
			}

			// 处理所有被修改的记录
			// 将Dataset中所有被修改的记录转换到List中
			employees = dataset.toDO(Dataset.FILTER_MODIFIED);
			size = employees.size();
			for (int i = 0; i < size; i++) {
				Employee employee = (Employee) employees.get(i);
				session.update(employee);
			}

			// 处理所有新增的记录
			// 将Dataset中所有新增的记录转换到List中
			employees = dataset.toDO(Dataset.FILTER_NEW);
			size = employees.size();
			for (int i = 0; i < size; i++) {
				Employee employee = (Employee) employees.get(i);
				session.save(employee);
			}

			tx.commit();
		} finally {
			HibernateUtils.closeSession();
		}
		super.doUpdateData(parameters, outParameters);
	}

	public void raiseSalary(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		Session session = HibernateUtils.openSession();
		try {
			Transaction tx = session.beginTransaction();

			Dataset dataset = getDataset("datasetEmployee");

			// 将Dataset中的当前记录转换为Bean
			Employee employee = (Employee) dataset.toSingleDO();
			float salary = employee.getSalary() + 500;

			// 设置到此属性中的数据将在提交成功后自动被传回Client端
			employee.setSalary(salary);
			session.update(employee);

			MessageHelper.addMessage(DoradoContext.getContext(), "["
					+ employee.getName() + "]已加薪至" + salary + "!");

			tx.commit();
		} finally {
			HibernateUtils.closeSession();
		}
		super.doUpdateData(parameters, outParameters);
	}

}

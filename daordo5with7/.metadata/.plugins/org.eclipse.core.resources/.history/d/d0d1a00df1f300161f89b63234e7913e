package sample.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bstek.dorado.action.Action;
import com.bstek.dorado.admin.AdminAccessController;

/**
 * AccessController
 */
public class AccessController extends
		com.bstek.dorado.action.impl.AbstractAccessController {

	public boolean login(Action action, HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		return AdminAccessController.preformLogin(action, request, response);
	}

	public void logout(Action action, HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
	}

}

package sample.admin;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.security.AccessChecker;
import com.bstek.dorado.security.AccessDeniedException;
import com.bstek.dorado.security.UserNotLoggedInException;

/**
 * AdminAccessChecker
 */
public class AdminAccessChecker implements AccessChecker {

	public void checkAccess(DoradoContext context, Object object)
			throws AccessDeniedException {
		if (context.getAttribute(DoradoContext.SESSION,
				DEFAULT_LOGIN_SESSION_KEY) == null) {
			throw new UserNotLoggedInException();
		}
	}
}

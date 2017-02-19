import java.util.Locale;

import com.bstek.dorado.common.DoradoContext;
import com.bstek.dorado.data.ParameterSet;
import com.bstek.dorado.i18n.LocaleHelper;
import com.bstek.dorado.i18n.ResourceManager;
import com.bstek.dorado.view.DefaultViewModel;
import com.bstek.dorado.view.ViewModel;

/**
 * MainViewModel
 */
public class MainViewModel extends DefaultViewModel {
	public void changeLanguage(ParameterSet parameters,
			ParameterSet outParameters) throws Exception {
		DoradoContext context = DoradoContext.getContext();
		Locale locale = LocaleHelper.getLocale(
				parameters.getString("language"), parameters
						.getString("country"));
		ResourceManager.getInstance().setDefaultLocale(context,
				DoradoContext.SESSION, locale);
	}

	public void changeSkin(ParameterSet parameters, ParameterSet outParameters)
			throws Exception {
		DoradoContext.getContext().setAttribute(DoradoContext.SESSION,
				ViewModel.DEFAULT_SKIN_ATTRIBUTE, parameters.getString("skin"));
	}

}

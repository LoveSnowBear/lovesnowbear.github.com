package sample.scene.validate.custom;

import java.io.Writer;

import javax.servlet.ServletRequest;

import com.bstek.dorado.view.data.validate.impl.AbstractValidator;
import com.bstek.dorado.view.data.validate.impl.CustomValidator;
import com.bstek.dorado.view.smartweb.OutputHelper;
import com.bstek.dorado.view.smartweb.v2.output.AbstractValidatorOutputter;

public class CustomValidatorOutputter extends AbstractValidatorOutputter {
	public CustomValidatorOutputter() {
	}

	public void doOutputEndSection(Writer writer, Object validator,
			ServletRequest servletrequest) throws Exception {
		CustomValidator cv = (CustomValidator) validator;
		String clazz = cv.getConcreteValidator();
		
		AbstractValidatorOutputter outputter = (AbstractValidatorOutputter) OutputHelper
				.getOutputter(clazz, "smartweb2");
		AbstractValidator v = (AbstractValidator)Class.forName(clazz).newInstance();
		v.setErrorMessage(cv.getErrorMessage());
		v.setTag(cv.getTag());
		
		outputter.doOutputEndSection(writer, v, servletrequest);
	}

}

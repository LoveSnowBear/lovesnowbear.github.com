package sample.scene.validate.custom;

import com.bstek.dorado.view.data.validate.IllegalValueException;
import com.bstek.dorado.view.data.validate.impl.AbstractValidator;

public class MailValidator extends AbstractValidator {

	public void validate(Object value) throws IllegalValueException {
		if (value != null) {
			String s = value.toString();
			if (s.indexOf("@")==-1)
				throwException();
		}
	}
}

package sample.scene.validate.custom;

import java.io.Writer;

import javax.servlet.ServletRequest;

import com.bstek.dorado.view.smartweb.Outputter;
import com.bstek.dorado.view.smartweb.impl.DefaultOutputterFactory;
import com.bstek.dorado.view.smartweb.v2.output.AbstractValidatorOutputter;
import com.bstek.dorado.view.smartweb.v2.output.JavaScriptHelper;

public class MailValidatorOutputter extends AbstractValidatorOutputter {
	public MailValidatorOutputter() {
	}

	public void doOutputEndSection(Writer writer, Object obj,
			ServletRequest servletrequest) throws Exception {
		MailValidator mailvalidator = (MailValidator) obj;
		writer.write("var __v=new MailValidator();");
		writer.write(JavaScriptHelper.scirptSetProperty(mailvalidator,
				"errorMessage", null, "__v"));
		writer.write(JavaScriptHelper.scirptSetProperty(mailvalidator, "tag",
				null, "__v"));
		outputEvent(writer, mailvalidator, "__v");
	}
	
	public static void main(String[] args) {
		MailValidatorOutputter validator = new MailValidatorOutputter();
		DefaultOutputterFactory factory = new DefaultOutputterFactory();
		Outputter outputer = factory.createOutputter("validate.custom.MailValidatorOutputter","");
		
		try {
			Class clazz = Class.forName("validate.custom.MailValidatorOutputter");
			Outputter outputter = (Outputter)clazz.newInstance();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

}

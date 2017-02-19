// MailValidator
function MailValidator() {	
	this.setValidateImmediately(false);
	this.setErrorMessage("邮件格式错误！");
}

MailValidator.prototype = new Validator();
MailValidator.prototype.validate = function(value) {
	if (value != null) {
		value = new String(value);
		return (value.indexOf("@")>-1);
	} 		
	return true;
};


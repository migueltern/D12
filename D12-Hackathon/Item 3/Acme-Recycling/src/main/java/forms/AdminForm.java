
package forms;

import javax.validation.Valid;

import domain.Admin;

public class AdminForm {

	@Valid
	private Admin	admin;
	private String	passwordCheck;
	private Boolean	conditions;


	public AdminForm() {
		super();
	}

	public AdminForm(final Admin administrator) {
		this.admin = administrator;
		this.passwordCheck = "";
		this.conditions = false;
	}

	public Admin getAdministrator() {
		return this.admin;
	}

	public void setAdministrator(final Admin administrator) {
		this.admin = administrator;
	}

	public String getPasswordCheck() {
		return this.passwordCheck;
	}

	public void setPasswordCheck(final String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}

	public Boolean getConditions() {
		return this.conditions;
	}

	public void setConditions(final Boolean conditions) {
		this.conditions = conditions;
	}

}

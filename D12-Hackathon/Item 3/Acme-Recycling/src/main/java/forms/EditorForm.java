
package forms;

import javax.validation.Valid;

import domain.Editor;

public class EditorForm {

	@Valid
	private Editor	editor;
	private String	passwordCheck;
	private Boolean	conditions;


	public EditorForm() {
		super();
	}

	public EditorForm(final Editor editor) {
		this.editor = editor;
		this.passwordCheck = "";
		this.conditions = false;
	}

	public Editor getEditor() {
		return this.editor;
	}

	public void setEditor(final Editor editor) {
		this.editor = editor;
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

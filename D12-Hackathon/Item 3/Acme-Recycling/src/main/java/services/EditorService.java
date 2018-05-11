
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.EditorRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Editor;
import domain.New;

@Service
@Transactional
public class EditorService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private EditorRepository	editorRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public EditorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Editor create() {
		Editor result;
		UserAccount userAccount;
		Authority authority;
		final Collection<New> news;

		result = new Editor();
		userAccount = new UserAccount();
		authority = new Authority();
		news = new ArrayList<>();

		authority.setAuthority(Authority.EDITOR);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);
		result.setNews(news);

		return result;
	}

	public Collection<Editor> findAll() {
		Collection<Editor> result;
		result = this.editorRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Editor findOne(final int editorId) {
		Assert.isTrue(editorId != 0);
		Editor result;
		result = this.editorRepository.findOne(editorId);
		return result;
	}

	public Editor save(final Editor editor) {
		Assert.notNull(editor);
		Editor result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (editor.getId() == 0) {
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(editor.getUserAccount().getPassword(), null);
			editor.getUserAccount().setPassword(passwordHash);
		}
		result = this.editorRepository.save(editor);
		Assert.notNull(result);

		//TODO: Falta método creacion de carpetas por defecto
		//if (editor.getId() == 0)
		//this.messageFolderService.createDefaultMessageFolder(result);

		return result;
	}

	//Delete	------------------------------------------------------------
	public void delete(final Editor editor) {
		Assert.notNull(editor);
		Assert.isTrue(editor.getId() != 0);
		this.editorRepository.delete(editor);
	}

	// Other business methods -------------------------------------------------
	public Editor findByPrincipal() {
		Editor result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.editorRepository.findByUserAccountId(userAccount.getId());
		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.EDITOR);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.EDITOR);

		return (authorities.contains(auth));
	}
}

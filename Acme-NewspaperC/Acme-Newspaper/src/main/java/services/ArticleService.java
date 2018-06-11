
package services;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.ArticleRepository;
import domain.Article;
import domain.Newspaper;
import domain.User;

@Service
@Transactional
public class ArticleService {

	// Managed repository -----------------------------------------------------

	@Autowired
	ArticleRepository	articleRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	NewspaperService	newspaperService;

	@Autowired
	UserService			userService;

	@Autowired
	AdminService		adminService;

	@Autowired
	TabooWordService	tabooWordService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator	validator;


	// Constructors -----------------------------------------------------------

	public ArticleService() {

	}

	// Simple CRUD methods ----------------------------------------------------

	//CREATE
	public Article create(final int newspaperId) {
		Article result;
		User userPrincipal;
		Newspaper newspaper;

		result = new Article();
		newspaper = this.newspaperService.findOne(newspaperId);
		userPrincipal = this.userService.findByPrincipal();
		Assert.isTrue(newspaper.getPublisher().equals(userPrincipal));
		result.setWriter(userPrincipal);
		result.setNewspaper(newspaper);

		result.setDraftMode(true);

		return result;
	}

	//SAVE
	public Article save(final Article article) {
		Article result;

		Assert.notNull(article, "El articulo a guardar no puede ser nulo");
		Assert.isTrue(article.getWriter().equals(this.userService.findByPrincipal()), "el escritor del articulo debe ser el mismo que el usuario logueado");
		Assert.isTrue(article.getNewspaper().getPublisher().equals(article.getWriter()), "el escritor del articulo debe ser el mismo que el publicador del periodico");
		//Cuando no este en modo borrador tiene que tener asignado un periodico
		if (!article.isDraftMode())
			Assert.notNull(article.getNewspaper(), "tiene que asignarse un periodico para poder guardar en modo final");
		if (article.getNewspaper() != null)
			Assert.isNull(article.getNewspaper().getPublicationDate(), "el periodico no puede estar publicado para introducir este articulo");
		result = this.articleRepository.save(article);

		return result;
	}
	//DELETE
	public void delete(final Article article) {

		Assert.notNull(article);
		Assert.notNull(this.adminService.findByPrincipal());

		this.articleRepository.delete(article);
	}

	public Collection<Article> findAll() {
		Collection<Article> result;

		result = this.articleRepository.findAll();

		return result;

	}

	public Article findOne(final int articleId) {
		Assert.isTrue(articleId != 0);
		Article result;
		result = this.articleRepository.findOne(articleId);

		return result;

	}

	public Collection<Article> findArticleByKeyword(final String keyWord) {
		Collection<Article> result;
		result = this.articleRepository.findArticlesByKeyword(keyWord);
		return result;
	}

	public Collection<Article> findArticlesByNewspaperId(final int newspaperId) {
		Collection<Article> result;
		result = this.articleRepository.findArticlesByNewspaperId(newspaperId);
		return result;
	}

	public Collection<Article> findArticlesPublishedByUserId(final int userId) {
		Collection<Article> result;
		result = this.articleRepository.findArticlesPublishedByUserId(userId);
		return result;
	}

	public Collection<Article> findArticlesByUserId(final int userId) {
		Collection<Article> result;
		result = this.articleRepository.findArticlesByUserId(userId);
		return result;
	}
	public Collection<Article> findArticlesPublishedByUserIdAndNotPrivate(final int userId) {
		Collection<Article> result;
		result = this.articleRepository.findArticlesPublishedByUserIdAndNotPrivate(userId);
		return result;
	}
	public void flush() {
		this.articleRepository.flush();
	}

	public Collection<Article> findArticlesIfNewspaperPublishedByUserId(final int userId) {

		Collection<Article> result;

		result = this.articleRepository.findArticlesIfNewspaperPublishedByUserId(userId);

		return result;

	}
	public Collection<Article> findAllArticlesByAdmin(final String keyWord) {
		Collection<Article> result;
		result = this.articleRepository.findAllArticlesByAdmin(keyWord);
		return result;
	}

	public Collection<Article> findArticlesForUser(final String keyWord) {
		final Collection<Article> articles;
		User user;

		user = this.userService.findByPrincipal();
		articles = this.articleRepository.findArticlesForUser(keyWord, user.getId());
		return articles;
	}

	// Other business methods -------------------------------------------------

	public Article reconstruct(final Article article, final BindingResult bindingResult) {
		Article result;
		Article articleBD;

		if (article.getId() == 0) {
			User userPrincipal;

			userPrincipal = this.userService.findByPrincipal();

			article.setWriter(userPrincipal);

			Assert.isTrue(article.getNewspaper().getPublisher().equals(userPrincipal));
			Assert.isNull(article.getNewspaper().getPublicationDate());
			if (!article.isDraftMode())
				article.setPublishedMoment(new Date(System.currentTimeMillis() - 1000));
			result = article;
		} else {
			articleBD = this.articleRepository.findOne(article.getId());
			Assert.isNull(articleBD.getPublishedMoment(), "para editar un articulo no puede tener fecha de publicacion");
			Assert.isTrue(articleBD.getNewspaper().equals(article.getNewspaper()), "no se puede cambiar el periodico de un articulo");
			article.setId(articleBD.getId());
			article.setVersion(articleBD.getVersion());
			if (!article.isDraftMode())
				article.setPublishedMoment(new Date(System.currentTimeMillis() - 1000));
			article.setWriter(articleBD.getWriter());

			article.setNewspaper(articleBD.getNewspaper());

			result = article;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

	public String findSummaryByArticleId(final int articleId) {
		Article article;
		String summary;

		article = this.articleRepository.findOne(articleId);
		summary = article.getSummary();

		return summary;

	}

	public Collection<Article> findArticleWithTabooWord(final String tabooWord) {

		Collection<Article> result;

		result = this.articleRepository.findArticleWithTabooWord(tabooWord);

		return result;
	}

	public Set<Article> articleWithTabooWord() {

		this.adminService.checkPrincipal();

		Set<Article> result;
		Collection<String> tabooWords;
		Iterator<String> it;

		result = new HashSet<>();
		tabooWords = this.tabooWordService.findTabooWordByName();
		it = tabooWords.iterator();
		while (it.hasNext())
			result.addAll(this.findArticleWithTabooWord(it.next()));

		return result;

	}

	public Collection<Article> findArticlesOfUserWhatIsOpen(final int userId) {
		Collection<Article> articles;

		articles = this.articleRepository.findArticlesOfUserWhatIsOpen(userId);
		return articles;
	}

	public Collection<Article> findArticlesOfUserWhatNotIsDraftMode(final int userId) {
		Collection<Article> findArticlesOfUserWhatNotIsDraftMode;

		findArticlesOfUserWhatNotIsDraftMode = this.articleRepository.findArticlesOfUserWhatNotIsDraftMode(userId);

		return findArticlesOfUserWhatNotIsDraftMode;
	}

	public Collection<Article> findArticlesByUserOpenAndFinalMode(final int userId) {

		Collection<Article> result;

		result = this.articleRepository.findArticlesByUserOpenAndFinalMode(userId);

		return result;

	}

	public Collection<Article> findArticlesFinalMode() {

		Collection<Article> result;

		result = this.articleRepository.findArticlesFinalMode();

		return result;
	}

	public Collection<Article> findArticlesFinalModeByNewspaper(final int newspaperId) {
		Collection<Article> result;

		result = this.articleRepository.findArticlesFinalModeByNewspaper(newspaperId);

		return result;
	}

	public Collection<Article> findArticlesFinalModeByWriter(final int userId) {
		Collection<Article> result;

		result = this.articleRepository.findArticlesFinalModeByWriter(userId);

		return result;
	}
}

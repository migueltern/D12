
package services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;
import domain.Editor;
import domain.Newscast;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class NewscastServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------

	@Autowired
	NewscastService	newscastService;

	@Autowired
	EditorService	editorService;

	@PersistenceContext
	EntityManager	entityManager;


	//Caso de uso 14: Create a followUp
	//@SuppressWarnings("unchecked")
	@SuppressWarnings("unchecked")
	@Test
	public void driverCreateAndSave() {
		final Collection<String> picturesOk;
		final Collection<String> picturesBadUrls;

		picturesOk = this.addPicturesOk();
		picturesBadUrls = this.addPicturesBadUrls();

		final Object testingData[][] = {

			{
				//Crear correctamente una noticia
				"editor1", "title test 1", "2018/02/24 12:21", "content", picturesOk, null
			}, {
				// Crear incorrectamente una noticia por dejar el t�tulo en blanco
				"editor1", "", "2018/02/24 12:21", "content", picturesOk, javax.validation.ConstraintViolationException.class

			}, {
				//Crear incorrectamente una noticia por poner mal la colecci�n de im�genes
				"editor1", "hola", "2018/02/24 12:21", "content", picturesBadUrls, javax.validation.ConstraintViolationException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave(super.getEntityId((String) testingData[i][0]), (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (Collection<String>) testingData[i][4], (Class<?>) testingData[i][5]);
	}

	private void templateCreateAndSave(final int usernameId, final String title, final String publicationDate, final String content, final Collection<String> pictures, final Class<?> expected) {
		Class<?> caught;
		Editor userConnected;
		Newscast newscast;

		userConnected = this.editorService.findOne(usernameId);

		caught = null;
		try {
			super.authenticate(userConnected.getUserAccount().getUsername());
			newscast = this.newscastService.create();
			newscast.setTitle(title);
			newscast.setCreationDate((new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(publicationDate)));
			newscast.setContent(content);
			newscast.setPictures(pictures);
			newscast = this.newscastService.save(newscast);
			this.unauthenticate();
			this.newscastService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test

			this.entityManager.clear();
		}
		this.checkExceptions(expected, caught);
		super.unauthenticate();
	}

	private Collection<String> addPicturesOk() {
		Collection<String> picturesOk;
		picturesOk = new ArrayList<String>();
		picturesOk.add("http://www.picture1.com");
		picturesOk.add("http://www.picture2.com");
		return picturesOk;
	}
	private Collection<String> addPicturesBadUrls() {
		Collection<String> picturesBadUrls;
		picturesBadUrls = new ArrayList<String>();
		picturesBadUrls.add("http://www.picture1.com");
		picturesBadUrls.add("esto no es una url");
		return picturesBadUrls;
	}

}
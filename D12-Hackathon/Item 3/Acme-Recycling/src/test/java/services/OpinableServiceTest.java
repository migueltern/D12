
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Opinable;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class OpinableServiceTest extends AbstractTest {

	@Autowired
	private OpinableService	opinableService;


	@Test
	public void testFindOne() {
		int id;
		//Si pongo el id de un product no me devuelve null el opinable
		//Si pongo el id de un course SI me devuelve NULL el opinable

		//Cuando descomento la linea siguiente (findAll()), al introducir el id de un course funciona
		final Collection<Opinable> opinables = this.opinableService.findAll();

		id = super.getEntityId("course1");

		final Opinable opinable = this.opinableService.findOne(id);
		Assert.notNull(opinable);

	}
}

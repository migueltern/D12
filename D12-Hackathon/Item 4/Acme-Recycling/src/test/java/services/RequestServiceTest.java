
package services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class RequestServiceTest extends AbstractTest {

	@Autowired
	RequestService	requestService;

	@Autowired
	ItemService		itemService;

	@Autowired
	CarrierService	carrierService;

	@PersistenceContext
	EntityManager	entityManager;

	//	@Test
	//	public void testSave() {
	//		Request request;
	//
	//		super.authenticate("manager1");
	//		request = this.requestService.create(this.itemService.findOne(super.getEntityId("item2")).getId());
	//		request.setCode(this.requestService.generatedTicker());
	//		request.setTitle("title test");
	//		request.setObservation("observation test");
	//		request.setCarrier(this.carrierService.findOne(super.getEntityId("carrier1")));
	//		final Item item = this.itemService.findOne(request.getItem().getId());
	//		request = this.requestService.save(request);
	//
	//		this.entityManager.flush();S
	//	}
}

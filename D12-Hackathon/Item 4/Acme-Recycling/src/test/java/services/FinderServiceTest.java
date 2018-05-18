
package services;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;
import domain.Buyer;
import domain.Finder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class FinderServiceTest extends AbstractTest {

	@Autowired
	FinderService	finderService;

	@Autowired
	BuyerService	buyerService;


	@Test
	public void createAndSave() {
		Finder finder;

		Buyer buyer = this.buyerService.create();
		buyer.getUserAccount().setUsername("buyertest1");
		buyer.getUserAccount().setPassword("buyertest1");
		buyer.setName("nametest1");
		buyer.setSurname("nametest1");
		buyer.setEmail("nametest1@dd.com");
		buyer.setAddress("nametest1");
		buyer.setProvince("ALAVA");
		buyer = this.buyerService.save(buyer);

		finder = this.finderService.create();
		finder = this.finderService.save(finder);
		buyer = this.buyerService.findOne(buyer.getId());
		buyer.setFinder(finder);
		buyer = this.buyerService.save(buyer);

	}
}

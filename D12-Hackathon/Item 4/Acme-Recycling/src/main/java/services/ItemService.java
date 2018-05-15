
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ItemRepository;
import domain.Item;
import domain.Opinion;
import domain.Recycler;

@Service
@Transactional
public class ItemService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private ItemRepository	itemRepository;

	// Supporting services ----------------------------------------------------
	@Autowired
	private RecyclerService	recyclerService;


	// Constructors -----------------------------------------------------------
	public ItemService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Item create() {
		final Item result;
		Recycler recyclerPrincipal;
		Collection<Opinion> opinions;

		recyclerPrincipal = this.recyclerService.findByPrincipal();
		opinions = new ArrayList<Opinion>();
		//No copiar la siguiente linea en el reconstruct
		result = new Item();

		result.setOpinion(opinions);
		result.setRecycler(recyclerPrincipal);

		return result;

	}

	public Item findOne(final int itemId) {
		Item result;

		result = this.itemRepository.findOne(itemId);

		return result;
	}

	public Collection<Item> findAll() {
		Collection<Item> result;

		result = this.itemRepository.findAll();

		return result;
	}

	public Item save(final Item item) {
		final Item result;

		Assert.notNull(item);

		if (item.getId() == 0) {
			Date publicationMoment;
			publicationMoment = new Date(System.currentTimeMillis() - 1000);
			item.setPublicationMoment(publicationMoment);
		}

		result = this.itemRepository.save(item);

		return result;
	}

	public void delete(final Item item) {
		Assert.notNull(item);

		this.itemRepository.delete(item);
	}
}

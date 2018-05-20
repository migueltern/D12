
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.ItemRepository;
import security.Authority;
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

	@Autowired
	private Validator		validator;

	@Autowired
	private ActorService	actorService;

	@Autowired
	private ManagerService	managerService;


	// Constructors -----------------------------------------------------------
	public ItemService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Item create() {

		Item result;
		Recycler recyclerPrincipal;
		Collection<Opinion> opinions;
		Date publicationMoment;

		recyclerPrincipal = this.recyclerService.findByPrincipal();
		opinions = new ArrayList<Opinion>();
		publicationMoment = new Date(System.currentTimeMillis() - 1000);
		//No copiar la siguiente linea en el reconstruct
		result = new Item();

		result.setOpinions(opinions);
		result.setRecycler(recyclerPrincipal);
		result.setPublicationMoment(publicationMoment);

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

		//Si eres MANAGER Solo se puede añadir puntuation a los items de TUS requests
		final Authority authorityForManager = new Authority();
		authorityForManager.setAuthority("MANAGER");
		if (this.actorService.findPrincipal().getUserAccount().getAuthorities().contains(authorityForManager))
			Assert.isTrue(this.managerService.findByPrincipal().getRequests().contains(item.getRequest()), "Can not commit this operation because its illegal");

		result = this.itemRepository.save(item);

		return result;
	}
	public void delete(final Item item) {
		Assert.notNull(item);
		
		Assert.isTrue(item.getRequest().getCarrier() != null);

		this.itemRepository.delete(item);
	}

	//Other methods

	public Collection<Item> findItemsByRecycler(final int recyclerId) {

		Collection<Item> result;

		result = this.itemRepository.findItemsByRecycler(recyclerId);

		return result;

	}

	public Item reconstruct(final Item item, final BindingResult bindingResult) {
		Item result;
		Item itemBD;
		Recycler recyclerPrincipal;
		Collection<Opinion> opinions;

		opinions = new ArrayList<>();

		if (item.getId() == 0) {

			recyclerPrincipal = this.recyclerService.findByPrincipal();
			item.setPublicationMoment(new Date(System.currentTimeMillis() - 1000));
			item.setRecycler(recyclerPrincipal);
			item.setOpinions(opinions);

			result = item;
		} else {
			itemBD = this.itemRepository.findOne(item.getId());
			item.setId(itemBD.getId());
			item.setVersion(itemBD.getVersion());
			item.setRecycler(itemBD.getRecycler());
			item.setDescription(itemBD.getDescription());
			item.setLabelProduct(itemBD.getLabelProduct());
			item.setOpinions(itemBD.getOpinions());
			item.setPhoto(itemBD.getPhoto());
			item.setPublicationMoment(itemBD.getPublicationMoment());
			item.setQuantity(itemBD.getQuantity());
			item.setRequest(item.getRequest());
			item.setTitle(itemBD.getTitle());
			item.setValue(itemBD.getValue());

			result = item;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

}

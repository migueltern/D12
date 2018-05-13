
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.PublicationRepository;
import domain.Publication;
import domain.Recycler;

@Service
@Transactional
public class PublicationService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private PublicationRepository	publicationRepository;

	//Suporting services----------------------------------------------------
	@Autowired
	private RecyclerService			recyclerService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator				validator;


	// Constructors -----------------------------------------------------------

	public PublicationService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public Publication findOne(final int publicationId) {
		Assert.isTrue(publicationId != 0);

		Publication result;

		result = this.publicationRepository.findOne(publicationId);
		Assert.notNull(result);

		return result;

	}

	public Collection<Publication> findAll() {

		Collection<Publication> result;

		result = this.publicationRepository.findAll();

		return result;

	}

	public Publication create() {
		Publication result;
		Recycler recycler;

		recycler = this.recyclerService.findByPrincipal();

		result = new Publication();
		result.setRecycler(recycler);
		return result;
	}

	public Publication save(final Publication publication) {
		Assert.notNull(publication);
		Assert.notNull(this.recyclerService.findByPrincipal());
		Publication result;

		result = this.publicationRepository.save(publication);

		return result;

	}

	public void delete(final Publication publication) {
		final Recycler recycler;

		recycler = this.recyclerService.findByPrincipal();
		Assert.notNull(recycler);
		Assert.notNull(publication);

		Assert.isTrue(publication.getId() != 0);

		this.publicationRepository.delete(publication);
	}

	//	RECONSTRUCTOR

	public Publication reconstruct(final Publication publication, final BindingResult bindingResult) {
		Publication result;
		Publication publicationBD;
		if (publication.getId() == 0)
			result = publication;
		else {
			publicationBD = this.publicationRepository.findOne(publication.getId());
			publication.setId(publicationBD.getId());
			publication.setVersion(publicationBD.getVersion());
			publication.setCaption(publicationBD.getCaption());
			publication.setPhoto(publicationBD.getPhoto());
			publication.setRecycler(publicationBD.getRecycler());

			result = publication;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

}

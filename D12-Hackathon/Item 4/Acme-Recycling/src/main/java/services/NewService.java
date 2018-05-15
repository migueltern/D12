
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

import repositories.NewRepository;
import domain.Comment;
import domain.New;

@Service
@Transactional
public class NewService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private NewRepository	newRepository;

	// Supporting services ----------------------------------------------------

	//Importar la que pertenece a Spring
	@Autowired
	private Validator		validator;


	// Constructors -----------------------------------------------------------
	public NewService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public New create() {
		New result;
		Collection<Comment> comments;
		Date creationDate;

		comments = new ArrayList<Comment>();
		result = new New();
		creationDate = new Date();

		result.setComments(comments);
		result.setCreationDate(creationDate);

		return result;
	}

	public New save(final New New) {
		New result;
		Assert.notNull(New);
		Date createdMoment;

		createdMoment = new Date(System.currentTimeMillis() - 1000);
		New.setCreationDate(createdMoment);

		result = this.newRepository.save(New);

		return result;
	}

	public Collection<New> findAll() {
		Collection<New> result;

		result = this.newRepository.findAll();
		return result;
	}

	public New findOne(final int newId) {
		Assert.isTrue(newId != 0);

		New result;

		result = this.newRepository.findOne(newId);
		return result;
	}

	public void delete(final New New) {
		Assert.notNull(New);
		Assert.isTrue(New.getId() != 0);

		this.newRepository.delete(New);
	}

	//Other business methods---------------------------------------------------

	//	RECONSTRUCTOR

	public New reconstruct(final New New, final BindingResult bindingResult) {
		New result;
		New newBD;
		if (New.getId() == 0) {

			Collection<Comment> comments;
			comments = new ArrayList<Comment>();
			New.setComments(comments);
			result = New;
		} else {
			newBD = this.newRepository.findOne(New.getId());
			New.setId(newBD.getId());
			New.setVersion(newBD.getVersion());
			New.setCreationDate(newBD.getCreationDate());

			if (New.getComments() == null)
				New.setComments(new ArrayList<Comment>());
			else
				New.setComments(newBD.getComments());

			result = New;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

}

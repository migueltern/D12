
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.OpinionRepository;
import domain.Actor;
import domain.Course;
import domain.Item;
import domain.Opinion;
import forms.OpinionForm;

@Service
@Transactional
public class OpinionService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private OpinionRepository	opinionRepository;

	@Autowired
	private ActorService		actorService;

	@Autowired
	private ItemService			itemService;

	@Autowired
	private CourseService		courseService;

	@Autowired
	private Validator			validator;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public OpinionService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Opinion create() {
		Opinion result;

		//No copiar la siguiente linea en el reconstruct
		result = new Opinion();

		return result;
	}
	public Opinion findOne(final int opinionId) {
		Opinion result;

		result = this.opinionRepository.findOne(opinionId);

		return result;
	}

	public Collection<Opinion> findAll() {
		Collection<Opinion> result;

		result = this.opinionRepository.findAll();

		return result;
	}

	public Opinion save(final Opinion opinion) {
		final Opinion result;
		Actor actorPrincipal;

		Assert.notNull(opinion);

		if (opinion.getId() == 0) {
			Date createdMoment;

			createdMoment = new Date(System.currentTimeMillis() - 1000);
			opinion.setCreatedMoment(createdMoment);

		}

		result = this.opinionRepository.save(opinion);
		//Se le añade esa opinion instrumentada al actor logueado
		actorPrincipal = this.actorService.findPrincipal();
		actorPrincipal.getOpinions().add(result);

		return result;
	}

	public void delete(final Opinion opinion) {
		Assert.notNull(opinion);
		Actor actorPrincipal;

		this.opinionRepository.delete(opinion);
		//Eliminamos la opinion de la lista de opiniones del actor ya que es unidireccional y no se actualiza
		actorPrincipal = this.actorService.findPrincipal();
		actorPrincipal.getOpinions().remove(opinion);
	}

	public Collection<Opinion> findOpinableItemByActor(final int ActorId) {
		Collection<Opinion> result;

		result = this.opinionRepository.findOpinableItemByActor(ActorId);

		return result;
	}

	public Collection<Opinion> findOpinableCourseByActor(final int ActorId) {
		Collection<Opinion> result;

		result = this.opinionRepository.findOpinableCourseByActor(ActorId);

		return result;
	}

	public OpinionForm reconstruct(final OpinionForm opinionForm, final BindingResult bindingResult) {
		Opinion opinion;

		opinion = opinionForm.getOpinion();

		//Si no se ha elegido ningun opinable, hacemos que salte en mensaje de notNull
		if (opinionForm.getOpinableId() == 0)
			opinionForm.setOpinableId(null);

		//añadimos el opinable a nuestra clase opinion
		if (opinionForm.isOpinableItem() && opinionForm.getOpinableId() != null) {
			Item item;
			item = this.itemService.findOne(opinionForm.getOpinableId());
			opinion.setOpinable(item);
		} else if (!opinionForm.isOpinableItem() && opinionForm.getOpinableId() != null) {
			Course course;
			course = this.courseService.findOne(opinionForm.getOpinableId());
			opinion.setOpinable(course);
		}

		opinionForm.setOpinion(opinion);
		this.validator.validate(opinionForm, bindingResult);

		return opinionForm;
	}
}

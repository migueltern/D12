
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.OpinableRepository;
import domain.Course;
import domain.Item;
import domain.Opinable;
import domain.Opinion;

@Service
@Transactional
public class OpinableService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private OpinableRepository	opinableRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public OpinableService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public Opinable findOne(final int opinableId) {
		Assert.isTrue(opinableId != 0);

		Opinable result;

		result = this.opinableRepository.findOne(opinableId);

		return result;

	}

	public Collection<Opinable> findAll() {

		Collection<Opinable> result;

		result = this.opinableRepository.findAll();

		return result;

	}

	public Opinable save(final Opinable opinable) {
		Opinable result;

		Assert.notNull(opinable);

		result = this.opinableRepository.save(opinable);

		return result;
	}

	public void delete(final Opinable opinable) {
		Assert.notNull(opinable);

		this.opinableRepository.delete(opinable);
	}

	public void flush() {
		this.opinableRepository.flush();
	}

	public boolean isItem(final Opinion opinion) {
		boolean res;
		Item item;

		res = false;
		//Lo hago en bloque try porque si peta o devuelve null en el casting significa que es un course
		try {
			item = (Item) opinion.getOpinable();
			if (item != null)
				res = true;
			else
				res = false;
		} catch (final Throwable oops) {
			res = false;
		}
		return res;
	}
	public boolean isCourse(final Opinion opinion) {
		boolean res;
		Course course;

		res = false;
		course = (Course) opinion.getOpinable();
		if (course != null)
			res = true;
		return res;
	}
}

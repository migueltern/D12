
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.MaterialService;
import repositories.PuntuationRepository;
import domain.Puntuation;

@Service
@Transactional
public class PuntuationService {

	@Autowired
	PuntuationRepository	puntuationRepository;

	@Autowired
	MaterialService			materialService;


	public PuntuationService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Puntuation create() {
		Puntuation result;
		result = new Puntuation();
		return result;
	}
	public Collection<Puntuation> findAll() {
		Collection<Puntuation> res;
		res = this.puntuationRepository.findAll();
		return res;
	}

	public Puntuation findOne(final int puntuationId) {
		Puntuation res;
		res = this.puntuationRepository.findOne(puntuationId);
		return res;
	}

	public Puntuation save(final Puntuation buy) {
		//TODO no comprobado
		Assert.notNull(buy);
		Puntuation result;

		result = this.puntuationRepository.save(buy);
		Assert.notNull(result);

		return result;
	}

}

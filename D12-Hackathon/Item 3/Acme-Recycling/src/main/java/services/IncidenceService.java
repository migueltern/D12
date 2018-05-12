package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.IncidenceRepository;
import domain.Actor;
import domain.Incidence;
import domain.Manager;
import domain.Recycler;

@Service
@Transactional
public class IncidenceService {
	
	// Managed repository -----------------------------------------------------
	@Autowired
	private IncidenceRepository incidenceRepository;
	
	
	// Supporting services ----------------------------------------------------
	@Autowired
	private RecyclerService recyclerService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired 
	private MessageService messageService;
	
	// Constructors -----------------------------------------------------------
	
	public IncidenceService(){
		super();
	}
	
	// Simple CRUD methods ----------------------------------------------------
	
	public Incidence create(){
		
		Incidence result;
		Date createdMoment;
		boolean resolved;
		Recycler recycler;
		
		result = new Incidence();
		createdMoment = new Date(System.currentTimeMillis() - 1000);
		resolved = false;
		recycler = this.recyclerService.findByPrincipal();
		
		result.setCreatedMoment(createdMoment);
		result.setResolved(resolved);
		result.setRecycler(recycler);
		
		return result;
	}
	
	public Collection<Incidence> findAll(){
		
		Collection<Incidence> result;
		
		result = this.incidenceRepository.findAll();
		
		return result;
	}
	
	public Incidence findOne(int incidenceId){
		
		Assert.notNull(incidenceId);
		Assert.isTrue(incidenceId != 0);
		
		Incidence result;
		
		result = this.incidenceRepository.findOne(incidenceId);
		
		return result;
	}
	
	public Incidence save(Incidence incidence){
		
		Assert.notNull(incidence);
		Date createdMoment;
		Actor principal;
		Incidence result;
		
		createdMoment = new Date(System.currentTimeMillis() - 1000);
		principal = this.actorService.findPrincipal();
		
		incidence.setCreatedMoment(createdMoment);
		
		Assert.isTrue(principal instanceof Manager || principal instanceof Recycler);
		
		result = this.save(incidence);
		
		//TODO: CREATE MESSAGE DE NOTIFICACIÓN
		
//		if(result.isResolved()){
//			
//		}
		
		return result;
		
	}
	
	public void delete(Incidence incidence){
		
		Assert.notNull(incidence);
		Assert.isTrue(incidence.getId() != 0);
		
		this.incidenceRepository.delete(incidence);
		
		
	}

}

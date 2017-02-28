package org.glsid.metier;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Table;

import org.glsid.configuration.UserRevEntity;
import org.glsid.dao.EvolutionRepository;
import org.glsid.dao.UserDao;
import org.glsid.entities.Evolution;
import org.glsid.entities.User;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.RevisionListener;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javassist.expr.Instanceof;

@Service
public class EvolutionMetierImpl implements EvolutionMetier , RevisionListener {

	private double avancementTheorique;
	
	@Autowired
	private UserService userService;
	@Autowired
	private EvolutionRepository evolutionRepository;

	
	@Autowired
	private EntityManager entityManager;

	@Override
	public Iterable<Evolution> listEvolutions() {
		return evolutionRepository.findAll();
	}

	@Override
	public List<Evolution> listEvolutionS() {
		return evolutionRepository.findByEvolutionSelected(1);

	}

	@Override
	public Evolution getEvolution(String idEvolution) {
		return evolutionRepository.findOne(idEvolution);
	}

	@Transactional
	@Override
	public boolean selectionnerEvolution(String idEvolution, int selected) {

		try {
			Evolution e = evolutionRepository.findOne(idEvolution);
			e.setEvolutionSelected(selected);
			evolutionRepository.save(e);
			return true;

		} catch (Exception e) {
			System.out.print("evolution non trouvée");
		}
		return false;

	}

	@Transactional
	@Override
	public boolean initialiserEvolutions() {
		List<Evolution> list = evolutionRepository.findAll();
		for (Evolution evol : list) {
			evol.setEvolutionSelected(0);
			evolutionRepository.save(evol);
		}
		return true;
	}

	@Override
	public boolean SetEtatRecettes() {
		List<Evolution> list = evolutionRepository.findAll();
		Calendar cal = Calendar.getInstance();

		// calculer date hier
		cal.add(Calendar.DATE, -1);

		for (Evolution evolution1 : list) {

			/**
			 * Avancement theorique
			 */
			try {
				avancementTheorique = (this.CalculateJoursOuvrable(evolution1.getDateDebutTests(), cal.getTime())) * 100
						/ this.CalculateJoursOuvrable(evolution1.getDateDebutTests(), evolution1.getDateFinTests());
				if (avancementTheorique >= 100)
					avancementTheorique = 100;
				// juste pour verifier
			} catch (Exception e) {

			}

			if ((evolution1.getAvancement() + 10 < avancementTheorique)
					&& (evolution1.getAvancement() + 20 >= avancementTheorique)) {
				evolution1.setEtatRecette("MAUVAISE");

			} else if ((evolution1.getAvancement() + 20 < avancementTheorique)) {
				evolution1.setEtatRecette("CRITIQUE");

			} else {
				evolution1.setEtatRecette("BONNE");

			}
			evolutionRepository.save(evolution1);

		}

		return true;

	}

	@Override
	public int CalculateJoursOuvrable(Date date1, Date date2) {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		if (date1 != null && date2 != null) {
			cal1.setTime(date1);
			cal2.setTime(date2);
		}

		int numberOfDays = 0;
		while (cal1.before(cal2)) {
			if ((Calendar.SATURDAY != cal1.get(Calendar.DAY_OF_WEEK))
					&& (Calendar.SUNDAY != cal1.get(Calendar.DAY_OF_WEEK))) {
				numberOfDays++;
				cal1.add(Calendar.DATE, 1);
			} else {
				cal1.add(Calendar.DATE, 1);
			}
		}
		return numberOfDays;

	}

	@Override
	public Evolution ajouterEvolution(Evolution e) {
		e.setIdEvolution();
		return evolutionRepository.save(e);
	}

	@Override
	public void updateEvolution(String id, double avancement,double koPourcentage, double rafjh,int rafcastest,String commentaires){

		Evolution evol = this.getEvolution(id);
		evol.setRafJH(rafjh);
		evol.setRafEnCasTests(rafcastest);
			evol.setKoPourcentage(koPourcentage);
		
		evol.setAvancement(avancement);
		
		if((commentaires.equals("null"))==false){
			evol.setCommentaires(commentaires);
		}
		
		evolutionRepository.save(evol);
	}

	

	@Override
	public void updateEvolutionForm(Evolution e) {
		evolutionRepository.save(e);

	}

	@Override
	public List<Object[]> getAuditEvolution(String idEvolution) {
		AuditReader auditReader=AuditReaderFactory.get(entityManager);
		 AuditQuery query = auditReader.createQuery()
			        .forRevisionsOfEntity(Evolution.class, false, true)
			        .add(AuditEntity.id().eq(idEvolution))
			        .addOrder(AuditEntity.property("id").desc())
			        .setMaxResults(10);
		 			//query.add(AuditEntity.revisionProperty("username").eq()); 
			    //This return a list of array triplets of changes concerning the specified revision.
			    // The array triplet contains the entity, entity revision information and at last the revision type.

		 List<Object[]> revisions=(List<Object[]>) query.getResultList();
		 
		 return revisions;
	
	}

	@Override
	public List<Evolution> listEvolutionCpRecette(String name) {
		
		return evolutionRepository.listEvolutionCp(name);
	}

	@Override
	public String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	
	
	
	@Override
	public String getUsernameLogin() {	
		String principal =  this.getPrincipal().toString();
		User user=userService.findBySso(principal);
		String name=user.getLastName().toUpperCase();

		return name;
	}


	
	
	@Override
	public void newRevision(Object revisionEntity) {
		UserRevEntity exampleRevEntity = (UserRevEntity) revisionEntity;

		String name=this.getPrincipal().toString();
		exampleRevEntity.setUsername(name);
	}

	
	//list of checkboxes
	@Override
	public Theme[] listCheckboxes(Theme[] e) {
		
		
		return e;
	}
	
	

}

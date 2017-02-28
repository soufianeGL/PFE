package org.glsid.services;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.glsid.dao.EvolutionRepository;
import org.glsid.entities.Evolution;
import org.glsid.metier.EvolutionMetier;
import org.glsid.metier.Theme;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EvolutionRestService {

	public static Theme[] listCheckboxes;
	protected  List<Evolution> evolsKpi2;


	@Autowired
	private EvolutionMetier evolutionMetier;
	@Autowired
	private EvolutionRepository evolrep;

	@RequestMapping(value = "/evolutions", method = RequestMethod.GET)
	public Iterable<Evolution> listEvolutions() {

		return evolutionMetier.listEvolutions();
	}

	@RequestMapping(value = "/evolutions2", method = RequestMethod.GET)
	public List<Evolution> listEvolutioCP(HttpServletRequest request, String name) {

		String username = evolutionMetier.getPrincipal();
		if (request.isUserInRole("ADMIN")) {
			evolutionMetier.SetEtatRecettes();
			return (List<Evolution>) evolutionMetier.listEvolutions();
			
		} else if (request.isUserInRole("CPR")) {
			evolutionMetier.SetEtatRecettes();
			return evolutionMetier.listEvolutionCpRecette(username);

		} else {
			evolutionMetier.SetEtatRecettes();
			return (List<Evolution>) evolutionMetier.listEvolutions();

		}
	}

	@ResponseBody
	@RequestMapping(value = "/evolutions", method = RequestMethod.POST)
	public Evolution addEvolution(@RequestBody Evolution e) {
		return evolutionMetier.ajouterEvolution(e);
	}

	@ResponseBody
	@RequestMapping(value = "/checkboxes", method = RequestMethod.POST)
	public Theme[] addCheckboxes(@RequestBody Theme[] e) {

		listCheckboxes = evolutionMetier.listCheckboxes(e);

		return evolutionMetier.listCheckboxes(e);
	}

	@RequestMapping(value = "/evolutions", method = RequestMethod.PUT)
	public void MAJEvolution(
			@RequestParam String id,
			@RequestParam double avancement, 
			@RequestParam double koPourcentage, 
			@RequestParam double rafjh,
			@RequestParam int rafcastest,
			@RequestParam String commentaires
			) {
		
		evolutionMetier.updateEvolution(id, avancement, koPourcentage , rafjh, rafcastest, commentaires);
	}



	@RequestMapping(value = "/evolutions/{id}", method = RequestMethod.PUT)
	public void updateEvolution1(@PathVariable("id") String id, @RequestBody Evolution evolution) {
		Evolution newEvolution = evolrep.findOne(id);
		if (evolution == null) {
			throw new NullPointerException("Pas d'évolution a modifié");
		}
		newEvolution.setRefEvolution(evolution.getRefEvolution());
		newEvolution.setDescription(evolution.getDescription());
		newEvolution.setAvancement(evolution.getAvancement());
		newEvolution.setEtatLivraison(evolution.getEtatLivraison());
		newEvolution.setChargeJH(evolution.getChargeJH());
		newEvolution.setDateDebutTests(evolution.getDateDebutTests());
		newEvolution.setDateMepSouhaitee(evolution.getDateMepSouhaitee());
		newEvolution.setDateFinTests(evolution.getDateFinTests());
		newEvolution.setDateFinEffective(evolution.getDateFinEffective());
		newEvolution.setDatePrevuCahier(evolution.getDatePrevuCahier());
		newEvolution.setDateEffectiveCahier(evolution.getDateEffectiveCahier());
		newEvolution.setCommentaires(evolution.getCommentaires());
		newEvolution.setRafJH(evolution.getRafJH());
		newEvolution.setRafEnCasTests(evolution.getRafEnCasTests());
		newEvolution.setCprecettes(evolution.getCprecettes());
		newEvolution.setNombreCasTests(evolution.getNombreCasTests());
		newEvolution.setKPI3(evolution.getKPI3());
		newEvolution.setCpsi(evolution.getCpsi());

		evolutionMetier.updateEvolutionForm(newEvolution);
		System.out.println("sucess");

	}

	@RequestMapping(value = "/evolutionsS", method = RequestMethod.GET)
	public Iterable<Evolution> listEvolutionsSelectionnee() {
		return evolutionMetier.listEvolutionS();
	}

	@RequestMapping(value = "/evolutions/{id}", method = RequestMethod.GET)
	public Evolution getEvolution(@PathVariable String id) {
		return evolutionMetier.getEvolution(id);
	}

	@RequestMapping(value = "/selection", method = RequestMethod.PUT)
	public boolean SelectionnerEvolution(@RequestParam String id, @RequestParam int selected) {
		return evolutionMetier.selectionnerEvolution(id, selected);
	}

	@RequestMapping(value = "/initialiser", method = RequestMethod.GET)
	public boolean SelectionnerEvolution() {
		return evolutionMetier.initialiserEvolutions();
	}

	@RequestMapping(value = "/etatRecettes", method = RequestMethod.GET)
	public boolean EtatRecette() {
		return evolutionMetier.SetEtatRecettes();
	}

	@RequestMapping(value = "/revisionEvolution/{id}", method = RequestMethod.GET)
	public List<Object[]> ListRevisionEvolution(@PathVariable String id) {
		return evolutionMetier.getAuditEvolution(id);
	}

	@RequestMapping(value = "/kpi2Periode", method = RequestMethod.PUT)
	public List<Evolution> ListKpiEvolution(@RequestParam String option, 
			@RequestParam Date optionPeriodeFrom, @RequestParam Date optionPeriodeTo) {

		if (option.equals("periode")) {
			evolsKpi2 = evolrep.listEvolutionOK(optionPeriodeFrom, optionPeriodeTo);

		}
		
		for (Evolution e : evolsKpi2) {
			System.out.println(e.getRefEvolution());
		}
		return evolsKpi2;
	}
	
	@RequestMapping(value = "/kpi2Mois", method = RequestMethod.PUT)
	public List<Evolution> ListKpiEvolutionMois(@RequestParam String option, 
			@RequestParam String optionMois) {
		

	     Date date1 = new Date();
	     date1.setMonth(Integer.valueOf(optionMois));
	
		if (option.equals("mois")) {
			evolsKpi2 = evolrep.listEvolutionKpi2ChoixMois(date1);
			//System.out.println(evolsKpi2);
			//System.out.println(date1);
			

		}
		
		for (Evolution e : evolsKpi2) {
			System.out.println(e.getRefEvolution());
		}
		return evolsKpi2;
	}
	
	

	@RequestMapping(value = "/kpi2OK", method = RequestMethod.GET)
	public List<Evolution> ListEvolutionKPiOK() throws NullPointerException{
		List<Evolution> evolsOK= new ArrayList<Evolution>();
		for (Evolution e : evolsKpi2) {
			if (evolutionMetier.CalculateJoursOuvrable(e.getDateFinTests(), e.getDateFinEffective()) <= 3) {
				System.out.println("ok => " + e.getRefEvolution());
				evolsOK.add(e);
			}
		}
		

		return evolsOK;
	}

	@RequestMapping(value = "/kpi2KO", method = RequestMethod.GET)
	public List<Evolution> ListEvolutionKPiKO() throws NullPointerException {
		List<Evolution> evolsKO =new ArrayList<Evolution>();
		for (Evolution e : evolsKpi2) {
			if (evolutionMetier.CalculateJoursOuvrable(e.getDateFinTests(), e.getDateFinEffective()) > 3) {
				System.out.println("ko => " + e.getRefEvolution());
				evolsKO.add(e);
			}
		}
		return evolsKO;
	}

}

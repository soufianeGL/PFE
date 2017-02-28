package org.glsid.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.Mep;
import org.glsid.metier.*;

@RestController
public class MepRestController {

	
	
	protected  List<Mep> MepsKpi3;
	@Autowired
	private MepMetier MepMetier;
	
	@Autowired
	private EvolutionMetier evolutionMetier;
	
	@RequestMapping(value = "/meps", method = RequestMethod.GET)
	public Iterable<Mep> listmeps() {
		return MepMetier.listMep();
	}
	
	@RequestMapping(value = "/meps/{id}", method = RequestMethod.GET)
	public Mep getMep(@PathVariable int id) {
		return MepMetier.getMep(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/meps", method = RequestMethod.POST)
	public Mep addMep(@RequestBody Mep Mep) {
		return MepMetier.addMep(Mep);
	}
	
	@RequestMapping(value = "/meps/{id}", method = RequestMethod.DELETE)
	public void deleteMep(@PathVariable int id) {
		MepMetier.deleteMep(MepMetier.getMep(id));
	}
	
	@RequestMapping(value = "/meps/{id}", method = RequestMethod.PUT)
	public void updateMep(@PathVariable("id") int id, @RequestBody Mep mep) {
		Mep newMep = MepMetier.getMep(id);
		if (newMep == null){
			throw new NullPointerException("type non trouvé");
		}
		
		
		
		if(mep.getAstreinte() == null){
			newMep.setAstreinte(mep.getAstreinte());
		}
	
		newMep.setCommentaire(mep.getCommentaire());
		newMep.setDateMep(mep.getDateMep());
		newMep.setHeureDebut(mep.getHeureDebut());
		newMep.setHeureFin(mep.getHeureFin());
		newMep.setRegression(mep.getRegression());
		newMep.setResultat(mep.getResultat());
		
		newMep.setProblemesResolus(mep.getProblemesResolus());
		newMep.setProblemesOuverts(mep.getProblemesOuverts());
		newMep.setProblemsEscalade(mep.getProblemsEscalade());
		newMep.setUsineImpactes(mep.getUsineImpactes());
		
		MepMetier.updateMepForm(newMep);
		
	}
	
	@RequestMapping(value = "/meps/evolutions", method = RequestMethod.PUT)
	public Iterable<Evolution> listeEvolutionMep(
			@RequestParam Date dateMep ) {
		
		return MepMetier.listEvolutionMep(dateMep);
		
	}
	
	@RequestMapping(value = "/meps/ds", method = RequestMethod.PUT)
	public Iterable<Evolution> listeDsMep(
			@RequestParam Date dateMep) {
		
		return MepMetier.listDSMep(dateMep);
		
	}
	

	/**
	 * KPI 3
	 */
	
	@RequestMapping(value = "/kpi3Periode", method = RequestMethod.PUT)
	public List<Mep> ListKpiMep(@RequestParam String option, 
			@RequestParam Date optionPeriodeFrom, @RequestParam Date optionPeriodeTo) {

		if (option.equals("periode")) {
			MepsKpi3 = MepMetier.listPeriodeKpi3(optionPeriodeFrom, optionPeriodeTo);

		}
		
		for (Mep e : MepsKpi3) {
			System.out.println(e.getIdMep());
		}
		return MepsKpi3;
	}
	
	@RequestMapping(value = "/kpi3Mois", method = RequestMethod.PUT)
	public List<Mep> ListKpiEvolutionMois(@RequestParam String option, 
			@RequestParam String optionMois) {
		

	     Date date1 = new Date();
	     date1.setMonth(Integer.valueOf(optionMois));
	
		if (option.equals("mois")) {
			MepsKpi3 = MepMetier.listMoisKpi3(date1);
			//System.out.println(evolsKpi2);
			//System.out.println(date1);
			
		}
		
		for (Mep e : MepsKpi3) {
			System.out.println(e.getIdMep());
		}
		return MepsKpi3;
	}
	
	

	@RequestMapping(value = "/kpi3OK", method = RequestMethod.GET)
	public List<Mep> ListMepsKPi3OK() throws NullPointerException{
		List<Mep> mepsOk= new ArrayList<Mep>();
		for (Mep e : MepsKpi3) {
			if (e.getRegression()==0) {
				System.out.println("ok => " + e.getIdMep());
				mepsOk.add(e);
			}
		}
		

		return mepsOk;
	}

	@RequestMapping(value = "/kpi3KO", method = RequestMethod.GET)
	public List<Mep> ListMepKPi3KO() throws NullPointerException {
		List<Mep> mepsko =new ArrayList<Mep>();
		for (Mep e : MepsKpi3) {
			if (e.getRegression()==1) {
				System.out.println("ko => " + e.getIdMep());
				mepsko.add(e);
			}
		}
		return mepsko;
	}
	
}

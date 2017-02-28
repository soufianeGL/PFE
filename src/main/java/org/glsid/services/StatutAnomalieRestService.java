package org.glsid.services;


import org.glsid.entities.StatutAnomalie;
import org.glsid.metier.StatutAnomalieMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatutAnomalieRestService {

	
	@Autowired
	private StatutAnomalieMetier statutAnomalieMetier;
	
	@RequestMapping(value = "/statusAnomalies", method = RequestMethod.GET)
	public Iterable<StatutAnomalie> liststatusAnomalies() {
		return statutAnomalieMetier.listStatutAnomalie();
	}
	
	@RequestMapping(value = "/statusAnomalies/{id}", method = RequestMethod.GET)
	public StatutAnomalie getStatutAnomalie(@PathVariable int id) {
		return statutAnomalieMetier.getStatutAnomalie(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/statusAnomalies", method = RequestMethod.POST)
	public StatutAnomalie addStatutAnomalie(@RequestBody StatutAnomalie StatutAnomalie) {
		return statutAnomalieMetier.addStatutAnomalie(StatutAnomalie);
	}
	
	@RequestMapping(value = "/statusAnomalies/{id}", method = RequestMethod.DELETE)
	public void deleteStatutAnomalie(@PathVariable int id) {
		statutAnomalieMetier.deleteStatutAnomalie(statutAnomalieMetier.getStatutAnomalie(id));
	}
	
	@RequestMapping(value = "/statusAnomalies/{id}", method = RequestMethod.PUT)
	public void updateStatutAnomalie(@PathVariable("id") int id, @RequestBody StatutAnomalie statutAnomalie) {
		StatutAnomalie newStatutAnomalie = statutAnomalieMetier.getStatutAnomalie(id);
		if (newStatutAnomalie == null){
			throw new NullPointerException("statut  non trouvé");
		}
		newStatutAnomalie.setStatut(statutAnomalie.getStatut());
		statutAnomalieMetier.updateStatutAnomalieForm(newStatutAnomalie);
		

	}
}

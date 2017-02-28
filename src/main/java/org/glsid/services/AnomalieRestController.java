package org.glsid.services;


import org.glsid.entities.Anomalie;
import org.glsid.metier.AnomalieMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AnomalieRestController {

	
	@Autowired
	private AnomalieMetier anomalieMetier;
	
	@RequestMapping(value = "/anomalies", method = RequestMethod.GET)
	public Iterable<Anomalie> listanomalies() {
		return anomalieMetier.listAnomalie();
	}
	
	@RequestMapping(value = "/anomalies/{id}", method = RequestMethod.GET)
	public Anomalie getAnomalie(@PathVariable int id) {
		return anomalieMetier.getAnomalie(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/anomalies", method = RequestMethod.POST)
	public Anomalie addAnomalie(@RequestBody Anomalie Anomalie) {
		return anomalieMetier.addAnomalie(Anomalie);
	}
	
	@RequestMapping(value = "/anomalies/{id}", method = RequestMethod.DELETE)
	public void deleteAnomalie(@PathVariable int id) {
		anomalieMetier.deleteAnomalie(anomalieMetier.getAnomalie(id));
	}
	
	@RequestMapping(value = "/anomalies/{id}", method = RequestMethod.PUT)
	public void updateAnomalie(@PathVariable("id") int id, @RequestBody Anomalie Anomalie) {
		Anomalie newAnomalie = anomalieMetier.getAnomalie(id);
		if (newAnomalie == null){
			throw new NullPointerException("statut  non trouvé");
		}
		newAnomalie.setId(Anomalie.getId());
		newAnomalie.setDescription(Anomalie.getDescription());
		newAnomalie.setStatutAnmalie(Anomalie.getStatutAnmalie());
		anomalieMetier.updateAnomalieForm(newAnomalie);
		

	}
}

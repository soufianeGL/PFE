package org.glsid.services;


import org.glsid.entities.Evolution;
import org.glsid.entities.Livraison;
import org.glsid.entities.Usine;
import org.glsid.entities.TypeEvolution;
import org.glsid.entities.User;
import org.glsid.entities.UserProfile;
import org.glsid.metier.UsineMetier;
import org.glsid.metier.TypeEvolutionMetier;
import org.glsid.metier.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsineRestService {

	
	@Autowired
	private UsineMetier UsineMetier;
	
	@RequestMapping(value = "/usines", method = RequestMethod.GET)
	public Iterable<Usine> listUsines() {
		return UsineMetier.listUsine();
	}
	
	@RequestMapping(value = "/usines/{id}", method = RequestMethod.GET)
	public Usine getUsine(@PathVariable int id) {
		return UsineMetier.getUsine(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/usines", method = RequestMethod.POST)
	public Usine addUsine(@RequestBody Usine Usine) {
		return UsineMetier.addUsine(Usine);
	}
	
	@RequestMapping(value = "/usines/{id}", method = RequestMethod.DELETE)
	public void deleteUsine(@PathVariable int id) {
		UsineMetier.deleteUsine(UsineMetier.getUsine(id));
	}
	
	@RequestMapping(value = "/usines/{id}", method = RequestMethod.PUT)
	public void updateUsine(@PathVariable("id") int id, @RequestBody Usine usine) {
		Usine updatedusine = UsineMetier.getUsine(id);
		if (usine == null){
			throw new NullPointerException("usine non trouvé");
		}
		updatedusine.setNomUsine(usine.getNomUsine());
		UsineMetier.updateUsineForm(updatedusine);
		

	}

}

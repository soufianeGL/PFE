package org.glsid.services;


import org.glsid.entities.Evolution;
import org.glsid.entities.Livraison;
import org.glsid.entities.TypeEvolution;
import org.glsid.entities.User;
import org.glsid.entities.UserProfile;
import org.glsid.metier.LivraisonMetier;
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
public class LivraisonRestService {

	
	@Autowired
	private LivraisonMetier livraisonMetier;
	
	@RequestMapping(value = "/livraisons", method = RequestMethod.GET)
	public Iterable<Livraison> listLivraisons() {
		return livraisonMetier.listLivraison();
	}
	
	@RequestMapping(value = "/livraisons/{id}", method = RequestMethod.GET)
	public Livraison getLivraison(@PathVariable int id) {
		return livraisonMetier.getLivraison(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/livraisons", method = RequestMethod.POST)
	public Livraison addLivraison(@RequestBody Livraison livraison) {
		return livraisonMetier.addLivraison(livraison);
	}
	
	@RequestMapping(value = "/livraisons/{id}", method = RequestMethod.DELETE)
	public void deleteLivraison(@PathVariable int id) {
		livraisonMetier.deleteLivraison(livraisonMetier.getLivraison(id));
	}
	
	@RequestMapping(value = "/livraisons/{id}", method = RequestMethod.PUT)
	public void updateLivraison(@PathVariable("id") int id, @RequestBody Livraison livraison) {
		Livraison newLivraison = livraisonMetier.getLivraison(id);
		if (newLivraison == null){
			throw new NullPointerException("type non trouvé");
		}
		newLivraison.setEtatLivraison(livraison.getEtatLivraison());
		livraisonMetier.updateLivraisonForm(newLivraison);
		

	}
}

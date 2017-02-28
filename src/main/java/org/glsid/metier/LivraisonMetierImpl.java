package org.glsid.metier;

import java.util.List;

import org.glsid.dao.LivraisonRepository;
import org.glsid.entities.Livraison;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LivraisonMetierImpl implements LivraisonMetier{

	@Autowired
	private LivraisonRepository livraisonRep;
	
	@Override
	public Livraison addLivraison(Livraison livraison) {
		return livraisonRep.save(livraison);
	}

	@Override
	public void deleteLivraison(Livraison livraison) {
		livraisonRep.delete(livraison);
		
	}

	@Override
	public Livraison getLivraison(int id) {
		Livraison liv=livraisonRep.findOne(id);
		return liv;
	}

	@Override
	public void updateLivraisonForm(Livraison livraison) {
				livraisonRep.save(livraison);
	}

	@Override
	public List<Livraison> listLivraison() {
		// TODO Auto-generated method stub
		return livraisonRep.findAll();
	}

}

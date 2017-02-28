package org.glsid.metier;

import java.util.List;

import org.glsid.entities.Livraison;


public interface LivraisonMetier {

	public Livraison addLivraison(Livraison livraison);
	
	public void deleteLivraison(Livraison livraison);
	
	public Livraison getLivraison(int id);
	
	public void updateLivraisonForm(Livraison livraison);
	
	public List<Livraison> listLivraison();
	
}

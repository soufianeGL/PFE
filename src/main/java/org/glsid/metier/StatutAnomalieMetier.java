package org.glsid.metier;

import java.util.List;

import org.glsid.entities.StatutAnomalie;


public interface StatutAnomalieMetier {

	public StatutAnomalie addStatutAnomalie(StatutAnomalie statut);
	
	public void deleteStatutAnomalie(StatutAnomalie statut);
	
	public StatutAnomalie getStatutAnomalie(int id);
	
	public void updateStatutAnomalieForm(StatutAnomalie statut);
	
	public List<StatutAnomalie> listStatutAnomalie();
	
}

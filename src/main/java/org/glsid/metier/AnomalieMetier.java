package org.glsid.metier;

import java.util.List;

import org.glsid.entities.Anomalie;


public interface AnomalieMetier {

	public Anomalie addAnomalie(Anomalie anomalie);
	
	public void deleteAnomalie(Anomalie anomalie);
	
	public Anomalie getAnomalie(int id);
	
	public void updateAnomalieForm(Anomalie anomalie);
	
	public List<Anomalie> listAnomalie();
	
}

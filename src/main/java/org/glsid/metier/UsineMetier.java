package org.glsid.metier;

import java.util.List;

import org.glsid.entities.Usine;


public interface UsineMetier {

	public Usine addUsine(Usine Usine);
	
	public void deleteUsine(Usine Usine);
	
	public Usine getUsine(int id);
	
	public void updateUsineForm(Usine Usine);
	
	public List<Usine> listUsine();
	
}

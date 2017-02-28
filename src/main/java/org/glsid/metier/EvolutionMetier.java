package org.glsid.metier;

import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public interface EvolutionMetier {

	public Evolution ajouterEvolution(Evolution e);
	
	public Iterable<Evolution> listEvolutions();
	public List<Evolution> listEvolutionS( );
	public Evolution getEvolution(String idEvolution);
	public boolean selectionnerEvolution(String idEvolution, int selected);
	public boolean initialiserEvolutions();
	
	public void updateEvolutionForm(Evolution e);

	public boolean SetEtatRecettes();
	public int CalculateJoursOuvrable(Date date1, Date date2) ;
	
	public void updateEvolution(String id, double avancement, double koPourcentage, double rafjh,int rafcastest,String commentaires);
	
	
	public List<Object[]>  getAuditEvolution(String idEvolution );

	public List<Evolution> listEvolutionCpRecette(String name);
	
	public String getPrincipal();
	public String getUsernameLogin();
	public Theme[] listCheckboxes(Theme[] e);
	

	
	
	
}

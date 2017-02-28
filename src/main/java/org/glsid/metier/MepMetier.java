package org.glsid.metier;

import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.Mep;



public interface MepMetier {

	public Mep addMep(Mep mep);
	
	public void deleteMep(Mep mep);
	
	public Mep getMep(int id);
	
	public void updateMepForm(Mep mep);
	
	public List<Mep> listMep();
	
	public List<Evolution> listEvolutionMep(Date  dateMep);
	
	public List<Evolution> listDSMep(Date  dateMep);
	
	public List<Mep> listMoisKpi3(Date d1);
	public List<Mep> listPeriodeKpi3(Date d1,Date d2);
	
	
	
	
	
	
	
	
	
	
}

package org.glsid.metier;

import java.util.List;

import org.glsid.entities.Cpsi;

public interface CpsiMetier {

	
public Cpsi addCpsi(Cpsi Cpsi);
	
	public void deleteCpsi(Cpsi Cpsi);
	
	public Cpsi getCpsi(int id);
	
	public void updateCpsiForm(Cpsi Cpsi);
	
	public List<Cpsi> listCpsi();
}

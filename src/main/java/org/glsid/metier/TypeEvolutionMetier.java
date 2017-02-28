package org.glsid.metier;

import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.TypeEvolution;

public interface TypeEvolutionMetier {

	public TypeEvolution addTypeEvolution(TypeEvolution type);
	
	public void deleteTypeEvolution(TypeEvolution type);
	
	public TypeEvolution getTypeEvolution(int id);
	
	public void updateTypeEvolutionForm(TypeEvolution type);
	
	public List<TypeEvolution> listTypeEvolution();
	
	
}

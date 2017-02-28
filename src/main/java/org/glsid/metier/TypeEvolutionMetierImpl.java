package org.glsid.metier;

import java.util.List;

import org.glsid.dao.EvolutionRepository;
import org.glsid.dao.TypeEvolutionRepository;
import org.glsid.entities.TypeEvolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TypeEvolutionMetierImpl implements TypeEvolutionMetier {

	
	@Autowired
	private TypeEvolutionRepository typeEvolutionRep;
	
	@Override
	public TypeEvolution addTypeEvolution(TypeEvolution type) {
		return typeEvolutionRep.save(type);
	}

	@Override
	public void deleteTypeEvolution(TypeEvolution type) {
		typeEvolutionRep.delete(type);
		
	}

	@Override
	public TypeEvolution getTypeEvolution(int id) {
		return typeEvolutionRep.findOne(id);
	}

	@Override
	public void updateTypeEvolutionForm(TypeEvolution type) {
		typeEvolutionRep.save(type);
		
	}

	@Override
	public List<TypeEvolution> listTypeEvolution() {
		return typeEvolutionRep.findAll();
	}

}

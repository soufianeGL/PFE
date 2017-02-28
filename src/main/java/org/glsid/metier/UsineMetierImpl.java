package org.glsid.metier;

import java.util.List;

import org.glsid.dao.UsineRepository;
import org.glsid.entities.Usine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UsineMetierImpl implements UsineMetier{

	@Autowired
	private UsineRepository UsineRep;
	
	@Override
	public Usine addUsine(Usine Usine) {
		return UsineRep.save(Usine);
	}

	@Override
	public void deleteUsine(Usine Usine) {
		UsineRep.delete(Usine);
		
	}

	@Override
	public Usine getUsine(int id) {
		Usine liv=UsineRep.findOne(id);
		return liv;
	}

	@Override
	public void updateUsineForm(Usine Usine) {
				UsineRep.save(Usine);
	}

	@Override
	public List<Usine> listUsine() {
		// TODO Auto-generated method stub
		return UsineRep.findAll();
	}

}

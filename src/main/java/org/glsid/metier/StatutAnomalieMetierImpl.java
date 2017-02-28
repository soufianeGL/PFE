package org.glsid.metier;

import java.util.List;

import org.glsid.dao.StatutAnomalieRepository;
import org.glsid.entities.StatutAnomalie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StatutAnomalieMetierImpl implements StatutAnomalieMetier{

	@Autowired
	private StatutAnomalieRepository statutRep;
	
	@Override
	public StatutAnomalie addStatutAnomalie (StatutAnomalie statut) {
		return statutRep.save(statut);
	}

	@Override
	public void deleteStatutAnomalie(StatutAnomalie staut) {
		statutRep.delete(staut);
	}

	@Override
	public StatutAnomalie getStatutAnomalie(int id) {
		StatutAnomalie liv=statutRep.findOne(id);
		return liv;
	}

	@Override
	public void updateStatutAnomalieForm(StatutAnomalie staut) {
			statutRep.save(staut);
	}

	@Override
	public List<StatutAnomalie> listStatutAnomalie() {
		// TODO Auto-generated method stub
		return 	statutRep.findAll();
	}

}

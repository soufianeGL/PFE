package org.glsid.metier;

import java.util.List;

import org.glsid.dao.AnomalieRepository;
import org.glsid.entities.Anomalie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AnomalieMetierImpl implements AnomalieMetier{

	@Autowired
	private AnomalieRepository anomalieRep;
	
	@Override
	public Anomalie addAnomalie (Anomalie statut) {
		return anomalieRep.save(statut);
	}

	
	@Override
	public void deleteAnomalie(Anomalie staut) {
		anomalieRep.delete(staut);
	}

	
	@Override
	public Anomalie getAnomalie(int id) {
		Anomalie liv=anomalieRep.findOne(id);
		return liv;
	}

	@Override
	public void updateAnomalieForm(Anomalie staut) {
			anomalieRep.save(staut);
	}

	@Override
	public List<Anomalie> listAnomalie() {
		// TODO Auto-generated method stub
		return 	anomalieRep.findAll();
	}

}

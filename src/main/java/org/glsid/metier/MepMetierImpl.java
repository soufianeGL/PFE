package org.glsid.metier;

import java.util.Date;
import java.util.List;

import org.glsid.dao.MepRepository;
import org.glsid.entities.Evolution;
import org.glsid.entities.Mep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MepMetierImpl implements MepMetier{

	@Autowired
	private MepRepository MepRep;
	
	@Override
	public Mep addMep(Mep mep) {
		return MepRep.save(mep);
	}

	@Override
	public void deleteMep(Mep mep) {
		MepRep.delete(mep);
	}

	@Override
	public Mep getMep(int id) {
		Mep mep=MepRep.getMepWithId(id);
		return mep;
	}

	@Override
	public void updateMepForm(Mep mep) {
				MepRep.save(mep);
	}

	@Override
	public List<Mep> listMep() {
		return MepRep.findAll();
	}

	@Override
	public List<Evolution> listEvolutionMep(Date dateMep) {
		
		return MepRep.listEvolutionMep(dateMep);
	}

	@Override
	public List<Evolution> listDSMep(Date dateMep) {
		return MepRep.listDSMep(dateMep);
	}

	@Override
	public List<Mep> listMoisKpi3(Date d1) {
		return MepRep.listMepsKpi3ChoixMois(d1);
	}

	@Override
	public List<Mep> listPeriodeKpi3(Date d1, Date d2) {
		return MepRep.listMepsKpi3ChoixPeriode(d1, d2);
	}

}

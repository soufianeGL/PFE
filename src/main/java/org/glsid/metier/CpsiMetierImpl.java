package org.glsid.metier;

import java.util.List;

import org.glsid.dao.CpsiRepository;
import org.glsid.entities.Cpsi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CpsiMetierImpl implements CpsiMetier{

	
	@Autowired
	private CpsiRepository CpsiRep;
	
	@Override
	public Cpsi addCpsi(Cpsi cpsi) {
		return CpsiRep.save(cpsi);
	}

	@Override
	public void deleteCpsi(Cpsi cpsi) {
		CpsiRep.delete(cpsi);
	}

	@Override
	public Cpsi getCpsi(int id) {
		return CpsiRep.findOne(id);
	}

	@Override
	public void updateCpsiForm(Cpsi cpsi) {
		CpsiRep.save(cpsi);
		
	}

	@Override
	public List<Cpsi> listCpsi() {
		return CpsiRep.findAll();
	}

}

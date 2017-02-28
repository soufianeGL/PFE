package org.glsid.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.glsid.entities.Cpsi;
import org.glsid.metier.*;

@RestController
public class CpsiRestController {

	@Autowired
	private CpsiMetier CpsiMetier;
	
	@RequestMapping(value = "/cpsis", method = RequestMethod.GET)
	public Iterable<Cpsi> listCpsis() {
		return CpsiMetier.listCpsi();
	}
	
	@RequestMapping(value = "/cpsis/{id}", method = RequestMethod.GET)
	public Cpsi getCpsi(@PathVariable int id) {
		return CpsiMetier.getCpsi(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cpsis", method = RequestMethod.POST)
	public Cpsi addCpsi(@RequestBody Cpsi Cpsi) {
		return CpsiMetier.addCpsi(Cpsi);
	}
	
	@RequestMapping(value = "/cpsis/{id}", method = RequestMethod.DELETE)
	public void deleteCpsi(@PathVariable int id) {
		CpsiMetier.deleteCpsi(CpsiMetier.getCpsi(id));
	}
	
	@RequestMapping(value = "/cpsis/{id}", method = RequestMethod.PUT)
	public void updateCpsi(@PathVariable("id") int id, @RequestBody Cpsi cpsi) {
		Cpsi newCpsi = CpsiMetier.getCpsi(id);
		if (newCpsi == null){
			throw new NullPointerException("type non trouvé");
		}
		newCpsi.setusernameCpsi(cpsi.getusernameCpsi());
		CpsiMetier.updateCpsiForm(newCpsi);
		

	}
}

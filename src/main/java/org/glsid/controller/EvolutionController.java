package org.glsid.controller;

import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.Mep;
import org.glsid.metier.EvolutionMetier;
import org.glsid.metier.MepMetier;
import org.glsid.services.EvolutionRestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EvolutionController {

	@Autowired
	private EvolutionMetier evolutionMetier;
	
	@Autowired
	private MepMetier mepMetier;
	

	@RequestMapping(value = "/evols", method = RequestMethod.GET)
	public void ajoutExcel(Model model) {
		
		model.addAttribute("evolutions", evolutionMetier.listEvolutionS());
		model.addAttribute("user", evolutionMetier.getUsernameLogin());
		//******pour exporter que les columns selectionnées
		model.addAttribute("checkboxes", EvolutionRestService.listCheckboxes);
		
	
		
	}
	
	
	

}

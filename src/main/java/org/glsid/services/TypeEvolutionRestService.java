package org.glsid.services;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.glsid.dao.EvolutionRepository;
import org.glsid.entities.Evolution;
import org.glsid.entities.TypeEvolution;
import org.glsid.entities.User;
import org.glsid.metier.EvolutionMetier;
import org.glsid.metier.Theme;
import org.glsid.metier.TypeEvolutionMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TypeEvolutionRestService {


	@Autowired
	private TypeEvolutionMetier typeEvolutionMetier;
	
	@RequestMapping(value = "/types", method = RequestMethod.GET)
	public Iterable<TypeEvolution> listTypeEvolution() {

		return typeEvolutionMetier.listTypeEvolution();
	}
	
	@RequestMapping(value = "/types/{id}", method = RequestMethod.GET)
	public TypeEvolution getTypeEvolution(@PathVariable int id) {

		return typeEvolutionMetier.getTypeEvolution(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/types", method = RequestMethod.POST)
	public TypeEvolution addTypeEvolution(@RequestBody TypeEvolution type) {
		return typeEvolutionMetier.addTypeEvolution(type);
	}
	
	@RequestMapping(value = "/types/{id}", method = RequestMethod.DELETE)
	public void deleteTypeEvolution(@PathVariable int id) {
		 typeEvolutionMetier.deleteTypeEvolution(typeEvolutionMetier.getTypeEvolution(id));
		 
	}
	
	@RequestMapping(value = "/types/{id}", method = RequestMethod.PUT)
	public void updateTypeEvolution(@PathVariable("id") int id, @RequestBody TypeEvolution type) {
		TypeEvolution newTypeEvolution = typeEvolutionMetier.getTypeEvolution(id);
		if (newTypeEvolution == null){
			throw new NullPointerException("type non trouvé");
		}
		newTypeEvolution.setType(type.getType());
		typeEvolutionMetier.updateTypeEvolutionForm(newTypeEvolution);
		

	}
	
}

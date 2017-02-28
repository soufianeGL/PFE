package org.glsid.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.glsid.entities.Evolution;
import org.glsid.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Kpi2RestController {

	
	@Autowired
	private EntityManager em;
	


}

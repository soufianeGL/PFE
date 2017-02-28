package org.glsid.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.glsid.entities.Evolution;
import org.glsid.entities.User;
import org.glsid.entities.UserProfile;
import org.glsid.metier.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CPRecetteRestService {

	@Autowired
	private EntityManager em;
	
	@Autowired
	private UserService userService;


	@RequestMapping(value = "/cprecettes", method = RequestMethod.GET)
	public List<User> listerCPR() {
		Query query = em.createQuery("SELECT u FROM User u join u.userProfiles p where p.type = 'CPR'");

		return query.getResultList();
	}


	
	@RequestMapping(value = "/userProfiles", method = RequestMethod.GET)
	public List<UserProfile> listerProfiles() {
		Query query = em.createQuery("SELECT u FROM UserProfile u");
		return query.getResultList();
	}
	
	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public void addUser(@RequestBody User user) {
		 userService.ajouterUser(user);
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public List<User> listUsers() {
		return userService.listeUsers();
		

		//filter users
		//Query query = em.createQuery("SELECT u FROM User u where u.state ='Active'");
		//return query.getResultList();
	}
	
	@RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
	public User getUtilisateur(@PathVariable int id) {
		return userService.getUser(id);
	}
	
	@RequestMapping(value = "/users/{id}", method = RequestMethod.DELETE)
	public void deleteUser(@PathVariable int id) {
			userService.deleteUser(id);
	}
	
	
	@RequestMapping(value = "/users/{id}", method = RequestMethod.PUT)
	public void updateEvolution1(@PathVariable("id") int id, @RequestBody User utilisateur) {
		User newUser = em.find(User.class, id);
		if (newUser == null){
			throw new NullPointerException("Pas d'utilisateur a modifié");
		}
		newUser.setFirstName(utilisateur.getFirstName());
		newUser.setLastName(utilisateur.getLastName());
		newUser.setSsoId(utilisateur.getSsoId());
		newUser.setState(utilisateur.getState());
		newUser.setEmail(utilisateur.getEmail());
		newUser.setUserProfiles(utilisateur.getUserProfiles());
		newUser.setPassword(utilisateur.getPassword());
		
		userService.updateUserForm(newUser);

		System.out.println("updated User avec success");

	}
	
}

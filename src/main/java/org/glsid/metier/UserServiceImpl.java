package org.glsid.metier;

import java.util.List;

import javax.persistence.EntityManager;

import org.glsid.dao.UserDao;
import org.glsid.dao.UserRepository;
import org.glsid.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
 
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
 
    @Autowired
    private UserDao dao;
    
    @Autowired
    private EntityManager em;
    
    @Autowired
    private UserRepository userRep;
 
    public User findById(int id) {
        return dao.findById(id);
    }
 
    public User findBySso(String sso) {
        return dao.findBySSO(sso);
    }

	@Override
	public void ajouterUser(User user) {
		em.persist(user);
		
	}

	@Override
	public List<User> listeUsers() {
		return userRep.findAll();
	}

	@Override
	public User getUser(int userId) {
		User userEdited = userRep.findOne(userId);
		if(userEdited==null) throw new NotFoundException("Utilisateur non existe");
		return userEdited ;
	}

	@Override
	public void updateUserForm(User utilisateur) {
		userRep.save(utilisateur);
		
	}

	@Override
	public void deleteUser(int id) {
		
		userRep.delete(id);
		
	}
	
	
 
}
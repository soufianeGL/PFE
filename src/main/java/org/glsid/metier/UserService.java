package org.glsid.metier;

import java.util.List;

import org.glsid.entities.User;

public interface UserService {
	 
    User findById(int id);
    User findBySso(String sso);
   public  void ajouterUser(User user);
   
   public List<User> listeUsers();
   public User getUser(int userId);
   
   public void updateUserForm(User utilisateur);
   
   public void deleteUser(int id);
     
}
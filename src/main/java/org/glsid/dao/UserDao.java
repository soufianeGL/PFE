package org.glsid.dao;

import org.glsid.entities.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao {

	User findById(int id);

	User findBySSO(String sso);

}
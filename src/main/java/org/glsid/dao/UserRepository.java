package org.glsid.dao;

import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Integer> {


}

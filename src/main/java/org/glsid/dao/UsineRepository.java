package org.glsid.dao;

import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.Livraison;
import org.glsid.entities.Usine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import java.lang.String;

@RepositoryRestResource
public interface UsineRepository extends JpaRepository<Usine, Integer> {


	
}
package org.glsid.dao;

import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.TypeEvolution;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import java.lang.String;

@RepositoryRestResource
public interface TypeEvolutionRepository extends JpaRepository<TypeEvolution, Integer> {

	
}


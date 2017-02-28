package org.glsid.dao;

import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import java.lang.String;

@RepositoryRestResource
public interface EvolutionRepository extends JpaRepository<Evolution, String> {

	List<Evolution> findByEvolutionSelected(int evolutionSelected);
	

	@Query("select DISTINCT e from Evolution e join e.cprecettes cp where    cp.ssoId like :x% ")
	public List <Evolution> listEvolutionCp(@Param("x") String name);
	

	
	//liste des evolutions avec le choix de kpi periode
	@Query("select  e from Evolution e where e.dateMepSouhaitee >= :x AND e.dateMepSouhaitee <= :y ")
	public List <Evolution> listEvolutionOK(@Param("x") Date d1, @Param("y") Date d2 );

	
	//list des evolution avec le choix de kpi mois
	@Query("SELECT e FROM Evolution e WHERE trunc ( e.dateMepSouhaitee , 'YYYY' ) = trunc ( systimestamp, 'YYYY' ) and trunc ( e.dateMepSouhaitee, 'MM' ) = trunc ( :x, 'mm' )")
 	public List <Evolution> listEvolutionKpi2ChoixMois(@Param("x") Date d1); 
	

	@Query("select  e from Evolution e where e.RefEvolution like :x ")
	public Evolution getByRefEvolution(@Param("x") String name);
	
}


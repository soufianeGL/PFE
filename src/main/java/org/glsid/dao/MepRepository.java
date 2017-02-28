package org.glsid.dao;

import java.util.Date;
import java.util.List;

import org.glsid.entities.Evolution;
import org.glsid.entities.Mep;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import java.lang.String;

@RepositoryRestResource
public interface MepRepository extends JpaRepository<Mep, Integer> {

	//liste des evolutions Mgen à la date mep
	@Query("select  m from Evolution m where"
			+ " m.typeEvolution.type = 'MGEN'"
			+ " and trunc ( m.dateMepSouhaitee, 'MM' ) = trunc ( :x, 'mm' )"
			+ " and trunc ( m.dateMepSouhaitee, 'YYY' ) = trunc ( :x, 'YYYY' )"
			+ " and trunc ( m.dateMepSouhaitee, 'DD' ) = trunc ( :x, 'DD' )"
			+ " and m.etatLivaison.livraison = 'En VABF'")
	public List <Evolution> listEvolutionMep(@Param("x") Date d1);
	
	
	//liste des evolutions
	@Query("select  m from Evolution m where"
			+ " m.typeEvolution.type = 'DS'"
			+ " and trunc ( m.dateMepSouhaitee, 'MM' ) = trunc ( :x, 'mm' )"
			+ " and trunc ( m.dateMepSouhaitee, 'YYY' ) = trunc ( :x, 'YYYY' )"
			+ " and trunc ( m.dateMepSouhaitee, 'DD' ) = trunc ( :x, 'DD' )"
			+ " and m.etatLivaison.livraison = 'En VABF'")
	public List <Evolution> listDSMep(@Param("x") Date d1);
	
	@Query("select DISTINCT e from Mep e where e.idMep = :x ")
	public Mep getMepWithId(@Param("x") int id);
	
	//list des mep avec le choix de kpi mois
	@Query("SELECT e FROM Mep e WHERE trunc ( e.dateMep , 'YYYY' ) = trunc ( systimestamp, 'YYYY' ) and trunc ( e.dateMep, 'MM' ) = trunc ( :x, 'mm' )")
 	public List <Mep> listMepsKpi3ChoixMois(@Param("x") Date d1); 
	
	//liste des meps avec le choix de kpi periode
	@Query("select  e from Mep e where e.dateMep >= :x AND e.dateMep <= :y ")
	public List <Mep> listMepsKpi3ChoixPeriode(@Param("x") Date d1, @Param("y") Date d2 );
	
	
	
	
	
}


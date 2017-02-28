package org.glsid.entities;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@Entity
public class Mep implements Serializable{

	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idMep;
	private Date dateMep;
	
	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <Usine> usineImpactes;
	
	
	private String heureDebut;
	
	private String heureFin;
	
	
	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <User> astreinte;
	
	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <Evolution> mgen;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <Evolution> ds;
	

	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <Anomalie> problemesResolus;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <Anomalie> problemesOuverts;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.MERGE)
	private Collection <Anomalie> problemsEscalade;
	
	
	private int regression;
	private String commentaire;
	private String resultat;
	
	
	
	
	
	public int getIdMep() {
		return idMep;
	}

	public void setIdMep(int idMep) {
		this.idMep = idMep;
	}

	public Date getDateMep() {
		return dateMep;
	}

	public void setDateMep(Date dateMep) {
		this.dateMep = dateMep;
	}

	public Collection<Usine> getUsineImpactes() {
		return usineImpactes;
	}

	public void setUsineImpactes(Collection<Usine> usineImpactes) {
		this.usineImpactes = usineImpactes;
	}

	public String getHeureDebut() {
		return heureDebut;
	}

	public void setHeureDebut(String heureDebut) {
		this.heureDebut = heureDebut;
	}

	public String getHeureFin() {
		return heureFin;
	}

	public void setHeureFin(String heureFin) {
		this.heureFin = heureFin;
	}

	public Collection<User> getAstreinte() {
		return astreinte;
	}

	public void setAstreinte(Collection<User> astreinte) {
		this.astreinte = astreinte;
	}

	public Collection<Evolution> getMgen() {
		return mgen;
	}

	public void setMgen(Collection<Evolution> mgen) {
		this.mgen = mgen;
	}

	public Collection<Evolution> getDs() {
		return ds;
	}

	public void setDs(Collection<Evolution> ds) {
		this.ds = ds;
	}

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public String getResultat() {
		return resultat;
	}

	public void setResultat(String resultat) {
		this.resultat = resultat;
	}

	public Collection<Anomalie> getProblemesResolus() {
		return problemesResolus;
	}

	public void setProblemesResolus(Collection<Anomalie> problemesResolus) {
		this.problemesResolus = problemesResolus;
	}

	public Collection<Anomalie> getProblemesOuverts() {
		return problemesOuverts;
	}

	public void setProblemesOuverts(Collection<Anomalie> problemesOuverts) {
		this.problemesOuverts = problemesOuverts;
	}

	public Collection<Anomalie> getProblemsEscalade() {
		return problemsEscalade;
	}

	public void setProblemsEscalade(Collection<Anomalie> problemsEscalade) {
		this.problemsEscalade = problemsEscalade;
	}

	public int getRegression() {
		return regression;
	}

	public void setRegression(int regression) {
		this.regression = regression;
	}

	public Mep(Date dateMep, Collection<Usine> usineImpactes, String heureDebut, String heureFin,
			Collection<User> astreinte, Collection<Evolution> mgen, Collection<Evolution> ds, String commentaire,
			String resultat, Collection<Anomalie> problemesResolus, Collection<Anomalie> problemesOuverts,
			Collection<Anomalie> problemsEscalade, int regression) {
		super();
		this.dateMep = dateMep;
		this.usineImpactes = usineImpactes;
		
	
		this.heureDebut = heureDebut;
		this.heureFin = heureFin;
		this.astreinte = astreinte;
		this.mgen = mgen;
		this.ds = ds;
		this.commentaire = commentaire;
		this.resultat = resultat;
		this.problemesResolus = problemesResolus;
		this.problemesOuverts = problemesOuverts;
		this.problemsEscalade = problemsEscalade;
		this.regression = regression;
	}

	public Mep() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	@JsonCreator
    public static Mep Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        Mep mep = null;
        mep = mapper.readValue(jsonString, Mep.class);
        return mep;
    }
	
	
	
	
	
}

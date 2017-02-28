package org.glsid.entities;

import java.io.Serializable;

import javax.persistence.Entity;

import java.io.IOException;
import java.io.Serializable;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Size;


import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Entity
public class Usine implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idUsine;
	
	@Column(nullable=false, unique=true)
	@Size(min = 2, max =40)
	private String nomUsine;

	public int getIdUsine() {
		return idUsine;
	}

	public void setIdUsine(int idUsine) {
		this.idUsine = idUsine;
	}

	public String getNomUsine() {
		return nomUsine;
	}

	public void setNomUsine(String nomUsine) {
		this.nomUsine = nomUsine;
	}

	public Usine(String nomUsine) {
		super();
		this.nomUsine = nomUsine;
	}
	
	

	 public Usine() {
		super();
		// TODO Auto-generated constructor stub
	}

	@JsonCreator
	    public static Usine Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
	        ObjectMapper mapper = new ObjectMapper();
	        Usine usine = null;
	        usine = mapper.readValue(jsonString, Usine.class);
	        return usine;
	    }
	 
	
	
	
	
	
	
	
	
	
	
}

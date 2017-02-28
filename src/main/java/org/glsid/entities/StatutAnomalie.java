package org.glsid.entities;

import java.io.IOException;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Entity
public class StatutAnomalie implements Serializable{

	
	@Id
	@GeneratedValue()
	private int id;
	
	
	@Column(nullable = false, unique = true)
	@Size(min = 3, max = 30)
	private String statut;
	
	public StatutAnomalie(int id, String statut) {
		super();
		this.id = id;
		this.statut = statut;
	}


	public StatutAnomalie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	
	 public String getStatut() {
		return statut;
	}


	public void setStatut(String statut) {
		this.statut = statut;
	}
	
	


	@JsonCreator
	    public static StatutAnomalie Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
	        ObjectMapper mapper = new ObjectMapper();
	        StatutAnomalie statut = null;
	        statut = mapper.readValue(jsonString, StatutAnomalie.class);
	        return statut;
	    }
	
}

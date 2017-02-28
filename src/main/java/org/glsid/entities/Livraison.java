package org.glsid.entities;

import java.io.IOException;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Entity
public class Livraison implements Serializable{

	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	
	@Column(nullable = false, unique = true)
	@Size(min = 3, max = 30)
	private String livraison;
	
	public Livraison(int id, String etatLivraison) {
		super();
		this.id = id;
		livraison = etatLivraison;
	}


	public Livraison() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEtatLivraison() {
		return livraison;
	}

	public void setEtatLivraison(String etatLivraison) {
		livraison = etatLivraison;
	}
	
	 @JsonCreator
	    public static Livraison Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
	        ObjectMapper mapper = new ObjectMapper();
	        Livraison livraison = null;
	        livraison = mapper.readValue(jsonString, Livraison.class);
	        return livraison;
	    }
	
}

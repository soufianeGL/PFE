package org.glsid.entities;

import java.io.IOException;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@Entity
public class Anomalie implements Serializable {

	
	@Id
	private int id;
	
	
	@ManyToOne
	@JoinColumn(name = "id_statut")
	private StatutAnomalie statutAnmalie;
	
	private String description;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public StatutAnomalie getStatutAnmalie() {
		return statutAnmalie;
	}

	public void setStatutAnmalie(StatutAnomalie statutAnmalie) {
		this.statutAnmalie = statutAnmalie;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
	
	public Anomalie(int id, StatutAnomalie statutAnmalie, String description) {
		super();
		this.id = id;
		this.statutAnmalie = statutAnmalie;
		this.description = description;
	}
	
	

	public Anomalie() {
		super();
		// TODO Auto-generated constructor stub
	}

	@JsonCreator
    public static Anomalie Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        Anomalie anomalie = null;
        anomalie = mapper.readValue(jsonString, Anomalie.class);
        return anomalie;
    }
	
	
	
	
 

	
	
	
}

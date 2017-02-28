package org.glsid.entities;

import java.io.IOException;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Entity
public class Cpsi implements Serializable{

    @Id 
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
    
    
    @Column(unique=true, nullable=false)
	private String usernameCpsi;
    
    
    
    public Cpsi() {
		super();
		// TODO Auto-generated constructor stub
	}





	public Cpsi(String usernameCpsi) {
		super();
		this.usernameCpsi = usernameCpsi;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getusernameCpsi() {
		return usernameCpsi;
	}


	public void setusernameCpsi(String usernameCpsi) {
		this.usernameCpsi = usernameCpsi;
	}



	@JsonCreator
    public static Cpsi Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        Cpsi cpsi = null;
        cpsi = mapper.readValue(jsonString, Cpsi.class);
        return cpsi;
    }
}

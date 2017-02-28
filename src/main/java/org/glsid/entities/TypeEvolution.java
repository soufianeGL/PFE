package org.glsid.entities;

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.envers.Audited;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonSetter;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Entity
public class TypeEvolution implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(nullable=false, unique=true)
	@Size(min = 2, max =60)
	private String type;
	
	public TypeEvolution(String type) {
		super();
		this.type = type;
	}
	
	public TypeEvolution() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
	 @JsonCreator
	    public static TypeEvolution Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
	        ObjectMapper mapper = new ObjectMapper();
	        TypeEvolution typeEvolution = null;
	        typeEvolution = mapper.readValue(jsonString, TypeEvolution.class);
	        return typeEvolution;
	    }
	 
	
	
}












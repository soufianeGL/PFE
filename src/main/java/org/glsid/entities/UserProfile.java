package org.glsid.entities;

import java.io.IOException;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.tomcat.util.buf.UEncoder;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Entity
@Table(name = "USER_PROFILE")
public class UserProfile implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	
	@Column(name = "TYPE", length = 15, unique = true, nullable = false)
	private String type = UserProfileType.USER.getUserProfileType();

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

	
	@JsonIgnore
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	
	@JsonInclude
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof UserProfile))
			return false;
		UserProfile other = (UserProfile) obj;
		if (id != other.id)
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}
	
	 @JsonCreator
	    public static UserProfile Create(String jsonString) throws JsonParseException, JsonMappingException, IOException {
	        ObjectMapper mapper = new ObjectMapper();
	        UserProfile up = null;
	        up = mapper.readValue(jsonString, UserProfile.class);
	        return up;
	    }

	 
	 @JsonIgnore
	@Override
	public String toString() {
		return "UserProfile [id=" + id + ",  type=" + type + "]";
	}

}
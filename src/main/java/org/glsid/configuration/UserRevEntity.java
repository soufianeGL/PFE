package org.glsid.configuration;

import javax.persistence.Entity;

import org.glsid.metier.EvolutionMetierImpl;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionEntity;

@Entity
@RevisionEntity(EvolutionMetierImpl.class)
public class UserRevEntity extends DefaultRevisionEntity {
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
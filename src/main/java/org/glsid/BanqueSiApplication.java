package org.glsid;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;

import org.glsid.entities.User;
import org.glsid.entities.UserProfile;
import org.glsid.metier.UserService;
import org.hibernate.validator.constraints.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;


@SpringBootApplication
public class BanqueSiApplication extends SpringBootServletInitializer {

	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BanqueSiApplication.class);
	}

	
	public static void main(String[] args) {
		SpringApplication.run(BanqueSiApplication.class, args);

		
	}
	
	
	

}

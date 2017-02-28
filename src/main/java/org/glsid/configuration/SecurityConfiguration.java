package org.glsid.configuration;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Service;

@EnableWebSecurity
@Service
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {


	@Autowired
	@Qualifier("customUserDetailsService")
	UserDetailsService userDetailsService;
	
	@Autowired
	HibernateConfiguration hc;
	
	
	
	

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/").access("hasRole('ADMIN') or hasRole('CPR') or hasRole('USER')")
				.antMatchers("/home").access("hasRole('ADMIN') or hasRole('CPR') or hasRole('USER')")
				.antMatchers("/evolutions/**").permitAll()
				.antMatchers("/evolutions").permitAll()
				.antMatchers("/admin/**").access("hasRole('ADMIN')")
				.antMatchers("/kpi").access("hasRole('ADMIN')")
				.antMatchers("/ajouterEvolution").access("hasRole('ADMIN') or hasRole('CPR')")
				.antMatchers("/evols").access("hasRole('ADMIN')")
				.antMatchers("/ajouterUser").access("hasRole('ADMIN')")
				.antMatchers("/listUsers").access("hasRole('ADMIN')")
				.antMatchers("/evolutionsCprecette").access("hasRole('CPR')")
				.antMatchers("/db/**")
				.access("hasRole('ADMIN') and hasRole('DBA')").and().exceptionHandling()
				.accessDeniedPage("/Access_Denied").and().formLogin().loginPage("/login").usernameParameter("ssoId")
				.passwordParameter("password")
		        .and().rememberMe().rememberMeParameter("remember-me").tokenRepository(persistentTokenRepository()).tokenValiditySeconds(86400)
				.and().csrf().disable();
	}
	
	@Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl tokenRepositoryImpl = new JdbcTokenRepositoryImpl();
        tokenRepositoryImpl.setDataSource(hc.dataSource());
        return tokenRepositoryImpl;
    }
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}

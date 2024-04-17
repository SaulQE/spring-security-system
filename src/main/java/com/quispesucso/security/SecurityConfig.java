package com.quispesucso.security;

import com.quispesucso.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
	@Autowired
	private CustomSuccessHandler successHandler;
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	public SecurityConfig() {
	}
	
	//Metodo de autenticación
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception 
	{
		//Verificar las credenciales
		auth.userDetailsService(userServiceImpl);
		
	}
	
	//Metodo de autorización
	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
		//permisos URLs
		http.authorizeRequests()
		    .antMatchers("/","/index").permitAll()
		    .antMatchers("/user/**").access("hasRole('USER')")
		    .antMatchers("/admin/**").access("hasRole('ADMIN')")
		    .antMatchers("/dba/**").access("hasRole('ADMIN') and hasRole('DBA')");

		
		//Autenticación basica
		http.authorizeRequests().and()
			.httpBasic();
		
		//Login personalizado
		http.authorizeRequests().and()
			.formLogin()
			.loginPage("/login")
			.usernameParameter("txtUsername")
			.passwordParameter("txtPassword")
			.successHandler(successHandler);
		
		//URL de acceso denegado
		http.authorizeRequests().and()
			.exceptionHandling().accessDeniedPage("/access_denied");
		
		//contra ataques maliciosos
		http.authorizeRequests().and()
			.csrf();
	}
	
	@Bean
	public PasswordEncoder passwordEndcoder()
	{
		return new BCryptPasswordEncoder();
	}
	
}

package com.quispesucso.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler 
{
	private RedirectStrategy redirect = new DefaultRedirectStrategy();

	//Entrando en sesión OK
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException 
	{
		//URL determinado
		String targetUrl = this.determineTargetUrl(authentication);
		
		//redireccionar sugun su rol
		redirect.sendRedirect(request, response, targetUrl);
	}
	
	protected String determineTargetUrl(Authentication authentication)
	{
		String url = null;
		
		Collection<String> roles = new ArrayList<>();
		
		for(GrantedAuthority authority : authentication.getAuthorities()) {
			roles.add(authority.getAuthority());
		}
		
		if(roles.contains("ROLE_DBA"))
			url = "/dba";
		else if(roles.contains("ROLE_ADMIN"))
			url = "/admin";
		else if(roles.contains("ROLE_USER"))
			url = "/user";
		else
			url = "/access_denied";
		
		return url;
	}

}

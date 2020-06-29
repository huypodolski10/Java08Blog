/*
 *@author Admin
 *@date Jun 13, 2020
*/
package com.devpro.java08blog.security;

import java.io.IOException;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String targetUrl = determineTargetUrl(authentication);
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }

    private String determineTargetUrl(Authentication authentication) {
        String url = "";

        Set<GrantedAuthority> grantedAuthorities = authentication
                .getAuthorities()
                .stream()
                .collect(Collectors.toSet());

        if (isAdmin(grantedAuthorities)) {
            url = "/admin/home";
        } else if (isUser(grantedAuthorities)) {
            url = "/home";
        }
        return url;
    }

    private boolean isUser(Set<GrantedAuthority> grantedAuthorities) {
        Predicate<GrantedAuthority> compare = s -> s.getAuthority().equals("USER");
        return grantedAuthorities.stream().anyMatch(compare::test);
    }

    private boolean isAdmin(Set<GrantedAuthority> grantedAuthorities) {
        Predicate<GrantedAuthority> compare = s -> s.getAuthority().equals("ADMIN");
        return grantedAuthorities.stream().anyMatch(compare::test);
    }

}

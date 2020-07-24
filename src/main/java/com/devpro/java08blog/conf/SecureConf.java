/*
 *@author Admin
 *@date May 24, 2020
*/
package com.devpro.java08blog.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.context.request.RequestContextListener;

import com.devpro.java08blog.beans.NormalPasswordEncoder;
import com.devpro.java08blog.security.CustomSuccessHandler;

@EnableOAuth2Sso
@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // thực hiện xác thực request ngưười dùng gửi lên.

				// không thực hiện xác thực đối với các url này.
				.antMatchers("/login/**", "/webjars/**/", "/errors/**", "/css/**", "/js/**", "/img/**",
						"/bootstrap/**", "/plugins/**", "/less/**", "/vid/**")
				.permitAll()

				// thực hiện xác thực với các url kiểu ..../admin/....
				.antMatchers("/admin/**").authenticated()

				.and() // kết hợp với điều kiện.

				/////// L O G O U T ///////
				// khi click vào button logout thì không cần login.
				// khi click vào button này thì dữ liệu user trên session sẽ bị xoá.
				.logout().logoutUrl("/perform_logout").logoutSuccessUrl("/login").invalidateHttpSession(true)
				.deleteCookies("JSESSIONID") // xoá hết dữ liệu trên cookies.
				.permitAll()

				.and() // kết hợp với điều kiện.

				/////// L O G I N ///////
				.formLogin() // thực hiện xác thực qua form(username và password)
				.loginPage("/userLogin") // trang login do mình thiết kế.
				.loginProcessingUrl("/perform_login") // link action for form post.
				.successHandler(myAuthenticationSuccessHandler()).failureUrl("/login?login_error=true").permitAll();
	}

	@Bean
	public AuthenticationManager customAuthenticationManager() throws Exception {
		return authenticationManager();
	}

	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		// thực hiện gắn kết AuthenticationManager với UserDetailsService.
		auth.userDetailsService(userDetailsService).passwordEncoder(new NormalPasswordEncoder());
	}

	@Bean
	public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
		return new CustomSuccessHandler();
	}

	@Bean
	public RequestContextListener requestContextListener() {
		return new RequestContextListener();
	}
}

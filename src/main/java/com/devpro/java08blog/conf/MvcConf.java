/*
 * @author Admin
 * @date Feb 19, 2020
 *
 * Đây là lớp cấu hình MVC.
 * Mục đích tích hợp MVC vào Project.
*/
package com.devpro.java08blog.conf;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@ControllerAdvice
@Configuration // 1 - Cho Spring IoC container biết đây là bean, 2 - Báo Spring biết đây là
				// file chứa cấu hình.
@EnableWebMvc // Bật module MVC.
@ComponentScan(basePackages = { "com.devpro" }) // Chỉ ra package mà Spring cần scan.
public class MvcConf implements WebMvcConfigurer {

	private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(MvcConf.class);
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/META-INF/css/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/META-INF/img/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/META-INF/js/");
		registry.addResourceHandler("/vid/**").addResourceLocations("classpath:/META-INF/vid/");
		registry.addResourceHandler("/bootstrap/**").addResourceLocations("classpath:/META-INF/bootstrap/");
		registry.addResourceHandler("/plugins/**").addResourceLocations("classpath:/META-INF/plugins/");
		registry.addResourceHandler("/less/**").addResourceLocations("classpath:/META-INF/less/");
		registry.addResourceHandler("/admin/**").addResourceLocations("classpath:/META-INF/admin/");
		registry.addResourceHandler("/files/**").addResourceLocations("file:D:/Java Web 2/java08blog/upload/");
	}

	@Bean
	public HttpFirewall defaultHttpFirewall() {
		return new DefaultHttpFirewall();
	}
	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
		// If the exception is annotated with @ResponseStatus rethrow it and let
		// the framework handle it - like the OrderNotFoundException example
		// at the start of this post.
		// AnnotationUtils is a Spring Framework utility class.
//		if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null)
//			throw e;

		LOGGER.error(e.getMessage(), e);
		
		if(e instanceof org.springframework.web.servlet.NoHandlerFoundException) { // 404
			// Otherwise setup and send the user to a default error-view.
			ModelAndView mav = new ModelAndView();
			mav.addObject("exception", e);
			mav.addObject("url", req.getRequestURL());
			mav.setViewName("errors/404");
			return mav;
		} else {
			// Otherwise setup and send the user to a default error-view.
			ModelAndView mav = new ModelAndView();
			mav.addObject("exception", e);
			mav.addObject("url", req.getRequestURL());
			mav.setViewName("errors/common");
			return mav;
		}
		
	}
}

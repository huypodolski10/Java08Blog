/*
 * @author Admin
 * @date Feb 19, 2020
 *
 * Đây là lớp cấu hình MVC.
 * Mục đích tích hợp MVC vào Project.
*/
package com.devpro.java08blog.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration // 1 - Cho Spring IoC container biết đây là bean, 2 - Báo Spring biết đây là
				// file chứa cấu hình.
@EnableWebMvc // Bật module MVC.
@ComponentScan(basePackages = { "com.devpro" }) // Chỉ ra package mà Spring cần scan.
public class MvcConf implements WebMvcConfigurer {

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
	}
}

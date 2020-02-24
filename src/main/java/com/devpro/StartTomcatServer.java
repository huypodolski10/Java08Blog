/*
 *@author Admin
 *@date Feb 20, 2020
*/
package com.devpro;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication /* Hiểu đây là một ứng dụng spring boot */
public class StartTomcatServer {
	public static void main(String[] args) {
		// Là một entry point của ứng dụng sử dụng spring boot (điểm vào)
		SpringApplication.run(StartTomcatServer.class, args);
	}
}
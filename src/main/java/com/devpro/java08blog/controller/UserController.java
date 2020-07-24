/*
 *@author Admin
 *@date Jul 12, 2020
*/
package com.devpro.java08blog.controller;

import java.security.Principal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
	@GetMapping
	public Principal getUser(Principal user) {
		return user;
	}
}

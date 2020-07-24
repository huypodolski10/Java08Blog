/*
 *@author Admin
 *@date Mar 26, 2020
*/
package com.devpro.java08blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entity.User;
import com.devpro.java08blog.repository.RoleRepository;
import com.devpro.java08blog.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	@Autowired
	RoleRepository roleRepo;

	@GetMapping("/userLogin")
	public String login(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "login";
	}

	@GetMapping("/register")
	public String register(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/register")
	public String registerUser(@ModelAttribute("user") User user, @RequestParam("userImage") MultipartFile userImage,
			@RequestParam("roleID") Integer roleID, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		try {
			userService.registerUser(user, userImage, roleRepo.getOne(roleID));
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		return "redirect:/userLogin";
	}
}

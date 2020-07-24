/*
 *@author Admin
 *@date May 13, 2020
*/
package com.devpro.java08blog.controller.admin;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entity.User;
import com.devpro.java08blog.service.UserService;

@Controller
public class ProfileController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/admin/profile" }, method = RequestMethod.GET)
	public String profile(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "admin/profile";
	}

	@RequestMapping(value = { "/save-user" }, method = RequestMethod.POST)
	public String saveProfile(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("user") User user,
			@RequestParam("userImage") MultipartFile userImage, Principal principal) {
		try {
			userService.addUser(user, userImage, principal.getName());
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		return "admin/profile";
	}
}

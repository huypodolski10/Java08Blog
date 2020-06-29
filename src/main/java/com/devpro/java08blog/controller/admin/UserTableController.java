/*
 *@author Admin
 *@date May 13, 2020
*/
package com.devpro.java08blog.controller.admin;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entities.Role;
import com.devpro.java08blog.entities.User;
import com.devpro.java08blog.repositories.RoleRepository;
import com.devpro.java08blog.repositories.UserRepository;
import com.devpro.java08blog.services.UserService;

@Controller
public class UserTableController {

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleRepository roleRepo;

	@GetMapping("/admin/user-table")
	public String showTable(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("users", userRepo.findByStatus(true));
		return "admin/user/user-table";
	}

	@GetMapping("/admin/add-user")
	public String addUserPage(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("user", new User());
		model.addAttribute("roles", roleRepo.findByStatus(true));
		return "admin/user/add-user";
	}

	@PostMapping("/admin/add-user")
	public String addUser(@ModelAttribute("user") User user, @RequestParam("userImage") MultipartFile userImage,
			final ModelMap model, HttpServletRequest request, HttpServletResponse response, Principal principal) {
		try {
			userService.addUser(user, userImage, principal.getName());
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		model.addAttribute("user", new User());
		model.addAttribute("roles", roleRepo.findByStatus(true));
		return "admin/user/add-user";
	}

	@GetMapping("/admin/update-user/{id}")
	public String updateUserPage(@PathVariable Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("user", userRepo.getOne(id));
		model.addAttribute("roles", roleRepo.findByStatus(true));
		return "admin/user/update-user";
	}

	@PostMapping("/admin/update-user")
	public String updateUser(@ModelAttribute("user") User user, @RequestParam("userImage") MultipartFile userImage,
			final ModelMap model, HttpServletRequest request, HttpServletResponse response, Principal principal) {
		try {
			userService.updateUser(user, userImage, principal.getName());
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		model.addAttribute("users", userRepo.findByStatus(true));
		return "admin/user/user-table";
	}
	
	@PostMapping("/admin/delete-user/{id}")
	public String deleteUser(@PathVariable Integer id, final ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		User removedUser = userRepo.getOne(id);
		List<Role> roles = removedUser.getRoles();
		for(Role role : roles) {
			role.removeUser(removedUser);
			if(roles.isEmpty()) break;
		}
		userRepo.delete(removedUser);

		model.addAttribute("users", userRepo.findByStatus(true));
		return "admin/user/user-table";
	}
}

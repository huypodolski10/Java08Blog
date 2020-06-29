/*
 *@author Admin
 *@date May 10, 2020
*/
package com.devpro.java08blog.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "adminHomeController")
public class HomeController {

	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "admin/index";
	}
}

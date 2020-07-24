/*
 *@author Admin
 *@date Feb 23, 2020
*/
package com.devpro.java08blog.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.devpro.java08blog.entity.Comment;
import com.devpro.java08blog.repository.CommentRepository;
import com.devpro.java08blog.repository.MotorbikeRepository;

@Controller
public class MotorDetailController {
	@Autowired private CommentRepository commentRepo;
	@Autowired private MotorbikeRepository motorbikeRepo;
	
	@GetMapping("/motor-detail/{id}")
	public String motorDetail(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("bike", motorbikeRepo.getOne(id));
		
		model.addAttribute("comment", new Comment());
		return "motor-detail";
	}
	
	@PostMapping("/add-comment")
	public String addComment(@ModelAttribute("comment") Comment comment, final ModelMap model) {
		comment.setCreatedDate(new Date());
		commentRepo.save(comment);
		return "motor-detail";
	}
}

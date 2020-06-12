/*
 *@author Admin
 *@date Feb 23, 2020
*/
package com.devpro.java08blog.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.devpro.java08blog.dto.ApiResponse;
import com.devpro.java08blog.entities.Comment;
import com.devpro.java08blog.entities.Motorbike;
import com.devpro.java08blog.repositories.CommentRepository;
import com.devpro.java08blog.repositories.MotorbikeRepository;

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
	
//	@PostMapping("/api/cart/add")
//	public ResponseEntity<ApiResponse> response(@RequestBody final Map<String, Object> data, final ModelMap model,
//			final HttpServletRequest request, final HttpServletResponse response) {
//		
//		Integer motorbikeID = (Integer) data.get("motorbikeID");
//		Motorbike motorbike = motorbikeRepo.getOne(motorbikeID);
//		addCart(motorbike, 1, request);
//		
//		return ResponseEntity.ok(new ApiResponse(200, "OK!"));
//	}
//
//	private void addCart(Motorbike motorbike, int i, HttpServletRequest request) {
//		
//	}
}

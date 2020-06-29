/*
 *@author Admin
 *@date May 17, 2020
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entities.Motorbike;
import com.devpro.java08blog.repositories.CategoryRepository;
import com.devpro.java08blog.repositories.MotorbikeRepository;
import com.devpro.java08blog.services.MotorbikeService;

@Controller
public class ProductTableController {
	@Autowired
	private MotorbikeRepository motorbikeRepo;
	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private MotorbikeService motorbikeService;

//	@PostMapping("/api/motorbike/save")
//	public ResponseEntity<ApiResponse> response(@RequestBody MotorbikeDto motorbikeDto, final ModelMap model,
//			final HttpServletRequest request, final HttpServletResponse response,
//			@RequestParam("motorbikeImages") MultipartFile motorbikeImages) {
//		Motorbike motorbike = new Motorbike();
//		BeanUtils.copyProperties(motorbikeDto, motorbike);
//		motorbike.setCategory(categoryRepo.getOne(motorbikeDto.getCategoryID()));
//		motorbike.setCreatedDate(new Date());
//		motorbike.setStatus(true);
//		try {
//			motorbikeService.saveMotorbike(motorbike, motorbikeImages);
//		} catch (RollbackException e) {
//			e.printStackTrace();
//		}
//		return ResponseEntity.ok(new ApiResponse(200, "OK!"));
//	}

	@RequestMapping(value = { "/admin/product-table" }, method = RequestMethod.GET)
	public String showTable(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {

		int pageNumber = 1;
		if (request.getParameter("page") != null) {
			pageNumber = Integer.valueOf(request.getParameter("page"));
			if (pageNumber < 1)
				pageNumber = 1;
		}

		List<Motorbike> motorbikes = motorbikeService.getAllMotorbikes(pageNumber);

		model.addAttribute("motorbikes", motorbikes);
		model.addAttribute("currentPage", pageNumber);
		return "admin/product/product-table";
	}

	@GetMapping("/admin/add-product")
	public String addProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("motorbike", new Motorbike());
		model.addAttribute("categories", categoryRepo.findByStatus(true));
		return "admin/product/add-product";
	}

	@GetMapping("/admin/update-product/{id}")
	public String updateProduct(@PathVariable Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("motorbike", motorbikeRepo.getOne(id));
		model.addAttribute("categories", categoryRepo.findByStatus(true));
		return "admin/product/update-product";
	}

	@PostMapping("/admin/add-product")
	public String addMotorbike(@ModelAttribute("motorbike") Motorbike motorbike,
			@RequestParam("motorbikeImage") MultipartFile motorbikeImage, final ModelMap model,
			HttpServletRequest request, HttpServletResponse response, Principal principal) {
		try {
			motorbikeService.addMotorbike(motorbike, motorbikeImage, principal.getName());
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		model.addAttribute("motorbike", new Motorbike());
		model.addAttribute("categories", categoryRepo.findByStatus(true));
		return "admin/product/add-product";
	}

	@PostMapping("/admin/update-product")
	public String updateMotorbike(@ModelAttribute("motorbike") Motorbike motorbike,
			@RequestParam("motorbikeImage") MultipartFile motorbikeImage, final ModelMap model,
			HttpServletRequest request, HttpServletResponse response, Principal principal) {
		try {
			motorbikeService.updateMotorbike(motorbike, motorbikeImage, principal.getName());
		} catch (RollbackException e) {
			e.printStackTrace();
		}

		int pageNumber = 1;
		if (request.getParameter("page") != null) {
			pageNumber = Integer.valueOf(request.getParameter("page"));
			if (pageNumber < 1)
				pageNumber = 1;
		}

		List<Motorbike> motorbikes = motorbikeService.getAllMotorbikes(pageNumber);

		model.addAttribute("motorbikes", motorbikes);
		model.addAttribute("currentPage", pageNumber);
		return "admin/product/product-table";
	}

	@PostMapping("/admin/delete-product/{id}")
	public String deleteProduct(@PathVariable Integer id, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {

		motorbikeRepo.delete(motorbikeRepo.getOne(id));

		int pageNumber = 1;
		if (request.getParameter("page") != null) {
			pageNumber = Integer.valueOf(request.getParameter("page"));
			if (pageNumber < 1)
				pageNumber = 1;
		}

		List<Motorbike> motorbikes = motorbikeService.getAllMotorbikes(pageNumber);

		model.addAttribute("motorbikes", motorbikes);
		model.addAttribute("currentPage", pageNumber);
		return "admin/product/product-table";
	}
}

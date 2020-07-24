/*
 *@author Admin
 *@date Jun 12, 2020
*/
package com.devpro.java08blog.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.devpro.java08blog.dto.ApiResponse;
import com.devpro.java08blog.dto.CartItem;
import com.devpro.java08blog.entity.Motorbike;
import com.devpro.java08blog.repository.MotorbikeRepository;

@Controller
public class CartController {

	@Autowired
	private MotorbikeRepository motorbikeRepo;

	@PostMapping("/cart/add")
	public ResponseEntity<ApiResponse> buyProduct(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {

		int motorbikeID = (int) data.get("motorbikeID");
		Motorbike motorbike = motorbikeRepo.getOne(motorbikeID);
		addCart(motorbike, 1, request);

		return ResponseEntity.ok(new ApiResponse(200, "Example"));
	}
	
	@PostMapping("/cart/remove")
	public ResponseEntity<ApiResponse> removeProduct(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		
		int motorbikeID = (int) data.get("motorbikeID");
		Motorbike motorbike = motorbikeRepo.getOne(motorbikeID);
		removeCart(motorbike, request);
		
		return ResponseEntity.ok(new ApiResponse(200, "Example"));
	}

	@GetMapping("/cart")
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "cart";
	}

	@SuppressWarnings("unchecked")
	private void addCart(Motorbike motorbike, int quantity, HttpServletRequest request) {
		// lấy đối tượng session trên server(lưu trong RAM)
		HttpSession httpSession = request.getSession();

		// b0: khởi tạo giỏ hàng(chứa danh sách các sản phẩm)
		List<CartItem> carts = new ArrayList<CartItem>();

		// b1: kiểm tra xem đã có giỏ hàng chưa ?
		if (httpSession.getAttribute("gio_hang_cua_ban") != null) {
			carts = (List<CartItem>) httpSession.getAttribute("gio_hang_cua_ban");
		} else {
			httpSession.setAttribute("gio_hang_cua_ban", carts);
		}

		// b2: bổ sung sản phẩm vào trong giỏ hàng(sẽ có trường hợp trong giỏ hàng đã có
		// sản phẩm đó rồi)
		boolean sanphamdaco = false;
		for (CartItem item : carts) {
			if (item.getMotorbikeID() == motorbike.getId()) { // sản phẩm đã có rồi.
				sanphamdaco = true;
				item.setQuantity(item.getQuantity() + 1);
			}
		}

		// b3: trường hợp sản phẩm chưa có
		if (sanphamdaco == false) {
			CartItem cartItem = new CartItem();
			cartItem.setMotorbikeID(motorbike.getId());
			cartItem.setName(motorbike.getBrand() + " " + motorbike.getName());
			cartItem.setPrice(motorbike.getPrice().add(motorbike.getRegistrationTax()).add(motorbike.getCivilInsurance()).add(motorbike.getLicenseFee()));
			cartItem.setQuantity(quantity);
			carts.add(cartItem);
		}

	}
	
	@SuppressWarnings("unchecked")
	private void removeCart(Motorbike motorbike,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		List<CartItem> carts = new ArrayList<CartItem>();
		carts = (List<CartItem>) httpSession.getAttribute("gio_hang_cua_ban");

		for(CartItem item : carts) {
			if(item.getMotorbikeID() == motorbike.getId()) {
				carts.remove(item);
			}
		}
	}
	
	@GetMapping("/cart/checkout")
	public String checkout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "checkout";
	}
}

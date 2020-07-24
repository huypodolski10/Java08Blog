/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.service;

import java.util.List;

import javax.transaction.RollbackException;

import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entity.Motorbike;

public interface MotorbikeService {
	void addMotorbike(final Motorbike motorbike, MultipartFile motorbikeImages, String currentUsername)
			throws RollbackException;

	List<Motorbike> getAllMotorbikes(int pageNumber);

	void updateMotorbike(Motorbike motorbike, MultipartFile motorbikeImage, String currentUsername)
			throws RollbackException;

	List<Motorbike> findByCategoryNameAndStatus(String categoryName, boolean status);
}

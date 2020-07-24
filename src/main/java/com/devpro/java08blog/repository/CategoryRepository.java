/*
 *@author Admin
 *@date Mar 7, 2020
*/
package com.devpro.java08blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	List<Category> findByStatus(boolean status);
}

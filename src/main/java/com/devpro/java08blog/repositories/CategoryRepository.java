/*
 *@author Admin
 *@date Mar 7, 2020
*/
package com.devpro.java08blog.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	List<Category> findByStatus(boolean status);
	Category findByName(String name);
}

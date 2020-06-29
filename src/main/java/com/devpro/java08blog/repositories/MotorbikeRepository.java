/*
 *@author Admin
 *@date Mar 4, 2020
*/
package com.devpro.java08blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.java08blog.entities.Category;
import com.devpro.java08blog.entities.Motorbike;
import java.lang.Integer;
import java.util.List;

@Repository
public interface MotorbikeRepository extends JpaRepository<Motorbike, Integer>{
	List<Motorbike> findByStatus(boolean status);
	List<Motorbike> findByCategoryAndStatus(Category category, boolean status);
}

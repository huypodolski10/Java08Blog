/*
 *@author Admin
 *@date Mar 4, 2020
*/
package com.devpro.java08blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.devpro.java08blog.entity.Motorbike;

import java.lang.Integer;
import java.util.List;

@Repository
public interface MotorbikeRepository extends JpaRepository<Motorbike, Integer> {
	List<Motorbike> findByStatus(boolean status);

	@Query("SELECT m FROM Motorbike m WHERE m.category.name = :categoryName AND m.status = :status")
	List<Motorbike> findByCategoryNameAndStatus(@Param("categoryName") String categoryName, @Param("status") boolean status);
	
	interface CustomObjectRespone{
		
	}
}

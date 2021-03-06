/*
 *@author Admin
 *@date Mar 6, 2020
*/
package com.devpro.java08blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entity.Attachment;
import com.devpro.java08blog.entity.Motorbike;
import com.devpro.java08blog.entity.User;

public interface AttachmentRepository extends JpaRepository<Attachment, Integer> {

//	@Query("SELECT a FROM Attachment a inner join Motorbike m on a.name like CONCAT('%', :name, '%') and a.motorbikeId = m.id and m.categoryId = :categoryId")
//	List<Attachment> findAttachmentByNameAndCategoryId(@Param("name") String name, @Param("categoryId") Integer categoryId);
	Attachment findByUser(User user);
	List<Attachment> findByMotorbike(Motorbike motorbike);
}

/*
 *@author Admin
 *@date Mar 7, 2020
*/
package com.devpro.java08blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer>{

}

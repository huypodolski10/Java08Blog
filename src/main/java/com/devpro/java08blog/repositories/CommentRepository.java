/*
 *@author Admin
 *@date Mar 7, 2020
*/
package com.devpro.java08blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entities.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer>{

}

/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	List<User> findByStatus(boolean status);
	User findByUsername(String username);
}

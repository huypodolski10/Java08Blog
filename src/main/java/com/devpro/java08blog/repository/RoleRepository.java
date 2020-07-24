/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{
	List<Role> findByStatus(boolean status);
}

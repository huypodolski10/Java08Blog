/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entities.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{
	List<Role> findByStatus(boolean status);
}

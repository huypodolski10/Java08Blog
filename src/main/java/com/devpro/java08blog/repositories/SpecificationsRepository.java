/*
 *@author Admin
 *@date Mar 14, 2020
*/
package com.devpro.java08blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entities.Specifications;

public interface SpecificationsRepository extends JpaRepository<Specifications, Integer> {

}

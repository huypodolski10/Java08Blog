/*
 *@author Admin
 *@date Jul 11, 2020
*/
package com.devpro.java08blog.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.devpro.java08blog.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategoryName() {
		String jpql = "SELECT c.name FROM Category c";
		Query query = entityManager.createQuery(jpql);

		List<String> categoryNameList = query.getResultList();
		return categoryNameList;
	}

}

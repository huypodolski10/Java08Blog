/*
 *@author Admin
 *@date May 20, 2020
*/
package com.devpro.java08blog.service;

import javax.transaction.RollbackException;

import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entity.Role;
import com.devpro.java08blog.entity.User;

public interface UserService {

	void addUser(User user, MultipartFile userImage, String currentUsername) throws RollbackException;

	void updateUser(User user, MultipartFile userImage, String currentUsername) throws RollbackException;

	void registerUser(User user, MultipartFile userImage, Role role) throws RollbackException;
}

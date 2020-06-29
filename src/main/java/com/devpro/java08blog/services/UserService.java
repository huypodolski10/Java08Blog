/*
 *@author Admin
 *@date May 20, 2020
*/
package com.devpro.java08blog.services;

import java.io.File;
import java.util.Date;

import javax.transaction.RollbackException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entities.Attachment;
import com.devpro.java08blog.entities.Role;
import com.devpro.java08blog.entities.User;
import com.devpro.java08blog.repositories.AttachmentRepository;
import com.devpro.java08blog.repositories.UserRepository;

@Service
public class UserService {

	@Autowired private UserRepository userRepo;
	@Autowired private AttachmentRepository attachmentRepo;
	@Value("${attachment.path}") private String attachmentPath;

	@Transactional(rollbackOn = RollbackException.class)
	public void addUser(User user, MultipartFile userImage, String currentUsername) throws RollbackException {
		User currentUser = userRepo.findByUsername(currentUsername);
		user.setCreator(currentUser);
		user.setCreatedDate(new Date());
		user.setStatus(true);
		try {
			User userSaved = userRepo.save(user);

			if (userImage != null && userImage.getSize() > 0) {
				userImage.transferTo(new File(attachmentPath + userImage.getOriginalFilename()));
				Attachment attachment = new Attachment();
				attachment.setName(userImage.getOriginalFilename());
				attachment.setMime(userImage.getContentType());
				attachment.setUser(userSaved);
				attachment.setCreator(currentUser);
				attachment.setPath(attachmentPath + userImage.getOriginalFilename());
				attachment.setCreatedDate(new Date());
				attachment.setStatus(true);

				attachmentRepo.save(attachment);
			}
		} catch (Exception e) {
			throw new RollbackException(e.getMessage());
		}
	}
	
	@Transactional(rollbackOn = RollbackException.class)
	public void updateUser(User user, MultipartFile userImage, String currentUsername) throws RollbackException {
		try {
			User currentUser = userRepo.findByUsername(currentUsername);
			User savedUser = userRepo.getOne(user.getId());
			user.setCreatedDate(savedUser.getCreatedDate());
			user.setCreator(savedUser.getCreator());
			user.setStatus(savedUser.isStatus());
			user.setUpdatedDate(new Date());
			user.setUpdator(currentUser);
			userRepo.save(user);

			if (userImage != null && userImage.getSize() > 0) {
				userImage.transferTo(new File(attachmentPath + userImage.getOriginalFilename()));
				Attachment attachment = attachmentRepo.findByUser(user);
				attachment.setName(userImage.getOriginalFilename());
				attachment.setMime(userImage.getContentType());
				attachment.setUser(user);
				attachment.setPath(attachmentPath + userImage.getOriginalFilename());
				if(attachment.getCreatedDate() == null) {
					attachment.setCreatedDate(new Date());
					attachment.setCreator(currentUser);
				} else {
					attachment.setUpdatedDate(new Date());
					attachment.setUpdator(currentUser);
				}
				
				attachmentRepo.save(attachment);
			}
		} catch (Exception e) {
			throw new RollbackException(e.getMessage());
		}
	}
	
	@Transactional(rollbackOn = RollbackException.class)
	public void registerUser(User user, MultipartFile userImage, Role role) throws RollbackException {
		user.addRole(role);
		user.setStatus(true);
		try {
			User userSaved = userRepo.save(user);

			if (userImage != null && userImage.getSize() > 0) {
				userImage.transferTo(new File(attachmentPath + userImage.getOriginalFilename()));
				Attachment attachment = new Attachment();
				attachment.setName(userImage.getOriginalFilename());
				attachment.setMime(userImage.getContentType());
				attachment.setUser(userSaved);
				attachment.setPath(attachmentPath + userImage.getOriginalFilename());
				attachment.setCreatedDate(new Date());
				attachment.setStatus(true);

				attachmentRepo.save(attachment);
			}
		} catch (Exception e) {
			throw new RollbackException(e.getMessage());
		}
	}
}

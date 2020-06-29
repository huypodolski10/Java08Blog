/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.services;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.RollbackException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.java08blog.entities.Attachment;
import com.devpro.java08blog.entities.Category;
import com.devpro.java08blog.entities.Motorbike;
import com.devpro.java08blog.entities.User;
import com.devpro.java08blog.repositories.AttachmentRepository;
import com.devpro.java08blog.repositories.MotorbikeRepository;
import com.devpro.java08blog.repositories.UserRepository;

@Service
public class MotorbikeService {

	@Autowired
	private MotorbikeRepository motorbikeRepo;

	@Autowired
	private AttachmentRepository attachmentRepo;

	@Autowired
	private UserRepository userRepo;

	@PersistenceContext
	private EntityManager entityManager;

	@Value("${attachment.path}")
	private String attachmentPath;

	private static Integer LIMIT = 9;

	@Transactional(rollbackOn = RollbackException.class)
	public void addMotorbike(final Motorbike motorbike, MultipartFile motorbikeImages, String currentUsername)
			throws RollbackException {
		try {
			User currentUser = userRepo.findByUsername(currentUsername);
			motorbike.setCreator(currentUser);
			motorbike.setCreatedDate(new Date());
			motorbike.setStatus(true);
			Motorbike motorbikeSaved = motorbikeRepo.save(motorbike);

			if (motorbikeImages != null && motorbikeImages.getSize() > 0) {
				motorbikeImages.transferTo(new File(attachmentPath + motorbikeImages.getOriginalFilename()));
				Attachment attachment = new Attachment();
				attachment.setName(motorbikeImages.getOriginalFilename());
				attachment.setMime(motorbikeImages.getContentType());
				attachment.setPath(attachmentPath + motorbikeImages.getOriginalFilename());
				attachment.setMotorbike(motorbikeSaved);
				attachment.setCreator(currentUser);
				attachment.setThumbnail(true);
				attachment.setCreatedDate(new Date());
				attachment.setStatus(true);

				attachmentRepo.save(attachment);
			}
		} catch (Exception e) {
			throw new RollbackException(e.getMessage());
		}
	}

	public List<Motorbike> getAllMotorbikes(int pageNumber) {
		String jpql = "FROM Motorbike m";
		Query query = entityManager.createQuery(jpql, Motorbike.class);

		query.setFirstResult((pageNumber - 1) * LIMIT);
		query.setMaxResults(LIMIT);

		List<Motorbike> motorbikes = query.getResultList();
		return motorbikes;
	}
	
	public List<Motorbike> getAllSpecificBikes(Category category, int pageNumber) {
		String jpql = "FROM Motorbike m WHERE m.category = :category";
		Query query = entityManager.createQuery(jpql, Motorbike.class);
		query.setParameter("category", category);

		query.setFirstResult((pageNumber - 1) * LIMIT);
		query.setMaxResults(LIMIT);

		List<Motorbike> motorbikes = query.getResultList();
		return motorbikes;
	}
	
	@Transactional(rollbackOn = RollbackException.class)
	public void updateMotorbike(Motorbike motorbike, MultipartFile motorbikeImage, String currentUsername) throws RollbackException {
		try {
			User currentUser = userRepo.findByUsername(currentUsername);
			Motorbike savedMotorbike = motorbikeRepo.getOne(motorbike.getId());
			motorbike.setCreatedDate(savedMotorbike.getCreatedDate());
			motorbike.setCreator(savedMotorbike.getCreator());
			motorbike.setStatus(savedMotorbike.isStatus());
			motorbike.setUpdatedDate(new Date());
			motorbike.setUpdator(currentUser);
			motorbikeRepo.save(motorbike);

			if (motorbikeImage != null && motorbikeImage.getSize() > 0) {
				motorbikeImage.transferTo(new File(attachmentPath + motorbikeImage.getOriginalFilename()));
				List<Attachment> attachments = attachmentRepo.findByMotorbike(motorbike);
				Attachment attachment;
				if(attachments.isEmpty()) {
					attachment = new Attachment();
					attachment.setStatus(true);
				} else {
					attachment = attachments.get(0);
				}
				attachment.setName(motorbikeImage.getOriginalFilename());
				attachment.setMime(motorbikeImage.getContentType());
				attachment.setMotorbike(motorbike);
				attachment.setPath(attachmentPath + motorbikeImage.getOriginalFilename());
				if (attachment.getCreatedDate() == null) {
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
}

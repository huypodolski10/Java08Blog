/*
 *@author Admin
 *@date Mar 6, 2020
*/
package com.devpro.java08blog.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tblattachment")
public class Attachment extends BaseEntity {

	@Column(name = "name", length = 100, nullable = false)
	private String name;

	@Column(name = "mime", length = 100, nullable = false)
	private String mime;

	@Column(name = "path", length = 100)
	private String path;

	@Column(name = "thumbnail")
	private Boolean thumbnail;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "motorbike_id")
	private Motorbike motorbike;

	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMime() {
		return mime;
	}

	public void setMime(String mime) {
		this.mime = mime;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Motorbike getMotorbike() {
		return motorbike;
	}

	public void setMotorbike(Motorbike motorbike) {
		this.motorbike = motorbike;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Boolean getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(Boolean thumbnail) {
		this.thumbnail = thumbnail;
	}
}

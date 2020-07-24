/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tblrole")
public class Role extends BaseEntity {

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	
	@ManyToMany(mappedBy = "roles", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<User> users = new ArrayList<>();
	
	public void addUser(User user) {
        this.users.add(user);
        user.getRoles().add(this);
    }
  
    public void removeUser(User user) {
        this.users.remove(user);
        user.getRoles().remove(this);
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
}

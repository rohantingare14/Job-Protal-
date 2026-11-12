package com.jsp.ojpms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class SavedJob {
	
	

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    @ManyToOne
	    private User user;

	    @ManyToOne
	    private Job job;

	    public int getId() {
	        return id;
	    }

	    public User getUser() {
	        return user;
	    }

	    public void setUser(User user) {
	        this.user = user;
	    }

	    public Job getJob() {
	        return job;
	    }

	    public void setJob(Job job) {
	        this.job = job;
	    }
	}

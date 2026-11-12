package com.jsp.ojpms.dao;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class JobDao {

	public static void saveJob(Job job) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(job);
		et.commit();
	}
	

	public static List<Job> getAllJobs() {
			EntityManager em = JPAUtil.getEm();
			Query query = em.createQuery("FROM Job");
			List<Job> list = query.getResultList();
			return list;
	}
	
	public static List<Job> getAllJobs(String search){
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job WHERE title LIKE ?1 OR location Like ?1  ");
		query.setParameter(1, "%" +search+"%");
		List list=query.getResultList();
		return list;
	}
	
	public static List<Job> getJobsByRecruiter(int recruiterId) {
	    EntityManager em = JPAUtil.getEm();
	    Query query = em.createQuery(
	            "FROM Job WHERE recuriter.id = ?1");
	    query.setParameter(1, recruiterId);
	    List<Job> list = query.getResultList();
	    return list;
	}
	
	public static Job fetchJobById(int id) {
		EntityManager em = JPAUtil.getEm();
		return em.find(Job.class, id);
	}
	
	public static void updateJob(Job job) {
		EntityManager em =
				JPAUtil.getEm();
		EntityTransaction et =
				em.getTransaction();
		et.begin();
		em.merge(job);
		et.commit();
	}
	
	public static void deleteJob(int id) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Query query =em.createQuery("DELETE FROM Application a WHERE a.job.id=?1");
		query.setParameter(1, id);
		query.executeUpdate();
		Query q2 = em.createQuery("DELETE FROM Job  WHERE id=?1");
			q2.setParameter(1, id);
			q2.executeUpdate();
		et.commit();
	}
}

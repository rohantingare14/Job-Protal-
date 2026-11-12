package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicationDao {

	public static void saveApplication(Application application) {
		EntityManager em=JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(application);
		et.commit();
	}
	
	public static boolean isAlreadyApplid(int uId,int jobId) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2 ");
		query.setParameter(1, uId);
		query.setParameter(2, jobId);
		List list = query.getResultList();
		boolean empty = list.isEmpty();
		System.out.println("empty:" +empty);
		return  !list.isEmpty();
	}

	public static List<Application> getApplicationsByUser(int userId) {
	    EntityManager em = JPAUtil.getEm();
	    Query query =
	            em.createQuery(
	            "FROM Application WHERE user.id=?1");
	    query.setParameter(1, userId);
	    return query.getResultList();
	}
	
	public static List<Application> getApplicationsByJob(int jobId) {
	    EntityManager em = JPAUtil.getEm();
	    Query query =
	            em.createQuery(
	            "FROM Application WHERE job.id=?1");
	    query.setParameter(1, jobId);
	    return query.getResultList();
	}
	
	public static Application getApplication(int userId,int jobId){
	    EntityManager em = JPAUtil.getEm();
	    Query q = em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2");
	    q.setParameter(1, userId);
	    q.setParameter(2, jobId);
	    List<Application> list = q.getResultList();
	    return list.get(0);
	}
	
	public static void updateApplication(Application app){
	    EntityManager em = JPAUtil.getEm();
	    EntityTransaction et =em.getTransaction();
	    et.begin();
	    em.merge(app);
	    et.commit();
	}
	
	public static List<Application> getShortlistedCandidates(){
	    EntityManager em = JPAUtil.getEm();
	    Query q = em.createQuery("FROM Application WHERE status='SHORTLISTED'");
	    return q.getResultList();
	}
	
	public static List<Application> getRejectedCandidates(){
	    EntityManager em = JPAUtil.getEm();
	    Query q = em.createQuery("FROM Application WHERE status='REJECTED'");
	    return q.getResultList();
	}
	
}

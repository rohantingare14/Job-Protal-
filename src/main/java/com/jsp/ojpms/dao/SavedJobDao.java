package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.util.JPAUtil;

public class SavedJobDao {

    public static void saveJob(SavedJob savedJob) {
        EntityManager em = JPAUtil.getEm();
        EntityTransaction et = em.getTransaction();

        et.begin();
        em.persist(savedJob);
        et.commit();
    }

    public static boolean isAlreadySaved(int userId,int jobId) {

        EntityManager em = JPAUtil.getEm();

        Query q = em.createQuery(
                "FROM SavedJob WHERE user.id=?1 AND job.id=?2");

        q.setParameter(1, userId);
        q.setParameter(2, jobId);

        return !q.getResultList().isEmpty();
    }

    public static List<SavedJob> getSavedJobsByUser(int userId) {

        EntityManager em = JPAUtil.getEm();

        Query q = em.createQuery(
                "FROM SavedJob WHERE user.id=?1");

        q.setParameter(1, userId);

        return q.getResultList();
    }
}

package com.project.mvcjspdemo.config;

import org.hibernate.Session;

public class DAOImpl extends AbstractHibernateDAO implements DAO {

    public DAOImpl() {

    }

    public Session getSesstion() {
        Session currentSession = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
        return currentSession;
    }

    public Session openSesstion() {
        Session currentSession = this.getHibernateTemplate().getSessionFactory().openSession();
        return currentSession;
    }
}

package com.project.mvcjspdemo.config;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

public abstract class AbstractHibernateDAO extends HibernateDaoSupport implements BaseDAO {

    public AbstractHibernateDAO() {

    }

    public void delete(Object obj) {
        this.getHibernateTemplate().delete(obj);
    }

    public void deleteAll(Collection collection) {
        this.getHibernateTemplate().deleteAll(collection);
    }

    public Serializable save(Object obj) {
        Serializable generatedId = this.getHibernateTemplate().save(obj);
        this.getHibernateTemplate().flush();
        return generatedId;
    }

    public void saveOrUpdate(Object obj) {
        this.getHibernateTemplate().saveOrUpdate(obj);
        this.flush();
    }

    public void merge(Object obj) {
        this.getHibernateTemplate().merge(obj);
        this.getHibernateTemplate().flush();
    }

    public void refresh(Object obj) {
        this.getHibernateTemplate().refresh(obj);
    }

    public void saveOrUpdateAll(Collection<? extends AbstractBaseDomain> collection) {
        collection.stream().forEach((clazz) -> this.getHibernateTemplate().saveOrUpdate(clazz));
    }

    public Object find(Class clazz, Serializable id) {
        return this.getHibernateTemplate().get(clazz, id);
    }

    public Object load(Class clazz, Serializable id) {
        return this.getHibernateTemplate().load(clazz, id);
    }

    public <T> List<T> findBy(String hsql) {
        return (List<T>) this.getHibernateTemplate().find(hsql, new Object[0]);
    }

    protected List<? extends AbstractBaseDomain> findByCriteria(DetachedCriteria criteria, int firstResult, int maxResults) {
        return (List<? extends AbstractBaseDomain>) this.getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
    }

    protected <T> List<T> findByCriteria(DetachedCriteria criteria) {
        return (List<T>) this.getHibernateTemplate().findByCriteria(criteria);
    }

    public <T> List<T> findAll(Class clazz) {
        return (List<T>) this.getHibernateTemplate().find("from " + clazz.getName(), new Object[0]);
    }

    public void flush() {
        this.getHibernateTemplate().flush();
    }

    public void evict(Object obj) {
        this.getHibernateTemplate().evict(obj);
    }

    public <T> T get(Class<T> clazz, Serializable id) {
        return (T)clazz.cast(this.getHibernateTemplate().get(clazz, id));
    }

}

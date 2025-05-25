package com.project.mvcjspdemo.config;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

public interface BaseDAO {

    void delete(Object var1);

    void deleteAll(Collection var1);

    Serializable save(Object var1);

    void saveOrUpdate(Object var1);

    void saveOrUpdateAll(Collection<? extends AbstractBaseDomain> var1);

    void merge(Object var1);

    void evict(Object var1);

    Object find(Class var1, Serializable var2);

    <T> List<T> findAll(Class var1);

    <T> List<T> findBy(String var1);

    Object load(Class var1, Serializable var2);

    void flush();

    void refresh(Object var1);

    <T> T get(Class<T> var1, Serializable var2);

}

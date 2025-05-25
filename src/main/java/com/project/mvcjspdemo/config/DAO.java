package com.project.mvcjspdemo.config;

import org.hibernate.Session;

public interface DAO extends BaseDAO {

    Session getSesstion();

    Session openSesstion();

}

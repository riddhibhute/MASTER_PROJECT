package com.project.mvcjspdemo.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
public class DBConfig {

    // Injecting properties from application.properties or .env
    @Value("${jdbc.dbUrl}")
    private String dbUrl;

    @Value("${jdbc.dbUser}")
    private String dbUser;

    @Value("${jdbc.dbPassword}")
    private String dbPassword;

    @Bean
    public DAOImpl dao() throws IOException {
        DAOImpl dao = new DAOImpl();
        dao.setSessionFactory(mainSessionFactory());
        return dao;
    }

    // 1. DataSource Bean (DBCP2)
    @Bean(name = "dataSource", destroyMethod = "close")
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl(dbUrl);
        dataSource.setUsername(dbUser);
        dataSource.setPassword(dbPassword);

        dataSource.setInitialSize(12);
        dataSource.setMaxTotal(40);
        dataSource.setMaxIdle(30);
        dataSource.setMinIdle(12);

        return dataSource;
    }

    // 2. Hibernate SessionFactory Bean
    @Bean(name = "mainSessionFactory")
    public SessionFactory mainSessionFactory() throws IOException {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());

        sessionFactory.setPackagesToScan("com.project.mvcjspdemo.entity");

        // Or set hibernate properties directly
        Properties hibernateProps = new Properties();
        hibernateProps.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hibernateProps.put("hibernate.show_sql", "false");

        sessionFactory.setHibernateProperties(hibernateProps);
        return (SessionFactory) sessionFactory;
    }

    // 3. Hibernate Transaction Manager
    @Bean(name = "txManager")
    public HibernateTransactionManager transactionManager(SessionFactory mainSessionFactory) {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(mainSessionFactory);
        txManager.setDataSource(dataSource());
        return txManager;
    }

}

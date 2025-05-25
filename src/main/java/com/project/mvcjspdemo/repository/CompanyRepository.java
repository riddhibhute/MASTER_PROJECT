package com.project.mvcjspdemo.repository;

import com.project.mvcjspdemo.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<Company, Long> {
}
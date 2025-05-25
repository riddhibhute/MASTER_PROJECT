package com.project.mvcjspdemo.service;

import com.project.mvcjspdemo.entity.Company;
import com.project.mvcjspdemo.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InitialService {


    @Autowired
    private CompanyRepository companyRepository;

    public void saveUser(Company company) {
        companyRepository.save(company);
    }
}

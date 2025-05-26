package com.project.mvcjspdemo.rest;

import com.project.mvcjspdemo.entity.Company;

import java.util.List;

public interface CompanyService {
    Company saveCompany(Company company);
    List<Company> getAllCompanies();
    Company getCompanyById(Long id);
    void deleteCompany(Long id);
}

package com.project.mvcjspdemo.rest;

import com.project.mvcjspdemo.entity.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class CompanyImpl implements ICompany {

    @Autowired
    private CompanyService companyService;

    @Override
    public ResponseEntity<Company> saveCompany(Company company) {
        Company saved = companyService.saveCompany(company);
        return ResponseEntity.ok(saved);
    }

    @Override
    public ResponseEntity<List<Company>> getAllCompanies() {
        return ResponseEntity.ok(companyService.getAllCompanies());
    }

    @Override
    public ResponseEntity<Company> getCompanyById(Long id) {
        return ResponseEntity.ok(companyService.getCompanyById(id));
    }

    @Override
    public ResponseEntity<Void> deleteCompany(Long id) {
        companyService.deleteCompany(id);
        return ResponseEntity.noContent().build();
    }
}
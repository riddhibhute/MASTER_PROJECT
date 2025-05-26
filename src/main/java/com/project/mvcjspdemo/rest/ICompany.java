package com.project.mvcjspdemo.rest;

import com.project.mvcjspdemo.entity.Company;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

        import java.util.List;

@RequestMapping("/api/companies")
public interface ICompany {

    @PostMapping
    ResponseEntity<Company> saveCompany(@RequestBody Company company);

    @GetMapping
    ResponseEntity<List<Company>> getAllCompanies();

    @GetMapping("/{id}")
    ResponseEntity<Company> getCompanyById(@PathVariable Long id);

    @DeleteMapping("/{id}")
    ResponseEntity<Void> deleteCompany(@PathVariable Long id);
}

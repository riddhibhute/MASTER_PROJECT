package com.project.mvcjspdemo.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Setter
@Getter

public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long company_id;

    private String companyName;

    private String country;

    private String state;

    private String address;

    private String pincode;


    private String phone_no;

    private String email;

    private String admin_name;

    private String identity_proof_no;

    private String photo_file_path;

}

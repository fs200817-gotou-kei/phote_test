package com.example.demo.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "worksites")
@Data
public class WorkSite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "sub_name")
    private String subName;

    @Column(name = "type")
    private String type;

    @Column(name = "staff_name")
    private String staffName;

    @Column(name = "photo")
    private String photo;

    @Column(name = "address")
    private String address;

    @Column(name = "status")
    private String status;

    @Column(name = "start_at")
    private Date startAt;

    @Column(name = "end_at")
    private Date endAt;

    @Column(name = "created_at")
    private Date createdAt;

    @Column(name = "updated_at")
    private Date updatedAt;
}

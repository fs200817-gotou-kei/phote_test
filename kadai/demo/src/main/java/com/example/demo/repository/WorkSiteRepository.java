package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.models.WorkSite;

public interface WorkSiteRepository extends JpaRepository<WorkSite, Long> {

}

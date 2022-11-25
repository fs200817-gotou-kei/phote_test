package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.models.WorkSite;
import com.example.demo.repository.WorkSiteRepository;

@Service
public class WorkSiteService {

    @Autowired
    private WorkSiteRepository repository;

    public ResponseEntity<List<WorkSite>> getAllWorkSite() {
        return ResponseEntity.ok(this.repository.findAll());
    }

    public ResponseEntity<WorkSite> getWorkSiteById(Long id) {
        return ResponseEntity.ok(this.repository.findById(id).orElseThrow());
    }

    public void deleteWorkSiteById(Long id) {
        this.repository.deleteById(id);
    }

    public void createWorkSiteById(WorkSite worksite) {
        this.repository.save(worksite);
    }

    public void updateWorkSite(WorkSite workSite) {
        this.repository.save(workSite);
    }
}

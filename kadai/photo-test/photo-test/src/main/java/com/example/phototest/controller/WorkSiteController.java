package com.example.phototest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.phototest.model.WorkSite;
import com.example.phototest.repository.WorkSiteRepository;

@CrossOrigin(origins = "http://localhost:8081")
@RestController
@RequestMapping("")
public class WorkSiteController {

    @Autowired
    private WorkSiteRepository workSiteRepository;

    @GetMapping("/{id}")
    public byte[] getWorkSiteById(@PathVariable long id) {
        WorkSite worksite = this.workSiteRepository.findById(id).orElseThrow();
        System.out.println(worksite.getPhoto());
        System.out.println(worksite.getPhoto().getClass().getSimpleName());
        System.out.println(worksite.getId());
        return worksite.getPhoto();
    }

    @PostMapping("")
    public void createWorkSite(@RequestBody WorkSite worksite) {
        this.workSiteRepository.save(worksite);
    }
}

package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.models.WorkSite;
import com.example.demo.service.WorkSiteService;

@CrossOrigin(origins = "http://localhost:8081")
@RestController
@RequestMapping("")
public class WorkSiteController {
    @Autowired
    private WorkSiteService workSiteService;

    @GetMapping("")
    public List<WorkSite> getAllWorkSite() {
        List<WorkSite> workSites = this.workSiteService.getAllWorkSite()
                .getBody();
        System.out.println("getAllWorkSites");
        return workSites;
    }

    @GetMapping("/{id}")
    public WorkSite getWorkSiteById(@PathVariable Long id) {
        return this.workSiteService.getWorkSiteById(id).getBody();
    }

    @PostMapping("")
    public void createWorkSiteById(@RequestBody WorkSite worksite) {
        System.out.println("createWorkSites");
        this.workSiteService.createWorkSiteById(worksite);
    }

    @PutMapping("")
    public void updateWorkSite(@RequestBody WorkSite workSite) {
        System.out.println("update");
        this.workSiteService.updateWorkSite(workSite);
    }

    @DeleteMapping("/{id}")
    public void deleteWorkSiteById(@PathVariable Long id) {
        this.workSiteService.deleteWorkSiteById(id);
    }
}

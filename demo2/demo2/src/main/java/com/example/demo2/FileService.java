package com.example.demo2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {

    @Autowired
    FileRepository repository;

    public File findFileById(Long id) {
        return repository.findById(id).orElseThrow();
    }

}
package com.example.demo2;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DownloadController {

    @Autowired
    FileService fileService;

    @RequestMapping("/download/{id}")
    @ResponseBody
    public ResponseEntity<byte[]> download(@PathVariable Long id) {
        File pdf = fileService.findFileById(id);
        byte[] data = pdf.getPhoto();
        // ResponseHeader
        HttpHeaders header = new HttpHeaders();
        header.add("Content-Type", "application/jpg");
        try {
            header.add("Content-Disposition",
                    "attachment; filename*=utf-8''" + URLEncoder.encode("kei.jpg", "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<byte[]>(data, header, HttpStatus.OK);
    }
}
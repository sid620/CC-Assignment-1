package com.example.springboot.controller;

import com.example.springboot.service.HadoopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HadoopController {

    @Autowired
    private HadoopService service;

    @GetMapping("/build/")
    public long buildHadoop()
    {
        return service.buildIndex();
    }
}

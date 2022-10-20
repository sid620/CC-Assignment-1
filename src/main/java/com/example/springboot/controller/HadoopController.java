package com.example.springboot.controller;

import com.example.springboot.Models.WordResponse;
import com.example.springboot.service.HadoopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class HadoopController {

    @Autowired
    private HadoopService service;

    @GetMapping("/build/")
    public long buildHadoop()
    {
        return service.buildIndex();
    }

    @GetMapping("/search_word/{word}")
    public Map<String, List<WordResponse.WordEntry>> searchWord(@PathVariable String word)
    {
        return service.search_word(word).Response;
    }
}

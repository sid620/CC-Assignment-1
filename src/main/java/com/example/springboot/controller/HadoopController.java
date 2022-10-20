package com.example.springboot.controller;

import com.example.springboot.Models.PhraseResponse;
import com.example.springboot.Models.WordResponse;
import com.example.springboot.service.HadoopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class HadoopController {

    private static class PhraseInput
    {
        public String Type;
        public List<String> Args;
    }
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

    @GetMapping("/positive_check/")
    public Map<Long, String> positiveCheck() {
        var hadoopResponse = service.positive_check();
        Map<Long, String> userResponse = new HashMap<>();

        for (var res: hadoopResponse.entrySet())
            userResponse.put(res.getValue(), res.getKey());

        return userResponse;
    }

    @GetMapping("/search_phrase/")
    public Map<String, List<PhraseResponse.PhraseEntry>> searchPhrase(
            @RequestBody PhraseInput input)
    {
        if (!input.Type.equalsIgnoreCase("and") && !input.Type.equalsIgnoreCase("or"))
            return new HashMap<>();

        return service.search_phrase(
                input.Type.equalsIgnoreCase("and") ?
                        HadoopService.PhraseInputType.AND :
                        HadoopService.PhraseInputType.OR,
                input.Args).Response;
    }
}

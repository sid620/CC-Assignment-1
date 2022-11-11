package com.example.demo.controller;

import com.example.demo.models.PhraseResponse;
import com.example.demo.models.PositiveValueResponse;
import com.example.demo.models.WordResponse;
import com.example.demo.service.SparkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class SparkController {
    private static class PhraseInput
    {
        public String Type;
        public List<String> Args;
    }
    @Autowired
    private SparkService sparkService;
    @GetMapping("/build/spark")
    public long buildSpark(){
//        if(word.toLowerCase().equals("spark"))
            return sparkService.buildIndex();

    }
    @GetMapping("/search_word/spark/{word}")
//    public void search_word(@PathVariable String word)
    public Map<String, List<WordResponse.WordEntry>> searchWord(@PathVariable String word)
    {
        return sparkService.search_word(word).Response;
    }
    @GetMapping("/positive_check/spark")
    public Map<Long, List<PositiveValueResponse.PositiveValueEntry>> positiveCheck() {
        Map<String, Long> sparkResponse = sparkService.positive_check();
        TreeMap<Long, String> response = new TreeMap<Long, String>(Collections.reverseOrder());
        PositiveValueResponse userResponse = new PositiveValueResponse();
        for (Map.Entry<String, Long> res: sparkResponse.entrySet())
            response.put(res.getValue(), res.getKey());
        Long rank = Long.valueOf(0);
        Long prev = Long.valueOf(-1);
        for(Map.Entry<Long,String> res: response.entrySet()) {
            if(prev!=res.getKey())rank = rank + 1;
            userResponse.AddEntry(rank,new PositiveValueResponse.PositiveValueEntry(res.getValue(),res.getKey()));
        }
        return userResponse.Response;
    }
    @GetMapping("/search_phrase/spark/")
    public Map<String, List<PhraseResponse.PhraseEntry>> searchPhrase(
            @RequestBody PhraseInput input)
    {
        if (!input.Type.equalsIgnoreCase("and") && !input.Type.equalsIgnoreCase("or"))
            return new HashMap<>();

        return sparkService.search_phrase(
                input.Type.equalsIgnoreCase("and") ?
                        SparkService.PhraseInputType.AND :
                        SparkService.PhraseInputType.OR,
                input.Args).Response;
    }
}

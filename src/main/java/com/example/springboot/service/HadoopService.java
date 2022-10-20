package com.example.springboot.service;

import com.example.springboot.Models.WordResponse;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.Instant;


@Service
public class HadoopService {
    public long buildIndex()
    {
        var d1 = Instant.now();
        for (int i = 0; i < 1500; ++i)
            System.out.println("");
        var d2 = Instant.now();
        return Duration.between(d1, d2).toMillis();
    }

    public WordResponse search_word(String word)
    {
        var item1 = new WordResponse.WordEntry(1, 1, "abc");
        var item2 = new WordResponse.WordEntry(2, 2, word);
        var response = new WordResponse();
        response.AddEntry("f1.txt",item1);
        response.AddEntry("f2.txt",item2);
        return response;
    }
}

package com.example.springboot.service;

import com.example.springboot.Models.PhraseResponse;
import com.example.springboot.Models.WordResponse;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class HadoopService {

    public enum PhraseInputType
    {
        AND,
        OR
    }

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
        return new WordResponse() {
            {
                AddEntry("f1.txt", item1);
                AddEntry("f2.txt", item2);
            }
        };
    }

    public PhraseResponse search_phrase(PhraseInputType pit, List<String> words)
    {
        var item1 = new PhraseResponse.PhraseEntry(1, new ArrayList<Integer>(){{add(1);add(2);}}, "abcd");
        var item2 = new PhraseResponse.PhraseEntry(16, new ArrayList<Integer>(){{add(3);add(4);}}, "153");

        return new PhraseResponse() {
            {
                AddEntry("f1.txt", item1);
                AddEntry("f2.txt", item2);
            }
        };
    }

    public Map<String, Long> positive_check(){
        return new HashMap<String, Long>() {{
            put("f1.txt", 5L);
            put("f2.txt", 20L);
        }};
    }
}

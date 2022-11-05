package com.example.springboot.service;

import com.example.springboot.HadoopExecuter;
import com.example.springboot.Models.PhraseResponse;
import com.example.springboot.Models.WordResponse;
import com.example.springboot.PropertiesCache;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service
public class HadoopService {

    public enum PhraseInputType
    {
        AND,
        OR
    }

    public long buildIndex()
    {
        var propertiesCache = PropertiesCache.getInstance();
        var executor = new HadoopExecuter(
                propertiesCache.getProperty("InvertedIndexLoc"),
                propertiesCache.getProperty("InvertedIndexClass"),
                propertiesCache.getProperty("InputFiles"),
                propertiesCache.getProperty("IndexFiles")
        );

        try
        {
            executor.execute();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        return executor.getExecutionTime();
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

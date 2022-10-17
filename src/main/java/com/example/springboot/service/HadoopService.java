package com.example.springboot.service;

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
}

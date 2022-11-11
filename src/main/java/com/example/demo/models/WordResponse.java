package com.example.demo.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WordResponse {
    public static class WordEntry {
        public int LineNo;
        public int LinePos;
        public String LineText;

        public WordEntry(int lineNo, int linePos, String lineText) {
            LineNo = lineNo;
            LinePos = linePos;
            LineText = lineText;
        }
    }

    public Map<String, List<WordEntry>> Response;

    public WordResponse() {
        Response = new HashMap<>();
    }

    public void AddEntry(String fileName, WordEntry entry) {
        if (!Response.containsKey(fileName))
            Response.put(fileName,new ArrayList<>());
        Response.get(fileName).add(entry);
    }
}

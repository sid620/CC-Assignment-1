package com.example.demo.models;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PhraseResponse {
    public static class PhraseEntry {
        public int LineNo;
        public List<Integer> LinePos;
        public String LineText;

        public PhraseEntry(int lineNo, List<Integer> linePos, String lineText) {
            LineNo = lineNo;
            LinePos = linePos;
            LineText = lineText;
        }
    }

    public Map<String, List<PhraseEntry>> Response;

    public PhraseResponse() {
        Response = new HashMap<>();
    }

    public void AddEntry(String fileName, PhraseEntry entry) {
        if (!Response.containsKey(fileName))
            Response.put(fileName,new ArrayList<>());
        Response.get(fileName).add(entry);
    }
}

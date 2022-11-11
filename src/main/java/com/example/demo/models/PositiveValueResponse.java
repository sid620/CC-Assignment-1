package com.example.demo.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PositiveValueResponse {
    public static class PositiveValueEntry {
        public String fileName;
        public Long value;

        public PositiveValueEntry(String fileName, Long value) {
            this.fileName = fileName;
            this.value = value;
        }
    }
    /*List is used to ensure that documents with same positive score get same rank*/
    public Map<Long, List<PositiveValueEntry>> Response;

    public PositiveValueResponse() {
        Response = new HashMap<Long, List<PositiveValueEntry>>();
    }

    public void AddEntry(Long rank, PositiveValueEntry entry) {
        if(!Response.containsKey(rank))
            Response.put(rank, new ArrayList<PositiveValueEntry>());
        Response.get(rank).add(entry);
    }
}

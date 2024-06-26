package com.example.edu.model;

import java.util.List;

public class NewsSearchResultVO {

    private int total;
    private String lastBuildDate;
    private int display;
    private int start;
    private List<NewsInfoVO> items;

    public NewsSearchResultVO() {

    }

    public NewsSearchResultVO(int total, String lastBuildDate, int display, int start, List<NewsInfoVO> items) {
        this.lastBuildDate = lastBuildDate;
        this.total = total;
        this.start = start;
        this.display = display;
        this.items = items;
    }

    public String getLastBuildDate() {
        return lastBuildDate;
    }
    public void setLastBuildDate(String lastBuildDate) {
        this.lastBuildDate = lastBuildDate;
    }
    public int getTotal() {
        return total;
    }
    public void setTotal(int total) {
        this.total = total;
    }
    public int getStart() {
        return start;
    }
    public void setStart(int start) {
        this.start = start;
    }
    public int getDisplay() {
        return display;
    }
    public void setDisplay(int display) {
        this.display = display;
    }
    public List<NewsInfoVO> getItems() {
        return items;
    }
    public void setItems(List<NewsInfoVO> items) {
        this.items = items;
    }

    public String toString() {
        return "NewsSearchResultVO [lastBuildDate=" + lastBuildDate + ", total=" + total + ", start=" + start
                + ", display=" + display + ", items=" + items + ", getLastBuildDate()=" + getLastBuildDate()
                + ", getTotal()=" + getTotal() + ", getStart()=" + getStart() + ", getDisplay()=" + getDisplay()
                + ", getItems()=" + getItems() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
                + ", toString()=" + super.toString() + "]";
    }

}

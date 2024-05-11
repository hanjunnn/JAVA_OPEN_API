package com.example.edu.model;

public class NewsInfoVO {

    private String title;
    private String originallink;
    private String link;
    private String description;
    private String pubDate; // pubdate를 pubDate로 변경

    public String getLink() {
        return link;
    }
    public void setLink(String link) {
        this.link = link;
    }
    public String getOriginallink() {
        return originallink;
    }
    public void setOriginallink(String originallink) {
        this.originallink = originallink;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getPubDate() { // getPubdate를 getPubDate로 변경
        return pubDate;
    }
    public void setPubDate(String pubDate) { // setPubdate를 setPubDate로 변경
        this.pubDate = pubDate;
    }

    public String toString() {
        return "NewsInfoVO [link=" + link + ", description=" + description + ", title=" + title
                + ", originallink=" + originallink + ", pubDate=" + pubDate + ", getLink()=" + getLink()
                + ", getDescription()=" + getDescription() + ", getOriginallink()=" + getOriginallink()
                + ", getTitle()=" + getTitle() + ", getPubDate()=" + getPubDate() + ", getClass()=" + getClass()
                + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
    }
}

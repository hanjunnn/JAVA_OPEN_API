package com.example.edu.model;

public class NewsInfoVO {

    private String title;
    private String originallink;
    private String link;
    private String description;
    private String pubdate;

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
    public String getPubdate() {
        return pubdate;
    }
    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public String toString() {
        return "NewsInfoVO [link=" + link + ", description=" + description + ", title=" + title
                + ", originallink=" + originallink + ", pubdate=" + pubdate + ", getLink()=" + getLink()
                + ", getDescription()=" + getDescription() + ", getOriginallink()=" + getOriginallink()
                + ", getTitle()=" + getTitle() + ", getPubdate()=" + getPubdate() + ", getClass()=" + getClass()
                + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
    }
}
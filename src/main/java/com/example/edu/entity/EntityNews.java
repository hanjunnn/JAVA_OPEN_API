package com.example.edu.entity;

import javax.persistence.*;

@Entity
public class EntityNews {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private String pubDate;
    private String originallink;
    @Column(unique = true) // 유니크 제약 조건 설정
    private String link;

    public EntityNews() {
        // 기본 생성자
    }

    public String getOriginallink() {
        return originallink;
    }

    public void setOriginallink(String originallink) {
        this.originallink = originallink;
    }

    public EntityNews(String title, String description, String pubDate, String link) {
        this.title = title;
        this.description = description;
        this.pubDate = pubDate;
        this.link = link;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPubDate() {
        return pubDate;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }


    @Override
    public String toString() {
        return "EntityNews{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", pubDate='" + pubDate + '\'' +
                ", originallink='" + originallink + '\'' +
                ", link='" + link + '\'' +
                '}';
    }

}

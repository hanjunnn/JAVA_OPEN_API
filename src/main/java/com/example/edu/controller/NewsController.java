package com.example.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.example.edu.repository.NewsRepository; // NewsRepository를 가져옵니다.
import com.example.edu.entity.EntityNews;

import java.util.Map;


@RestController
public class NewsController {

    @Autowired
    private NewsRepository newsRepository;

    @PostMapping("/scrap")
    //@ResponseBody
    public String scrapNews(@RequestParam Map<String,Object> news) {
        EntityNews entityNews = mapToEntity(news);
        newsRepository.save(entityNews);
        return "success";
    }
    private EntityNews mapToEntity(Map<String, Object> news) {
        EntityNews entityNews = new EntityNews();
        entityNews.setTitle((String) news.get("title"));
        entityNews.setDescription((String) news.get("description"));
        entityNews.setPubDate((String) news.get("pubDate"));
        entityNews.setLink((String) news.get("link"));
        return entityNews;
    }
}

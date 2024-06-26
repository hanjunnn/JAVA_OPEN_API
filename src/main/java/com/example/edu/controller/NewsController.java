package com.example.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.example.edu.repository.NewsRepository; // NewsRepository를 가져옵니다.
import com.example.edu.entity.EntityNews;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.Optional;



@RestController
public class NewsController {

    @Autowired
    private NewsRepository newsRepository;


    @PostMapping("/scrap")
    public ResponseEntity<String> scrapNews(@RequestParam Map<String, Object> news, HttpServletResponse response) throws IOException {
        String link = (String) news.get("link");
        Optional<EntityNews> existingNews = newsRepository.findByLink(link);

        if (existingNews.isPresent()) {
            String responseBody = "이미 스크랩된 기사입니다." + "<br>잠시 후 자동으로 뒤로 가기됩니다.";
            responseBody += "<script>setTimeout(function() { history.back(); }, 2000);</script>"; // 2초 후에 뒤로가기
            return ResponseEntity.status(HttpStatus.CONFLICT).body(responseBody);
        }
        EntityNews entityNews = mapToEntity(news);
        newsRepository.save(entityNews);
        String responseBody = "스크랩 되었습니다!" + "<br>잠시 후 자동으로 뒤로 가기됩니다.";
        responseBody += "<script>setTimeout(function() { history.back(); }, 1500);</script>"; // 2초 후에 뒤로가기
        return ResponseEntity.status(HttpStatus.OK).body(responseBody);
    }

    private EntityNews mapToEntity(Map<String, Object> news) {
        EntityNews entityNews = new EntityNews();
        entityNews.setTitle((String) news.get("title"));
        entityNews.setDescription((String) news.get("description"));
        entityNews.setPubDate((String) news.get("pubDate"));
        entityNews.setOriginallink((String) news.get("originallink"));
        entityNews.setLink((String) news.get("link"));
        return entityNews;
    }

}
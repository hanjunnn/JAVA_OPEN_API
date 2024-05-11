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


@RestController
public class NewsController {

    @Autowired
    private NewsRepository newsRepository;

    @PostMapping("/scrap")
    //@ResponseBody
    public ResponseEntity<String> scrapNews(@RequestParam Map<String,Object> news, HttpServletResponse response) throws IOException {
        EntityNews entityNews = mapToEntity(news);
        newsRepository.save(entityNews);
        return ResponseEntity.status(HttpStatus.OK).body("스크랩 되었습니다!"+"<br><a href='javascript:history.back()'>뒤로가기</a>");
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

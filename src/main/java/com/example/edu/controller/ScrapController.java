package com.example.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.edu.repository.NewsRepository;
import com.example.edu.entity.EntityNews;

import java.util.List;

@Controller
public class ScrapController {

    @Autowired
    private NewsRepository newsRepository;

    @GetMapping("/scraplist")
    public String getAllNews(Model model) {
        List<EntityNews> newsList = newsRepository.findAll();
        model.addAttribute("newsList", newsList);
        newsList.forEach(x -> System.out.println(x.getLink()));

        return "scrapall"; // scrap.jsp 파일의 이름
    }

    @GetMapping("/delete/{id}")
    public String deleteNews(@PathVariable("id") Long id) {
        newsRepository.deleteById(id);
        return "redirect:/scraplist";
    }
}

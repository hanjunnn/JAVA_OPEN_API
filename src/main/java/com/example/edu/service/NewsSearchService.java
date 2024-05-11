package com.example.edu.service;

import com.example.edu.model.NewsInfoVO;

import java.util.List;
import java.util.Map;

public interface NewsSearchService {

    public List<NewsInfoVO> searchNewsList (String uri, Map<String, String> requestHeaders) throws Exception;
}

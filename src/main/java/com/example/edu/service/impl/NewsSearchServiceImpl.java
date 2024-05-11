package com.example.edu.service.impl;

import com.example.edu.adapter.NewsInfoSearchInterface;
import com.example.edu.model.NewsInfoVO;
import com.example.edu.model.NewsSearchResultVO;
import com.example.edu.service.NewsSearchService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("newsSearchService")
public class NewsSearchServiceImpl implements NewsSearchService {
	
	NewsInfoSearchInterface NewsSearchInterface = new NewsInfoSearchInterface();
	
	@Override
	public List<NewsInfoVO> searchNewsList (String url, Map<String, String> requestHeaders) throws Exception {
		
		String responseBody =  NewsSearchInterface.getNewsInfo(url, requestHeaders);
        ObjectMapper mapper = new ObjectMapper();
		NewsSearchResultVO resultVO  = null;
        
        try {
        	
        	resultVO = mapper.readValue(responseBody, NewsSearchResultVO.class);

        } catch (JsonMappingException e) {
        	throw new Exception("JSON 에러 : " + e);
        } catch (JsonProcessingException e) {
        	throw new Exception("JSON 에러 : " + e);
        }
        
        List<NewsInfoVO> newss =resultVO.getItems();
            
        
        for (int i=0 ; i < newss.size(); i++) {
			NewsInfoVO newsInfo = newss.get(i);
           	System.out.println(i+" ==> "+newsInfo.getTitle());
        }
       
		return  newss;
		
	}

}

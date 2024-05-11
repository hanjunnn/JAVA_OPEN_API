package com.example.edu.controller;

import com.example.edu.model.BookInfoVO;
import com.example.edu.service.BookSearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookSearchController{

	@Resource(name = "bookSearchService")
	private BookSearchService bookSearchService;

    @RequestMapping(value = "/book")
    public String bookSearchPage() throws Exception {
        return "book";
    }

	@RequestMapping(value = "/booksearch")
	public String bookSearchList(String keyword, Model model)  throws Exception {

		// 네이버 검색 API Client ID, Secret
		String clientId = "24eeaevkoWBXZscPslYt";
        String clientSecret = "itXPqa9N4T";
        //검색어 Encoding
        try {
            keyword = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        //URI 및 WEB에서 입력된 검색어 설정
        StringBuffer apiURL = new StringBuffer();
        apiURL.append("https://openapi.naver.com"); // url
        apiURL.append("/v1/search/book.json?");  // path
        apiURL.append("query="+keyword); // 검색어
        apiURL.append("&display=10");  // 출력 갯수
        apiURL.append("&start=1");  // 시작 번호
        apiURL.append("&sort=sim");  // 정렬방법
        
        // Header 설정 
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        
        List<BookInfoVO> books = bookSearchService.searchBookList(apiURL.toString(), requestHeaders);

        System.out.println(" URL ==> "+apiURL);
        System.out.println(" 목록수 ==> "+books.size());

        model.addAttribute("books", books);

		return "bookSearchResult";
	}
	
}

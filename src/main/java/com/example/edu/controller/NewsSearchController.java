    package com.example.edu.controller;

    import com.example.edu.entity.EntityNews;
    import com.example.edu.imageurl.ImageExtraction;
    import com.example.edu.model.NewsInfoVO;
    import com.example.edu.repository.NewsRepository;
    import com.example.edu.service.NewsSearchService;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestParam;

    import javax.annotation.Resource;
    import javax.servlet.http.HttpSession;
    import java.net.URLEncoder;
    import java.util.*;
    import java.util.concurrent.CompletableFuture;
    import java.util.concurrent.ExecutorService;
    import java.util.concurrent.Executors;

    @Controller
    public class NewsSearchController {

        private Set<String> allLinks = new HashSet<>();

        @Autowired
        NewsRepository newsRepository;

        @Resource(name = "newsSearchService")
        private NewsSearchService newsSearchService;

        @RequestMapping(value = "/news")
        public String newsSearchPage() throws Exception {
            return "news";
        }

        @RequestMapping(value = "/newssearch")
        public String newsSearchList(String keyword, Model model, HttpSession session, @RequestParam(defaultValue = "1") int page) throws Exception {
            // 네이버 검색 API Client ID, Secret
            String clientId = "24eeaevkoWBXZscPslYt";
            String clientSecret = "itXPqa9N4T";

            int start = (page * 10) - 9;
            
            //리스트 초기화
            allLinks.clear();

            try {
                keyword = URLEncoder.encode(keyword, "UTF-8");
                session.setAttribute("keyword", keyword);

                // URI 및 WEB에서 입력된 검색어 설정
                StringBuffer apiURL = new StringBuffer();
                apiURL.append("https://openapi.naver.com"); // url
                apiURL.append("/v1/search/news.json?");  // path
                apiURL.append("query=" + keyword); // 검색어
                apiURL.append("&display=10");  // 출력 갯수
                apiURL.append("&start=" + start);  // 시작 번호
                apiURL.append("&sort=sim");  // 정렬방법

                // Header 설정
                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put("X-Naver-Client-Id", clientId);
                requestHeaders.put("X-Naver-Client-Secret", clientSecret);

                List<NewsInfoVO> newss = newsSearchService.searchNewsList(apiURL.toString(), requestHeaders);

                ExecutorService executorService = Executors.newFixedThreadPool(Math.min(100, newss.size()));
                List<CompletableFuture<Void>> futures = new ArrayList<>();
                for (NewsInfoVO newsInfo : newss) {
                    CompletableFuture<Void> future = CompletableFuture.runAsync(() -> setImageUrl(newsInfo), executorService);
                    futures.add(future);
                }

                CompletableFuture<Void> allOf = CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]));
                allOf.join();
                executorService.shutdown();

                for (NewsInfoVO newsInfo : newss) {
                    String link = newsInfo.getLink();
                    Optional<EntityNews> existingNews = newsRepository.findByLink(link);

                    if (existingNews.isPresent()) {
                        // 이미 스크랩된 기사인 경우 배열에 값을 추가
                        allLinks.add(link);
                        System.out.println(allLinks); // 리스트의 값을 출력
                        model.addAttribute("links", allLinks);
                    }
                }

                // 결과 반환
                model.addAttribute("newss", newss);
                return "newsSearchResult";
            } catch (Exception e) {
                e.printStackTrace();
                return "errorPage";
            }
        }

        // 이미지 URL 설정
        private void setImageUrl(NewsInfoVO newsInfo) {
            ImageExtraction imageExtraction = new ImageExtraction();
            String link = newsInfo.getLink();
            String imageUrl = imageExtraction.getImageUrl(link); // 이미지 URL 가져오기
            newsInfo.setOriginallink(imageUrl); // 이미지 URL을 NewsInfoVO 객체에 설정
        }
    }

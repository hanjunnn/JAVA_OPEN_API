package com.example.edu.imageurl;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ImageExtraction {

    public String getImageUrl(String url) {
        try {
            Document doc = Jsoup.connect(url).get();
            // 메타 데이터를 가져오기
            Elements metaTags = doc.select("meta[property^=og]");
            // 대표 이미지 URL 추출
            String imageUrl = null;
            for (Element metaTag : metaTags) {
                String property = metaTag.attr("property");
                if (property.equals("og:image")) {
                    imageUrl = metaTag.attr("content");
                    break;
                }
            }
            return imageUrl;
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to fetch image URL";
        }
    }
}
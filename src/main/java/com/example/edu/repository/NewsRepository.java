package com.example.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.edu.entity.EntityNews;
import java.util.Optional;


public interface NewsRepository extends JpaRepository<EntityNews, Long> {
    Optional<EntityNews> findByLink(String link);
}

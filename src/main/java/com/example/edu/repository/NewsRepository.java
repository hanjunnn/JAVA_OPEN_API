package com.example.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.edu.entity.EntityNews;

public interface NewsRepository extends JpaRepository<EntityNews, Long> {

}

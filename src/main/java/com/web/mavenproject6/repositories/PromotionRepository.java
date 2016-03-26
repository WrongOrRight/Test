package com.web.mavenproject6.repositories;

import com.web.mavenproject6.entities.Promotion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PromotionRepository extends JpaRepository<Promotion, Long> {

    
}

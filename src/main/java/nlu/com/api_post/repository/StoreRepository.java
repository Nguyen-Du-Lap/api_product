package nlu.com.api_post.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import nlu.com.api_post.model.entity.Store;
import nlu.com.api_post.model.entity.User;

@Repository
public interface StoreRepository extends JpaRepository<Store, String> {
    List<Store> findByUser(User user);
    List<Store> findByUserId(String userId);
} 
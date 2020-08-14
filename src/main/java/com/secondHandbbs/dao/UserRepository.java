package com.secondHandbbs.dao;


import com.secondHandbbs.domain.Product;
import com.secondHandbbs.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {
    public List<User> findByUsername(String name);

//    public List<User> findByNameAndPassword(String name,String password);

//    @Query("from User u where u.name=:name")
//    public List<User> findUser(@Param("name") String name);

    User findByUsernameAndPassword(String username, String password);

    User findUserByUsername(String username);

    @Query(value = "SELECT * FROM sys_user AS u " +
            "WHERE" +
            " u.lon <> 0 and u.lat <> 0 ", nativeQuery = true)
    List<User> getLonLat();
}

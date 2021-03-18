package com.demo.auth.service;

import com.demo.auth.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> listUser();

    User findById(Long id);

    void delete(Long id);
}

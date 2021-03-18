package com.demo.auth.web;

import com.demo.auth.model.User;
import com.demo.auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/rest")
public class UserRestController {

    @Autowired
    private UserRepository userRepository;

    // List all user
    @GetMapping("/allUser")
    public List<User> listAllUsers()
    {
        return userRepository.findAllByOrderByUsername();
    }

    // get by ID
    @GetMapping("/user/{id}")
    User findOne(@PathVariable Long id) {
        return userRepository.findOne(id);
    }

    // delete
    @GetMapping("/userDelete/{id}")
    User delete(@PathVariable Long id) {
        return userRepository.findOne(id);
    }


    // Save or update
    @PutMapping("/userSaveOrUpdate")
    User saveOrUpdate(@RequestBody User newUser, @PathVariable Long id) {

        return  userRepository.save(newUser);
    }

}

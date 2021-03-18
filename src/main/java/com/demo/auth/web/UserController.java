package com.demo.auth.web;

import com.demo.auth.common.CommonUtil;
import com.demo.auth.service.SecurityService;
import com.demo.auth.service.UserService;
import com.demo.auth.validator.UserValidator;
import com.demo.auth.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    MessageSource messageSource;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public ModelAndView registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView();
        if (userForm.getId() == null)
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
             mv.setViewName("registration");
            return mv;
        }
        if (userForm.getId() != null){
            User user = userService.findById(userForm.getId());
            userForm.setPassword(user.getPassword());
        }

        userService.save(userForm);
        if (userForm.getId() != null){
            mv.setViewName("redirect:listUser");
            return mv;
        }
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        mv.setViewName("redirect:/welcome");
        return mv;
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid or user is disabled.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @GetMapping("/logout")
    public ModelAndView logout(final HttpServletRequest request, final HttpServletResponse response) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        new SecurityContextLogoutHandler().logout(request, response, auth);
        return new ModelAndView("redirect:login");
    }

    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
        return "welcome";
    }

    @RequestMapping(value = {"/list" }, method = RequestMethod.GET) public
    ModelAndView welcome(ModelMap model) {
        model.addAttribute("user", CommonUtil.getUsername());

        return new ModelAndView("dashboard"); }

    @RequestMapping(value = {"/403", "/400", "/404"}, method = RequestMethod.GET)
    public final ModelAndView accesssDenied() {
        ModelAndView model = new ModelAndView();
        // check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("error");
        return model;
    }

    @RequestMapping(value = {"/listUser" }, method = RequestMethod.GET) public
    ModelAndView listUser(ModelMap model) {
        model.addAttribute("user", CommonUtil.getUsername());
        model.addAttribute(userService.listUser());
        return new ModelAndView("alluser");
    }

    @RequestMapping(value = {"/editUser/{id}" }, method = RequestMethod.GET)
    public String editUser(@PathVariable final Long id, ModelMap model) {
        model.addAttribute("user",userService.findById(id));
        model.addAttribute("edit","true");
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = {"/deleteUser/{id}" }, method = RequestMethod.GET) public
    ModelAndView deleteUser(@PathVariable final Long id,ModelMap model) {
        ModelAndView mv = new ModelAndView();
        userService.delete(id);
        mv.setViewName("redirect:listUser");
        return mv;
    }
}

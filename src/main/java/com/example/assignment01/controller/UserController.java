package com.example.assignment01.controller;

import com.example.assignment01.entity.Donation;
import com.example.assignment01.entity.User;
import com.example.assignment01.entity.UserDonation;
import com.example.assignment01.form.CreateDetailForm;
import com.example.assignment01.service.IDonationService;
import com.example.assignment01.service.IUserDonationService;
import com.example.assignment01.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IDonationService donationService;
    @Autowired
    private IUserDonationService userDonationService;

    @GetMapping("/login")
    public String userPage() {
        return "/public/login";
    }
    @GetMapping("/error-login")
    public String errorLogin() {
        return "/public/error-login";
    }

    @GetMapping("/user/info/{id}")
    public String getUserProfile(@PathVariable int id, Model model) {
        User user = userService.getUserById(id);
        List<UserDonation> userDonations = userDonationService.getUserDonationsByUserId(id);

        model.addAttribute("user", user);
        model.addAttribute("userDonations", userDonations);
        return "/public/userProfile";
    }

    @GetMapping("/home-donation")
    public String listDonation(ModelMap modelMap, @RequestParam Optional<Integer> page,
                               @RequestParam Optional<Integer> size,
                               @RequestParam(value = "keyword", required = false) String search) {
        int p = page.orElse(0);
        int s = size.orElse(5);
        Page<Donation> pages = donationService.getAllDonations(PageRequest.of(p, s), search);
        modelMap.addAttribute("listDonation", pages);
        return "public/dashboard";

    }





}
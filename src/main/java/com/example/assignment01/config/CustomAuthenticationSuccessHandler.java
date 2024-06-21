package com.example.assignment01.config;

import com.example.assignment01.entity.User;
import com.example.assignment01.service.IUserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private final IUserService userService;

    public CustomAuthenticationSuccessHandler(IUserService userService) {
        this.userService = userService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String username = authentication.getName();
        User user = userService.getUserByUsername(username); // Lấy thông tin người dùng bằng username

        request.getSession().setAttribute("user", user); // Lưu thông tin người dùng vào session

        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities()); // Lấy danh sách các vai trò

        if (roles.contains("Admin")) {
            response.sendRedirect("/home-donation"); // Điều hướng Admin tới /home-donation
        } else if (roles.contains("User")) {
            response.sendRedirect("/home-donation"); // Điều hướng User tới /home-donation
        } else {
            throw new IllegalStateException("Unknown role"); // Ném ngoại lệ nếu vai trò không xác định
        }
    }
}

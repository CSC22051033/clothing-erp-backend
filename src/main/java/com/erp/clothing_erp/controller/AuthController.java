package com.erp.clothing_erp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.erp.clothing_erp.dto.Result;
import com.erp.clothing_erp.service.UserService;
import com.erp.clothing_erp.util.JwtUtil;

@RestController
@RequestMapping("/auth")

public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/login")
    public Result<?> login(@RequestBody Map<String, String> loginRequest) {
        String username = loginRequest.get("username");
        String password = loginRequest.get("password");

        if (username == null || password == null) {
            return Result.error(400, "用户名和密码不能为空");
        }

        Map<String, Object> userInfo = userService.login(username, password);
        if (userInfo == null) {
            return Result.error(401, "用户名或密码错误");
        }

        String token = jwtUtil.generateToken(username, (Integer) userInfo.get("userId"));
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("token", token);
        responseData.put("userInfo", userInfo);

        return Result.success(responseData);
    }

    @PostMapping("/register")
    public Result<?> register(@RequestBody Map<String, String> registerRequest) {
        String username = registerRequest.get("username");
        String password = registerRequest.get("password");
        String realName = registerRequest.get("realName");

        if (username == null || username.trim().isEmpty()) {
            return Result.error(400, "用户名不能为空");
        }
        if (password == null || password.trim().isEmpty()) {
            return Result.error(400, "密码不能为空");
        }
        if (password.length() < 6) {
            return Result.error(400, "密码长度至少6位");
        }

        boolean success = userService.register(username, password, realName);
        if (!success) {
            return Result.error(409, "用户名已存在");
        }

        return Result.success("注册成功");
    }
}
package com.example.regal.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginDto {

    private String email;

    private String password;

    private String tokenDevice;
}


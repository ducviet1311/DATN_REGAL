package com.example.regal.controller;

import com.example.regal.dto.response.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShippingFeeResponse {
    private int code;
    private String message;
    private Data data;
}

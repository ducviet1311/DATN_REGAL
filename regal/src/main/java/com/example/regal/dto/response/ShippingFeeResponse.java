package com.example.regal.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShippingFeeResponse {
    private int code;
    private String message;
    private Data data;
}

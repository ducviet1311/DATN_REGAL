package com.example.regal.dto.request;

import lombok.Data;

@Data
public class DeGiayRequest {
    private String tenDeGiay;
    private String nguoiTao;
    private String nguoiCapNhat;
    private Integer trangThai;
}

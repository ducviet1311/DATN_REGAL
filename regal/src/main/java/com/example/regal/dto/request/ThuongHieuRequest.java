package com.example.regal.dto.request;

import lombok.Data;

@Data
public class ThuongHieuRequest {
    private String tenThuongHieu;
    private String nguoiTao;
    private String nguoiCapNhat;
    private Integer trangThai;
}

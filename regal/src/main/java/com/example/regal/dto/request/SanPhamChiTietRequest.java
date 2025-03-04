package com.example.regal.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class SanPhamChiTietRequest {
    private String maSanPhamChiTiet;
    private String qrCode;
    private Integer soLuong;
    private Double giaTien;
    private String moTa;
    private Integer idSanPham; // ID của sản phẩm
    private List<Integer> idKichCo; // ID của kích cỡ
    private Integer idMauSac; // ID của màu sắc
    private Integer idDotGiamGia; // ID của đợt giảm giá (nếu có)
    private String nguoiTao;
    private String nguoiCapNhat;
    private Integer trangThai;
}

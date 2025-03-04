package com.example.regal.dto.request;

import com.example.regal.entity.DiaChi;
import com.example.regal.entity.PhieuGiamGia;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class HoaDonRequest {

    private List<Integer> listIdGioHang = new ArrayList<>();

    private PhieuGiamGia phieuGiamGia;

    private DiaChi diaChi;

    private String ghiChu;

    private String vnpOrderInfo;

    private String vnpayUrl;
}

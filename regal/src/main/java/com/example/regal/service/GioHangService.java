package com.example.regal.service;

import com.example.regal.entity.GioHang;
import com.example.regal.entity.KhachHang;

import java.util.List;

public interface GioHangService {
    GioHang findCurrentGioHang(KhachHang khachhang, Integer trangThai);
    GioHang findByKhachHang(KhachHang khachHang);
    GioHang findByIdKhachHang(Integer id);
    GioHang findByGiohangIdAndSanPhamChiTietId(Integer gioHangId, Integer spctId);
    void updateSoLuongById(Integer soLuong, Integer id);
    List<GioHang> findGioHangByGiohang(Integer id);
    void deleteGioHang(Integer id);
    KhachHang findByKhachHangId(Integer id);
}

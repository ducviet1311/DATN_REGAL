package com.example.regal.service.impl;

import com.example.regal.entity.GioHang;
import com.example.regal.entity.KhachHang;
import com.example.regal.repository.GioHangRepository;
import com.example.regal.service.GioHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GioHangServiceImpl implements GioHangService {

    private final GioHangRepository gioHangRepository;

    @Override
    public GioHang findCurrentGioHang(KhachHang khachhang, Integer trangThai) {
        return gioHangRepository.findCurrentGioHang(khachhang, trangThai);
    }

    @Override
    public GioHang findByKhachHang(KhachHang khachHang) {
        return gioHangRepository.findByKhachHang(khachHang);
    }

    @Override
    public GioHang findByIdKhachHang(Integer id) {
        return gioHangRepository.findByIdKhachHang(id);
    }

    @Override
    public GioHang findByGiohangIdAndSanPhamChiTietId(Integer gioHangId, Integer spctId) {
        return gioHangRepository.findByGiohangIdAndSanPhamChiTietId(gioHangId, spctId);
    }

    @Override
    public void updateSoLuongById(Integer soLuong, Integer id) {
        gioHangRepository.updateSoLuongById(soLuong, id);
    }

    @Override
    public List<GioHang> findGioHangByGiohang(Integer id) {
        return gioHangRepository.findGioHangByGiohang(id);
    }

    @Override
    public void deleteGioHang(Integer id) {
        gioHangRepository.deleteGioHang(id);
    }

    @Override
    public KhachHang findByKhachHangId(Integer id) {
        return gioHangRepository.findByKhachHang(id);
    }
}

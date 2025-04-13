package com.example.regal.service;

import com.example.regal.dto.request.SanPhamChiTietRequest;
import com.example.regal.dto.request.SanPhamChiTietUpdateRequest;
import com.example.regal.entity.SanPhamChiTiet;

import java.util.List;
import java.util.Optional;

public interface SanPhamChiTietService {
    List<SanPhamChiTiet> getAll();
    Optional<SanPhamChiTiet> getById(Integer id);
    SanPhamChiTiet create(SanPhamChiTietRequest requestDTO);
    SanPhamChiTiet update(Integer id, SanPhamChiTietUpdateRequest requestDTO);
    void delete(Integer id);
    boolean existsBySanPhamAndMauSacAndKichCo(
            Integer idSanPham, Integer mauSacId, Integer kichCoId);
}
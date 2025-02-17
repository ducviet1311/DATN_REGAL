package com.example.regal.service;

import com.example.regal.dto.request.SanPhamRequest;
import com.example.regal.entity.SanPham;

import java.util.List;
import java.util.Optional;

public interface SanPhamService {
    List<SanPham> getAll();
    Optional<SanPham> getById(Integer id);
    SanPham create(SanPhamRequest requestDTO);
    SanPham update(Integer id, SanPhamRequest requestDTO);
    void delete(Integer id);
}
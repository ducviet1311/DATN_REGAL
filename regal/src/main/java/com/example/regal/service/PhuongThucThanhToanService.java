package com.example.regal.service;

import com.example.regal.entity.HoaDon;
import com.example.regal.entity.PhuongThucThanhToan;

import java.util.List;
import java.util.Optional;

public interface PhuongThucThanhToanService {
    List<PhuongThucThanhToan> getAll();
    Optional<PhuongThucThanhToan> getById(Integer id);
    PhuongThucThanhToan create(PhuongThucThanhToanRequest requestDTO);
    PhuongThucThanhToan update(Integer id, PhuongThucThanhToanRequest requestDTO);
    void delete(Integer id);
    PhuongThucThanhToan getByIdHoaDon(Integer idHoaDon);
    List<PhuongThucThanhToan> getAllByHoaDon(HoaDon hd);
}
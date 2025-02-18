package com.example.regal.service;

import com.example.regal.dto.request.ThuongHieuRequest;
import com.example.regal.entity.ThuongHieu;

import java.util.List;
import java.util.Optional;

public interface ThuongHieuService {
    List<ThuongHieu> getAllThuongHieu();

    Optional<ThuongHieu> getThuongHieuById(Integer id);

    ThuongHieu createThuongHieu(ThuongHieuRequest requestDTO);

    ThuongHieu updateThuongHieu(Integer id, ThuongHieuRequest requestDTO);

    void deleteThuongHieu(Integer id);
    List<ThuongHieu> getThuongHieuByTenThuongHieuOrTrangThai(String tenThuongHieu, Integer trangThai);
    List<ThuongHieu> findAllByOrderByNgayTaoDesc();
    boolean existsByTenThuongHieu(String tenThuongHieu);
    List<ThuongHieu> findThuongHieuByTenAndTrangThaiFalse(String ten);
    void updateTrangThaiToFalseById(Integer id);
}

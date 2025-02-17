package com.example.regal.service;

import com.example.regal.dto.request.DeGiayRequest;
import com.example.regal.entity.DeGiay;

import java.util.List;
import java.util.Optional;

public interface DeGiayService {
    List<DeGiay> getAllDeGiay();

    Optional<DeGiay> getDeGiayById(Integer id);

    DeGiay createDeGiay(DeGiayRequest requestDTO);

    DeGiay updateDeGiay(Integer id, DeGiayRequest requestDTO);

    void deleteDeGiay(Integer id);
    List<DeGiay> findByTenAndTrangThai(String ten, Integer trangThai);
    List<DeGiay> findAllByOrderByNgayTaoDesc();
    List<DeGiay> findDeGiayByTen(String ten);
    List<DeGiay> findDeGiayByTenAndTrangThaiFalse(String ten);
    void updateTrangThaiToFalseById(Integer id);
    boolean existsByTenDeGiay(String ten);
}

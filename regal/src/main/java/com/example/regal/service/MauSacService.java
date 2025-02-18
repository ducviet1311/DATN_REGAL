package com.example.regal.service;

import com.example.regal.dto.request.MauSacRequest;
import com.example.regal.entity.MauSac;

import java.util.List;
import java.util.Optional;

public interface MauSacService {
    List<MauSac> getAllMauSac();

    Optional<MauSac> getMauSacById(Integer id);

    MauSac createMauSac(MauSacRequest requestDTO);

    MauSac updateMauSac(Integer id, MauSacRequest requestDTO);

    void deleteMauSac(Integer id);

    Optional<MauSac> getById(Integer id);
    void deleteByTrangThai(Integer id);
    List<MauSac> findByTenAndTrangThai(String ten, Integer trangThai);
}

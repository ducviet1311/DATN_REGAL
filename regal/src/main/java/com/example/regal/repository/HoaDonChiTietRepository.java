package com.example.regal.repository;

import com.example.regal.entity.HoaDon;
import com.example.regal.entity.HoaDonChiTiet;
import com.example.regal.entity.SanPhamChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {
    Page<HoaDonChiTiet> findAllByHoaDon(HoaDon hd, Pageable p);

    List<HoaDonChiTiet> findAllByHoaDon(HoaDon hd);

    Boolean existsByHoaDonAndSanPhamChiTiet(HoaDon hd, SanPhamChiTiet spct);

    List<HoaDonChiTiet> findAllByHoaDonAndSanPhamChiTiet(HoaDon hd, SanPhamChiTiet spct);

    @Query("select h from HoaDonChiTiet h  where h.hoaDon.maHoaDon =?1 ")
    List<HoaDonChiTiet> timDSHDCTTheoMaHD(String maHD);

    @Query("SELECT h FROM HoaDonChiTiet h WHERE h.hoaDon.id =?1")
    List<HoaDonChiTiet> findHoaDonChiTietByIdHoaDon(Integer idHoaDon);
}

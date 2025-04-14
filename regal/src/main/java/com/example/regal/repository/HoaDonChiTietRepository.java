package com.example.regal.repository;

import com.example.regal.dto.request.TopSanPhamDTO;
import com.example.regal.entity.HoaDon;
import com.example.regal.entity.HoaDonChiTiet;
import com.example.regal.entity.SanPhamChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    @Query(value = "SELECT new com.example.regal.dto.request.TopSanPhamDTO(sp.id, sp.tenSanPham, SUM(hdct.soLuong)) " +
            "FROM HoaDonChiTiet hdct " +
            "JOIN hdct.hoaDon hd " +
            "JOIN hdct.sanPhamChiTiet spct " +
            "JOIN spct.sanPham sp " +
            "WHERE hd.trangThai = :trangThai " +
            "GROUP BY sp.id, sp.tenSanPham " +
            "ORDER BY SUM(hdct.soLuong) DESC " +
            "LIMIT 5", nativeQuery = false)
    List<TopSanPhamDTO> findTop5SanPhamBanChay(@Param("trangThai") int trangThai);
}

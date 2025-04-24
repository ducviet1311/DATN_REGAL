package com.example.regal.repository;

import com.example.regal.entity.HoaDon;
import com.example.regal.entity.LichSuHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LichSuHoaDonRepository extends JpaRepository<LichSuHoaDon, Integer> {

    List<LichSuHoaDon> findAllByHoaDonOrderByNgayTao(HoaDon hd);

    @Query("SELECT h FROM LichSuHoaDon h WHERE h.hoaDon.id =?1")
    List<LichSuHoaDon> findLichSuHoaDonByIdHoaDon(Integer idHoaDon);
}

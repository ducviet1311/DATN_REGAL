package com.example.regal.repository;


import com.example.regal.entity.Anh;
import com.example.regal.entity.SanPhamChiTiet;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AnhRepository extends JpaRepository<Anh, Integer> {

    @Modifying
    @Transactional
    @Query("DELETE FROM Anh a WHERE a.sanPhamChiTiet = :sanPhamChiTiet")
    void deleteBySanPhamChiTiet(@Param("sanPhamChiTiet") SanPhamChiTiet sanPhamChiTiet);


}

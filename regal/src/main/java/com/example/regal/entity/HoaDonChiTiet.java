package com.example.regal.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdHoaDon", nullable = false)
    private com.example.regal.entity.HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "IdSanPhamChiTiet", nullable = false)
    private SanPhamChiTiet sanPhamChiTiet;

    @Column(name = "GiaSanPham")
    private BigDecimal giaSanPham;

    @Column(name = "SoLuong")
    private Short soLuong;

    @Column(name = "GhiChu")
    private String ghiChu;

    @Column(name = "TrangThai")
    private Integer trangThai;
}

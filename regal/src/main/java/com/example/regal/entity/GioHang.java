package com.example.regal.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
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
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "GioHang")
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdKhachHang", nullable = false)
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "IdSanPhamChiTiet", nullable = false)
    private SanPhamChiTiet sanPhamChiTiet;

    @Column(name = "SoLuong")
    private Short soLuong;

    @CreationTimestamp
    @Column(name = "NgayTao", updatable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp ngayTao;

    @Column(name = "TrangThai", columnDefinition = "bit default 0")
    private Boolean trangThai = false;
}

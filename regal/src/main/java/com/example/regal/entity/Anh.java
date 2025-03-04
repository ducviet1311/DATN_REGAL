package com.example.regal.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
<<<<<<< HEAD
import jakarta.persistence.*;
=======
<<<<<<< HEAD
import jakarta.persistence.*;
=======
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
>>>>>>> 6c3d7fb65af90cb226814be30c5d31df00e60baa
>>>>>>> 4550e0fb5a481bd29276900712032b9ff571ca1c
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Anh")
public class Anh {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdSanPhamChiTiet", nullable = false)
    @JsonBackReference
    private SanPhamChiTiet sanPhamChiTiet;

    @Column(name = "TenAnh")
    private String tenAnh;

    @CreationTimestamp
    @Column(name = "NgayTao", updatable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp ngayTao;

    @Column(name = "NguoiTao")
    private String nguoiTao;

    @UpdateTimestamp
    @Column(name = "LanCapNhatCuoi")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp lanCapNhatCuoi;

    @Column(name = "NguoiCapNhat")
    private String nguoiCapNhat;

    @Column(name = "TrangThai", columnDefinition = "bit default 1")
    private Boolean trangThai = true; // Mặc định là 1 (true)
}

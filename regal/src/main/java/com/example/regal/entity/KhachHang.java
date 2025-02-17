package com.example.regal.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Date;
import java.sql.Timestamp;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "KhachHang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaKhachHang", length = 50)
    private String maKhachHang;

    @Column(name = "Anh", length = 300)
    private String anh;

    @Column(name = "HoVaTen", nullable = false, length = 100)
    private String hoVaTen;

    @Column(name = "NgaySinh")
    private Date ngaySinh;

    @Column(name = "GioiTinh", columnDefinition = "bit default 0")
    private Boolean gioiTinh = false;

    @Column(name = "SoDienThoai", length = 20)
    private String soDienThoai;

    @Column(name = "Email", length = 50)
    private String email;

    @Column(name = "TaiKhoan", length = 50)
    private String taiKhoan;

    @Column(name = "MatKhau", length = 300)
    private String matKhau;

//    @Enumerated(EnumType.STRING)
//    private Role vaiTro = Role.KHACHHANG; //Hưng thêm
//    @Column(name = "VaiTro", length = 50)
//    private String vaiTro;


    @CreationTimestamp
    @Column(name = "NgayTao", updatable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp ngayTao;

    @Column(name = "NguoiTao", length = 100)
    private String nguoiTao;

    @UpdateTimestamp
    @Column(name = "LanCapNhatCuoi")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp lanCapNhatCuoi;

    @Column(name = "NguoiCapNhat", length = 100)
    private String nguoiCapNhat;

    @Column(name = "TrangThai", nullable = false)
    private Integer trangThai;
}

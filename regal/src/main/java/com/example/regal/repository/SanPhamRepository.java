package com.example.regal.repository;

import com.example.regal.dto.request.SanPhamBanChay;
import com.example.regal.dto.request.TopSanPhamDTO;
import com.example.regal.entity.SanPham;
import com.example.regal.entity.SanPhamChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer>, JpaSpecificationExecutor<SanPham> {

    @Query(nativeQuery = true, value = """
            SELECT * FROM SanPham WHERE TrangThai=1
               ORDER BY NgayTao DESC
            """)
    List<SanPham> getAllByNgayTao();
    //        list san pham ban chay
    @Query("SELECT new com.example.regal.dto.request.SanPhamBanChay(" +
            "sp.id, " +
            "sp.tenSanPham, " +
            "MAX(a.tenAnh), " +
            "MIN(spct.giaTien)) " +
            "FROM SanPham sp " +
            "JOIN sp.sanPhamChiTiets spct " +
            "LEFT JOIN HoaDonChiTiet hdct ON hdct.sanPhamChiTiet.id = spct.id " +
            "LEFT JOIN spct.anhs a " +
            "GROUP BY sp.id, sp.tenSanPham " +
            "ORDER BY SUM(hdct.soLuong) DESC")
    Page<SanPhamBanChay> findTopSanPhamBanChay(Pageable pageable);


    @Query("select s from SanPham s where s.thuongHieu.id = ?1")
    List<SanPham> findByThuongHieu(Integer idthuonghieu);


    @Query("select s from SanPham s where s.thuongHieu.id = ?1")
    Page<SanPham> findByThuongHieu(Integer idthuonghieu, Pageable pageable);

    // tìm id lớn nhất bên sp
    @Query(value = "SELECT MAX(s.id) FROM SanPham s")
    Integer findMaxIdSP();

    SanPham findFirstByOrderByNgayTaoDesc();

    boolean existsByTenSanPham(String tensanpham);

    // các sp mới nhất bên sp
    @Query("""
        SELECT sp.id, sp.tenSanPham, sp.ngayTao, 
               SUM(ct.soLuong) AS tongSoLuong, sp.trangThai, sp.maSanPham
        FROM SanPham sp
        JOIN SanPhamChiTiet ct ON sp.id = ct.id
        GROUP BY sp.id, sp.tenSanPham, sp.ngayTao, sp.trangThai, sp.maSanPham
        ORDER BY sp.ngayTao DESC, tongSoLuong DESC
       """)
    List<Object[]> findProductsWithTotalQuantityOrderByDateDesc();


    @Query("select s from SanPhamChiTiet s where s.sanPham.id = ?1")
    List<SanPhamChiTiet> findBySanPham(Integer sanpham);

    @Query("select s from SanPham s where s.tenSanPham like ?1")
    Page<SanPham> findByParam(String s, Pageable pageable);

    @Query("select s from SanPhamChiTiet s where s.dotGiamGia.id = ?1")
    List<SanPhamChiTiet> findByDotGiamGia(Integer id);
    // search bên sp
//    @Query("""
//        SELECT sp.id, sp.tenSanPham, sp.ngayTao, SUM(SanPhamChiTiet.soLuong) AS tongSoLuong,
//               sp.trangThai, sp.maSanPham
//        FROM SanPham sp
//        JOIN sp spct
//        WHERE (sp.maSanPham LIKE %:masanpham% OR sp.tenSanPham LIKE %:key%)
//          AND (:trangthai IS NULL OR sp.trangThai = :trangthai)
//        GROUP BY sp.id, sp.tenSanPham, sp.ngayTao, sp.trangThai, sp.maSanPham
//        ORDER BY sp.ngayTao DESC, SUM(SanPhamChiTiet.soLuong) DESC
//       """)
//    List<Object[]> findByMasanphamAndTenSanPhamAndTrangThai(
//            @Param("masanpham") String masanpham,
//            @Param("key") String key,
//            @Param("trangthai") Integer trangthai
//    );
}

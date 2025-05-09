package com.example.regal.repository;

import com.example.regal.dto.request.TopSanPhamDTO;
import com.example.regal.entity.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {
    @Query("select h from HoaDon h where h.loaiHoaDon = true or (h.loaiHoaDon = false and h.trangThai = 8)")
    Page<HoaDon> findAllHd(Pageable pageable);

    @Query("SELECT h FROM HoaDon h WHERE h.maHoaDon =?1 OR h.email =?1 OR h.soDienThoai =?1 ORDER BY h.ngayTao DESC")
    List<HoaDon> findHoaDonByMaOrSdtOrEmail(String inputSearch);

    @Query("SELECT h FROM HoaDon h where h.id =?1")
    HoaDon findHoaDonById(Integer id);

    @Query("SELECT h FROM HoaDon h where h.id =?1")
    Optional<HoaDon> findById(Integer id);

    @Query("SELECT h FROM HoaDon h where h.khachHang.id =?1 ORDER BY h.id DESC")
    List<HoaDon> findAllByKhachHang(Integer id);

    @Query("SELECT h FROM HoaDon h WHERE h.trangThai =?1 AND h.khachHang.id =?2 ORDER BY h.id DESC")
    List<HoaDon> findHoaDonByTrangThaiAndKhachhang(Integer trangThai, Integer id);

    Page<HoaDon> findAllByTrangThaiAndLoaiHoaDonAndNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(
            Integer trangThai, Boolean loaihd, Date tu, Date den, Pageable p);

    @Query("SELECT h FROM HoaDon h ORDER BY h.id DESC")
    Page<HoaDon> findAlls(Pageable p);

    @Query("select h from HoaDon h where h.trangThai = ?1 and (h.loaiHoaDon = true or (h.loaiHoaDon = false and h.trangThai != 1))")
    Page<HoaDon> findByTrangThai(Integer trangthai, Pageable pageable);

    Long countAllByTrangThai(Integer trangThai);

    Page<HoaDon> findAllByLoaiHoaDonAndNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(Boolean loaihd, Date tu, Date den, Pageable p);

    Page<HoaDon> findAllByTrangThaiAndNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(Integer trangThai, Date tu, Date den, Pageable p);

    @Query("select h from HoaDon h where h.trangThai = ?1 and h.loaiHoaDon = ?2 and (h.loaiHoaDon = true or (h.loaiHoaDon = false and h.trangThai != 1))")
    Page<HoaDon> findByTrangThaiAndLoaiHoaDon(Integer trangThai, Boolean loaiHoaDon, Pageable pageable);

    Page<HoaDon> findAllByNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(Date tu, Date den, Pageable p);

    @Query("select h from HoaDon h where h.loaiHoaDon = ?1 and (h.loaiHoaDon = true or (h.loaiHoaDon = false and h.trangThai != 1))")
    Page<HoaDon> findByLoaiHoaDon(Boolean loaiHoaDon, Pageable pageable);

    List<HoaDon> findAllById(Integer id);

    @Query("SELECT h FROM HoaDon h ORDER BY h.id DESC")
    List<HoaDon> timHDGanNhat();

    @Query("SELECT h FROM HoaDon h WHERE h.maHoaDon =?1")
    HoaDon timHDTheoMaHD(String mahd);

    boolean existsById(Integer id);

    @Query("select count(h.id) from HoaDon h where h.trangThai = 1 and h.loaiHoaDon = false")
    Long demHoaDonCho();

    @Query("select count(h.id) from HoaDon h where h.trangThai = ?1")
    Long demHoaDonTrangThai(Integer trangThai);

    @Query("select h from HoaDon h where h.trangThai = 1 and h.loaiHoaDon = false")
    List<HoaDon> hoaDonCho();

    @Query(value = "SELECT COUNT(*) AS SoLuongDonHang FROM HoaDon\n" +
            "WHERE CONVERT(DATE, ngayTao) = ?1", nativeQuery = true)
    Long soDonHomNay(Date date);

    @Query(value = "SELECT COUNT(*) AS SoLuongDonHang\n" +
            "FROM HoaDon\n" +
            "WHERE ngayTao >= DATEADD(DAY, -7, CAST(GETDATE() AS DATE))\n" +
            "  AND ngayTao < CAST(GETDATE() AS DATE)", nativeQuery = true)
    Long soDonTuanNay();

    @Query(value = "SELECT COUNT(*) AS SoLuongDonHang\n" +
            "FROM HoaDon\n" +
            "WHERE Month(ngayTao) = MONTH(GETDATE()) and year(ngayTao) = YEAR(GETDATE())", nativeQuery = true)
    Long soDonThangNay();

    @Query(value = "SELECT sum(tongTien) AS SoLuongDonHang\n" +
            "FROM HoaDon\n" +
            "WHERE Month(ngayTao) = ?1 and year(ngayTao) = ?2 and trangThai = 8", nativeQuery = true)
    Double tinhDoanhThuAdmin(int i, Integer nam);

    @Query(value = "SELECT DATEPART(HOUR, ngayTao) AS Gio, SUM(tongTien) AS DoanhThu " +
            "FROM HoaDon " +
            "WHERE CAST(ngayTao AS DATE) = CAST(GETDATE() AS DATE) " +
            "AND trangThai = 8 " +
            "GROUP BY DATEPART(HOUR, ngayTao) " +
            "ORDER BY Gio", nativeQuery = true)
    List<Object[]> tinhDoanhThuTheoGioTrongNgay();

    @Query(value = "SELECT DATEPART(WEEKDAY, ngayTao) AS Thu, SUM(tongTien) AS DoanhThu " +
            "FROM HoaDon " +
            "WHERE DATEPART(WEEK, ngayTao) = DATEPART(WEEK, GETDATE()) " +
            "AND YEAR(ngayTao) = YEAR(GETDATE()) " +
            "AND trangThai = 8 " +
            "GROUP BY DATEPART(WEEKDAY, ngayTao) " +
            "ORDER BY DATEPART(WEEKDAY, ngayTao)", nativeQuery = true)
    List<Object[]> tinhDoanhThuTheoThuTrongTuan();

    @Query("SELECT new com.example.regal.dto.request.TopSanPhamDTO(sp.id, sp.tenSanPham, SUM(hdct.soLuong)) " +
            "FROM HoaDonChiTiet hdct " +
            "JOIN hdct.hoaDon hd " +
            "JOIN hdct.sanPhamChiTiet spct " +
            "JOIN spct.sanPham sp " +
            "WHERE hd.trangThai = 8 " +
            "GROUP BY sp.id, sp.tenSanPham " +
            "ORDER BY SUM(hdct.soLuong) DESC")
    List<TopSanPhamDTO> findTop5SanPhamBanChay(Pageable pageable);

    @Query(value = "SELECT sum(tongTien) " +
            "FROM HoaDon " +
            "WHERE year(ngayTao) = ?1 and trangThai = 8",
            nativeQuery = true)
    Double tinhDoanhThuTheoNam(Integer nam);

    @Query("SELECT h FROM HoaDon h LEFT JOIN h.khachHang kh WHERE " +
            "(:trangthai IS NULL OR h.trangThai = :trangthai) AND " +
            "(:loaiHoaDon IS NULL OR h.loaiHoaDon = :loaiHoaDon) AND " +
            "(h.loaiHoaDon = true OR (h.loaiHoaDon = false AND h.trangThai != 1)) AND " +
            "(h.maHoaDon LIKE %:keyword% OR " +
            "(kh IS NULL AND :keyword = 'Khách lẻ') OR " +
            "(kh IS NOT NULL AND (kh.hoVaTen LIKE %:keyword% OR kh.soDienThoai LIKE %:keyword%)))")
    Page<HoaDon> searchHoaDon(@Param("keyword") String keyword,
                              @Param("trangthai") Integer trangthai,
                              @Param("loaiHoaDon") Boolean loaiHoaDon,
                              Pageable pageable);
}
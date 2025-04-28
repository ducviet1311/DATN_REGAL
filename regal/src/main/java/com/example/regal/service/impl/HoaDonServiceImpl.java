package com.example.regal.service.impl;

import com.example.regal.dto.request.SanPhamBanChay;
import com.example.regal.dto.request.TopSanPhamDTO;
import com.example.regal.entity.HoaDon;
import com.example.regal.repository.HoaDonChiTietRepository;
import com.example.regal.repository.HoaDonRepository;
import com.example.regal.repository.SanPhamRepository;
import com.example.regal.service.HoaDonService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class HoaDonServiceImpl implements HoaDonService {

    private final HoaDonRepository hoaDonRepository;

    private final SanPhamRepository sanPhamRepository;

    private final HoaDonChiTietRepository hoaDonChiTietRepository;

    @Override
    public List<HoaDon> findHoaDonByMaOrSdtOrEmail(String inputSearch) {
        return hoaDonRepository.findHoaDonByMaOrSdtOrEmail(inputSearch);
    }

    @Override
    public HoaDon findHoaDonById(Integer id) {
        return hoaDonRepository.findHoaDonById(id);
    }

    @Override
    public List<HoaDon> findAllByKhachHang(Integer id) {
        return hoaDonRepository.findAllByKhachHang(id);
    }

    @Override
    public List<HoaDon> findHoaDonByTrangThaiAndKhachhang(Integer trangThai, Integer id) {
        return hoaDonRepository.findHoaDonByTrangThaiAndKhachhang(trangThai, id);
    }

    @Override
    public Page<HoaDon> findAllByTrangThaiAndLoaiHoaDonAndNgayTaoBetween(Integer trangThai, Boolean loaihd, Date tu, Date den, Pageable pageable) {
        return hoaDonRepository.findAllByTrangThaiAndLoaiHoaDonAndNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(trangThai, loaihd, tu, den, pageable);
    }

    @Override
    public Page<HoaDon> findAll(Pageable pageable) {
        return hoaDonRepository.findAlls(pageable);
    }

    @Override
    public Page<HoaDon> findAllByTrangThai(Integer trangThai, Pageable pageable) {
        return hoaDonRepository.findByTrangThai(trangThai, pageable);
    }

    @Override
    public Long countAllByTrangThai(Integer trangThai) {
        return hoaDonRepository.countAllByTrangThai(trangThai);
    }

    @Override
    public Page<HoaDon> findAllByLoaiHoaDonAndNgayTaoBetween(Boolean loaihd, Date tu, Date den, Pageable pageable) {
        return hoaDonRepository.findAllByLoaiHoaDonAndNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(loaihd, tu, den, pageable);
    }

    @Override
    public Page<HoaDon> findAllByTrangThaiAndNgayTaoBetween(Integer trangThai, Date tu, Date den, Pageable pageable) {
        return hoaDonRepository.findAllByTrangThaiAndNgayTaoGreaterThanEqualAndNgayTaoLessThanEqual(trangThai, tu, den, pageable);
    }

    @Override
    public Page<HoaDon> findAllByTrangThaiAndLoaiHoaDon(Integer trangThai, Boolean loaihd, Pageable pageable) {
        return hoaDonRepository.findByTrangThaiAndLoaiHoaDon(trangThai, loaihd, pageable);
    }

    @Override
    public List<HoaDon> findAllById(Integer id) {
        return hoaDonRepository.findAllById(id);
    }

    @Override
    public List<HoaDon> timHDGanNhat() {
        return hoaDonRepository.timHDGanNhat();
    }

    @Override
    public HoaDon timHDTheoMaHD(String mahd) {
        return hoaDonRepository.timHDTheoMaHD(mahd);
    }

    @Override
    public boolean existsById(Integer id) {
        return hoaDonRepository.existsById(id);
    }

    @Override
    public List<TopSanPhamDTO> getTop5SanPhamBanChay() {
        List<TopSanPhamDTO> result = hoaDonChiTietRepository.findTop5SanPhamBanChay(8); // 8 = trạng thái hoàn tất
        if (result == null || result.isEmpty()) {
            return Collections.emptyList();
        }
        return result;
    }

    @Override
    public Double tinhDoanhThuTheoNam(Integer nam) {
        System.out.println("Đang tính doanh thu năm " + nam);
        Double result = hoaDonRepository.tinhDoanhThuTheoNam(nam);
        System.out.println("Kết quả từ repository: " + result);
        return result;
    }

    @Override
    public List<SanPhamBanChay> getTop8SanPhamBanChay() {
        return sanPhamRepository.findTopSanPhamBanChay(PageRequest.of(0, 8))
                .getContent();
    }
}
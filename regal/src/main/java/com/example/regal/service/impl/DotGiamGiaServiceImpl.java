package com.example.regal.service.impl;

import com.example.regal.dto.request.DotGiamGiaRequest;
import com.example.regal.dto.response.DotGiamGiaResponse;
import com.example.regal.entity.DotGiamGia;
import com.example.regal.entity.SanPham;
import com.example.regal.entity.SanPhamChiTiet;
import com.example.regal.exception.MessageException;
import com.example.regal.repository.DotGiamGiaRepository;
import com.example.regal.repository.SanPhamChiTietRepository;
import com.example.regal.repository.SanPhamRepository;
import com.example.regal.service.DotGiamGiaService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DotGiamGiaServiceImpl implements DotGiamGiaService {
    private final DotGiamGiaRepository dotGiamGiaRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;

    @Override
    public List<DotGiamGiaResponse> getAllDotGiamGia() {
        return dotGiamGiaRepository.findAll()
                .stream()
                .map(this::convertToResponse)
                .toList();
    }

    @Override
    public Optional<DotGiamGiaResponse> getDotGiamGiaById(Integer id) {
        return dotGiamGiaRepository.findById(id)
                .map(this::convertToResponse);
    }

    @Override
    public DotGiamGiaResponse createDotGiamGia(DotGiamGiaRequest requestDTO) {
        DotGiamGia dotGiamGia = new DotGiamGia();
        dotGiamGia.setGiaTriGiam(requestDTO.getGiaTriGiam());
        dotGiamGia.setNgayBatDau(requestDTO.getNgayBatDau());
        dotGiamGia.setNgayKetThuc(requestDTO.getNgayKetThuc());
        dotGiamGia.setNguoiTao(requestDTO.getNguoiTao());
        dotGiamGia.setNguoiCapNhat(requestDTO.getNguoiCapNhat());
        dotGiamGia.setTrangThai(requestDTO.getTrangThai());
        dotGiamGia.setNgayTao(new Timestamp(System.currentTimeMillis()));
        for(Integer id : requestDTO.getListIdSp()){
            SanPham sanPham = sanPhamRepository.findById(id).get();
            List<SanPhamChiTiet> list = sanPham.getSanPhamChiTiets();
            for(SanPhamChiTiet spct: list){
                if(spct.getDotGiamGia() != null){
                    throw new MessageException("sản phẩm chi tiết id: "+spct.getId()+" của sản phẩm id: "+sanPham.getId()+" đang có đợt giảm giá");
                }
            }
        }
        DotGiamGia savedDotGiamGia = dotGiamGiaRepository.save(dotGiamGia);
        for(Integer id : requestDTO.getListIdSp()){
            SanPham sanPham = sanPhamRepository.findById(id).get();
            List<SanPhamChiTiet> list = sanPham.getSanPhamChiTiets();
            for(SanPhamChiTiet spct: list){
                spct.setGiaTien(spct.getGiaTien() - requestDTO.getGiaTriGiam());
                spct.setDotGiamGia(savedDotGiamGia);
                sanPhamChiTietRepository.save(spct);
            }
        }
        return convertToResponse(savedDotGiamGia);
    }

    @Override
    public DotGiamGiaResponse updateDotGiamGia(Integer id, DotGiamGiaRequest requestDTO) {
        Optional<DotGiamGia> optionalDotGiamGia = dotGiamGiaRepository.findById(id);
        if (optionalDotGiamGia.isPresent()) {
            DotGiamGia dotGiamGia = optionalDotGiamGia.get();
            dotGiamGia.setGiaTriGiam(requestDTO.getGiaTriGiam());
            dotGiamGia.setNgayBatDau(requestDTO.getNgayBatDau());
            dotGiamGia.setNgayKetThuc(requestDTO.getNgayKetThuc());
            dotGiamGia.setNguoiCapNhat(requestDTO.getNguoiCapNhat());
            dotGiamGia.setTrangThai(requestDTO.getTrangThai());
            DotGiamGia updatedDotGiamGia = dotGiamGiaRepository.save(dotGiamGia);
            return convertToResponse(updatedDotGiamGia);
        }
        return null;
    }

    @Override
    public void deleteDotGiamGia(Integer id) {
        dotGiamGiaRepository.deleteById(id);
    }

    private DotGiamGiaResponse convertToResponse(DotGiamGia dotGiamGia) {
        return DotGiamGiaResponse.builder()
                .id(dotGiamGia.getId())
                .giaTriGiam(dotGiamGia.getGiaTriGiam())
                .ngayBatDau(dotGiamGia.getNgayBatDau())
                .ngayKetThuc(dotGiamGia.getNgayKetThuc())
                .ngayTao(dotGiamGia.getNgayTao())
                .nguoiTao(dotGiamGia.getNguoiTao())
                .lanCapNhatCuoi(dotGiamGia.getLanCapNhatCuoi())
                .nguoiCapNhat(dotGiamGia.getNguoiCapNhat())
                .trangThai(dotGiamGia.getTrangThai())
                .build();
    }

    @Override
    public Page<DotGiamGia> findAllOrderByNgayTaoDESC(String keySearch, Timestamp tungaySearch, Timestamp denngaySearch, Integer ttSearch, Pageable pageable) {
        return dotGiamGiaRepository.findAllOrderByNgayTaoDESC(keySearch, tungaySearch, denngaySearch, ttSearch, pageable);
    }

    @Override
    public DotGiamGia findDotGiamGiaById(Integer id) {
        return dotGiamGiaRepository.findDotGiamGiaById(id);
    }

    @Override
    public DotGiamGia findFirstByOrderByNgayTaoDesc() {
        return dotGiamGiaRepository.findFirstByOrderByNgayTaoDesc();
    }
}

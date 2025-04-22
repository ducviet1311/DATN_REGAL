package com.example.regal.controller;

import com.example.regal.dto.request.ChiTietSpSearch;
import com.example.regal.dto.request.SanPhamChiTietRequest;
import com.example.regal.dto.request.SanPhamChiTietUpdateRequest;
import com.example.regal.dto.response.SanPhamChiTietSpecification;
import com.example.regal.entity.SanPhamChiTiet;
import com.example.regal.repository.SanPhamChiTietRepository;
import com.example.regal.repository.SanPhamRepository;
import com.example.regal.service.SanPhamChiTietService;
import lombok.RequiredArgsConstructor;
import org.aspectj.bridge.MessageUtil;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/api/san-pham-chi-tiet")
@RequiredArgsConstructor
public class SanPhamChiTietController {

    private final SanPhamChiTietService sanPhamChiTietService;
    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    private final SanPhamRepository sanPhamRepository;

    // Lấy tất cả chi tiết sản phẩm
    @GetMapping
    public ResponseEntity<List<SanPhamChiTiet>> getAllSanPhamChiTiet() {
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietService.getAll();
        return ResponseEntity.ok(sanPhamChiTietList);
    }

    @GetMapping("/findBySanPham")
    public ResponseEntity<List<SanPhamChiTiet>> findBySanPham(@RequestParam Integer sanpham) {
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamRepository.findBySanPham(sanpham);
        return ResponseEntity.ok(sanPhamChiTietList);
    }

    // Lấy chi tiết sản phẩm theo ID
    @GetMapping("/{id}")
    public ResponseEntity<SanPhamChiTiet> getSanPhamChiTietById(@PathVariable Integer id) {
        Optional<SanPhamChiTiet> sanPhamChiTiet = sanPhamChiTietService.getById(id);
        return sanPhamChiTiet.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Tạo mới chi tiết sản phẩm
    @PostMapping
    public ResponseEntity<List<SanPhamChiTiet>> createSanPhamChiTiet(@RequestBody SanPhamChiTietRequest requestDTO) {
        List<SanPhamChiTiet> createdSanPhamChiTietList = new ArrayList<>();

        for (Integer idKichCo : requestDTO.getIdKichCo()) {
            SanPhamChiTietRequest singleRequest = new SanPhamChiTietRequest();
            singleRequest.setMaSanPhamChiTiet(requestDTO.getMaSanPhamChiTiet());
            singleRequest.setQrCode(requestDTO.getQrCode());
            singleRequest.setSoLuong(requestDTO.getSoLuong());
            singleRequest.setGiaTien(requestDTO.getGiaTien());
            singleRequest.setMoTa(requestDTO.getMoTa());
            singleRequest.setIdSanPham(requestDTO.getIdSanPham());
            singleRequest.setIdKichCo(Collections.singletonList(idKichCo));
            singleRequest.setIdMauSac(requestDTO.getIdMauSac());
            singleRequest.setIdDotGiamGia(requestDTO.getIdDotGiamGia());
            singleRequest.setNguoiTao(requestDTO.getNguoiTao());
            singleRequest.setNguoiCapNhat(requestDTO.getNguoiCapNhat());
            singleRequest.setTrangThai(requestDTO.getTrangThai());

            // Gọi service để tạo từng SanPhamChiTiet
            SanPhamChiTiet created = sanPhamChiTietService.create(singleRequest);
            createdSanPhamChiTietList.add(created);
        }

        return ResponseEntity.ok(createdSanPhamChiTietList);
    }


    // Cập nhật chi tiết sản phẩm
    @PostMapping("/update/{id}")
    public ResponseEntity<SanPhamChiTiet> updateSanPhamChiTiet(@PathVariable Integer id, @RequestBody SanPhamChiTietUpdateRequest requestDTO) {
        SanPhamChiTiet updatedSanPhamChiTiet = sanPhamChiTietService.update(id, requestDTO);
        return updatedSanPhamChiTiet != null ? ResponseEntity.ok(updatedSanPhamChiTiet) : ResponseEntity.notFound().build();
    }


    // Xóa chi tiết sản phẩm
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSanPhamChiTiet(@PathVariable Integer id) {
        sanPhamChiTietService.delete(id);
        return ResponseEntity.noContent().build();
    }


    @PostMapping("/public/loc-chi-tiet-san-pham-list")
    public ResponseEntity<?> locSanPhamChiTiet(@RequestBody ChiTietSpSearch search) {
        SanPhamChiTietSpecification sp = new SanPhamChiTietSpecification(search.getThuongHieuId(), search.getChatLieuId(), search.getDeGiayId(), search.getMauSacId(), search.getKichThuocId());
        List<SanPhamChiTiet> sanPhamList = sanPhamChiTietRepository.findAll(sp);
        return ResponseEntity.ok(sanPhamList.stream().filter(i -> i.getTrangThai() == 1));
    }

    @GetMapping("/check-exist")
    public ResponseEntity<?> checkExist(
            @RequestParam Integer idSanPham,
            @RequestParam Integer mauSacId,
            @RequestParam Integer kichCoId) {

        try {
            boolean exists = sanPhamChiTietService.existsBySanPhamAndMauSacAndKichCo(
                    idSanPham, mauSacId, kichCoId);

            Map<String, Object> response = new HashMap<>();
            response.put("exists", exists);

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(
                    Collections.singletonMap("error", "Đã xảy ra lỗi khi kiểm tra"));
        }
    }
}

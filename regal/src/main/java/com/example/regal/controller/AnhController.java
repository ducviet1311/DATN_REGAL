package com.example.regal.controller;

import com.example.regal.dto.response.AnhResponse;
import com.example.regal.entity.Anh;
import com.example.regal.entity.SanPhamChiTiet;
import com.example.regal.exception.MessageException;
import com.example.regal.repository.AnhRepository;
import com.example.regal.repository.SanPhamChiTietRepository;
import com.example.regal.service.AnhService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/anh")
@RequiredArgsConstructor
public class AnhController {

    private final AnhService anhService;
    private final AnhRepository anhRepository;
    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    // Lấy tất cả ảnh
    @GetMapping
    public ResponseEntity<List<AnhResponse>> getAllAnh() {
        List<Anh> anhList = anhService.getAll();
        List<AnhResponse> responseList = anhList.stream().map(anh -> {
            AnhResponse response = new AnhResponse();
            response.setId(anh.getId());
            response.setTenAnh(anh.getTenAnh());
            response.setIdSanPhamChiTiet(anh.getSanPhamChiTiet().getId()); // Lấy ID của sản phẩm chi tiết
            response.setNgayTao(anh.getNgayTao());
            response.setNguoiTao(anh.getNguoiTao());
            response.setLanCapNhatCuoi(anh.getLanCapNhatCuoi());
            response.setNguoiCapNhat(anh.getNguoiCapNhat());
            response.setTrangThai(anh.getTrangThai());
            return response;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(responseList);
    }

    @PostMapping("")
    public void updateAnh(@RequestBody List<String> listLink, @RequestParam Integer chiTietSanPhamId) {
        Optional<SanPhamChiTiet> sanPhamChiTietOpt = sanPhamChiTietRepository.findById(chiTietSanPhamId);
        if (sanPhamChiTietOpt.isEmpty()) {
            throw new MessageException("Không tồn tại sản phẩm chi tiết");
        }

        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietOpt.get();
        anhRepository.deleteBySanPhamChiTiet(sanPhamChiTiet); // Xóa ảnh cũ trước khi thêm mới

        for (String s : listLink) {
            Anh anh = new Anh();
            anh.setTenAnh(s);
            anh.setSanPhamChiTiet(sanPhamChiTiet);
            anh.setNgayTao(new Timestamp(System.currentTimeMillis()));
            anh.setTrangThai(true);
            anhRepository.save(anh);
        }
    }
}
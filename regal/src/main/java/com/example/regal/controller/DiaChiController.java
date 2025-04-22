package com.example.regal.controller;

import com.example.regal.dto.request.DiaChiRequest;
import com.example.regal.dto.response.DiaChiResponse;
import com.example.regal.entity.DiaChi;
import com.example.regal.entity.KhachHang;
import com.example.regal.repository.DiaChiRepository;
import com.example.regal.repository.KhachHangRepository;
import com.example.regal.service.DiaChiService;
import com.example.regal.utils.UserUltis;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/dia-chi")
@RequiredArgsConstructor
public class DiaChiController {

    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    private DiaChiRepository diaChiRepository;

    @Autowired
    private UserUltis userUltis;

    @Autowired
    private KhachHangRepository khachHangRepository;

    // Lấy tất cả địa chỉ
    @GetMapping
    public ResponseEntity<List<DiaChiResponse>> getAllDiaChi(HttpServletRequest request) {
        KhachHang khachHang = userUltis.getLoggedInKhachHang(request);
        List<DiaChi> diaChiList = diaChiRepository.findByIdKhachHang(khachHang.getId());
        List<DiaChiResponse> responseList = diaChiList.stream().map(dc -> {
            DiaChiResponse response = new DiaChiResponse();
            response.setId(dc.getId());
            response.setKhachHang(dc.getKhachHang());
            response.setTenDuong(dc.getTenDuong());
            response.setXaPhuong(dc.getXaPhuong());
            response.setQuanHuyen(dc.getQuanHuyen());
            response.setTinhThanhPho(dc.getTinhThanhPho());
            response.setTenNguoiNhan(dc.getTenNguoiNhan());
            response.setSdtNguoiNhan(dc.getSdtNguoiNhan());
            response.setNgayTao(dc.getNgayTao());
            response.setNguoiTao(dc.getNguoiTao());
            response.setLanCapNhatCuoi(dc.getLanCapNhatCuoi());
            response.setNguoiCapNhat(dc.getNguoiCapNhat());
            response.setTrangThai(dc.getTrangThai());
            return response;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(responseList);
    }

    // Tạo mới địa chỉ
    @PostMapping
    public ResponseEntity<DiaChiResponse> createDiaChi(@RequestBody DiaChiRequest requestDTO, HttpServletRequest request) {
        KhachHang khachHang = userUltis.getLoggedInKhachHang(request);
        DiaChi createdDiaChi = diaChiService.createDiaChi(requestDTO, khachHang);
        DiaChiResponse response = new DiaChiResponse();
        response.setId(createdDiaChi.getId());
        response.setKhachHang(createdDiaChi.getKhachHang());
        response.setTenDuong(createdDiaChi.getTenDuong());
        response.setXaPhuong(createdDiaChi.getXaPhuong());
        response.setQuanHuyen(createdDiaChi.getQuanHuyen());
        response.setTinhThanhPho(createdDiaChi.getTinhThanhPho());
        response.setTenNguoiNhan(createdDiaChi.getTenNguoiNhan());
        response.setSdtNguoiNhan(createdDiaChi.getSdtNguoiNhan());
        response.setNgayTao(createdDiaChi.getNgayTao());
        response.setNguoiTao(createdDiaChi.getNguoiTao());
        response.setLanCapNhatCuoi(createdDiaChi.getLanCapNhatCuoi());
        response.setNguoiCapNhat(createdDiaChi.getNguoiCapNhat());
        response.setTrangThai(createdDiaChi.getTrangThai());
        return ResponseEntity.status(201).body(response);
    }

    // Xóa địa chỉ
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDiaChi(@PathVariable Integer id) {
        diaChiService.deleteDiaChi(id);
        return ResponseEntity.noContent().build();
    }


}

package com.example.regal.controller;


import com.example.regal.entity.GioHang;
import com.example.regal.ghn.GhnClient;
import com.example.regal.repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/shipping")
public class ShippingController {

    @Autowired
    private GhnClient ghnClient;

    @Autowired
    private GioHangRepository gioHangRepository;

    @PostMapping("/public/calculate-shipping-fee")
    public Map<String, Object> calculateShippingFee(@RequestParam Integer toDistrictId, @RequestParam String toWardCode, @RequestBody List<Integer> idGioHang) {
        List<GioHang> list = gioHangRepository.findAllById(idGioHang);
        Float kl = 0f;
        for(GioHang g : list){
            kl += 0.5f * g.getSoLuong();
        }
        Integer khoiLuong = kl.intValue() + 1;
        return ghnClient.calculateShippingFee(toDistrictId,toWardCode, khoiLuong);
    }

    @GetMapping("/public/province")
    public ResponseEntity<?> getProvince() {
        return new ResponseEntity<>(ghnClient.getProvince(), HttpStatus.OK);
    }

    @GetMapping("/public/district")
    public ResponseEntity<?> getDistrict(@RequestParam Integer provinceId) {
        return new ResponseEntity<>(ghnClient.getDistrict(provinceId), HttpStatus.OK);
    }

    @GetMapping("/public/wards")
    public ResponseEntity<?> getWard(@RequestParam Integer districtId) {
        return new ResponseEntity<>(ghnClient.getWard(districtId), HttpStatus.OK);
    }
}


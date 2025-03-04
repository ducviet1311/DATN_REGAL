package com.example.regal.utils;


import com.example.regal.entity.KhachHang;
import com.example.regal.entity.NhanVien;
import com.example.regal.repository.KhachHangRepository;
import com.example.regal.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        List<KhachHang> kh = khachHangRepository.findAll();
        List<NhanVien> nv = nhanVienRepository.findAll();
        for (KhachHang k : kh){
            k.setMatKhau(passwordEncoder.encode("123"));
        }
        for (NhanVien k : nv){
            k.setMatKhau(passwordEncoder.encode("123"));
        }
        khachHangRepository.saveAll(kh);
        nhanVienRepository.saveAll(nv);
    }
}


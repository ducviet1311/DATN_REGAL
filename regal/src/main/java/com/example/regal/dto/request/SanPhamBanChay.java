package com.example.regal.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamBanChay {

    private Integer idSanPham;
    private String tenSanPham;
    private String tenAnh;
    private Double giaBan;
}

package com.example.regal.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TopSanPhamDTO {

    private Integer id;
    private String tenSanPham;
    private Long tongSoLuongBan;
}

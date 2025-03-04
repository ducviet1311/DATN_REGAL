package com.example.regal.dto.request;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class DotGiamGiaRequest {

    private Integer giaTriGiam;

    private Timestamp ngayBatDau;

    private Timestamp ngayKetThuc;

    private String nguoiTao;

    private String nguoiCapNhat;

    private Integer trangThai;

    private List<Integer> listIdSp;
}

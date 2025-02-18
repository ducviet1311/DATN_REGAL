package com.example.regal.dto.request;

import lombok.Data;

@Data
public class ChatLieuRequest {
    private String tenChatLieu;
    private String nguoiTao;
    private String nguoiCapNhat;
    private Integer trangThai;
}

package com.example.regal.service;

import com.example.regal.dto.request.ChatLieuRequest;
import com.example.regal.entity.ChatLieu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface ChatLieuService {
    List<ChatLieu> getAllChatLieu();

    Optional<ChatLieu> getChatLieuById(Integer id);

    ChatLieu createChatLieu(ChatLieuRequest requestDTO);

    ChatLieu updateChatLieu(Integer id, ChatLieuRequest requestDTO);

    void deleteChatLieu(Integer id);

    List<ChatLieu> findByTenAndTrangThai(String ten, Integer trangThai);
    boolean existsByTenChatLieu(String tenChatLieu);
    Page<ChatLieu> getAllChatLieuPaginated(int page, int size);
}


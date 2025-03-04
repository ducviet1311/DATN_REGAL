package com.example.regal.service.impl;

import com.example.regal.entity.Anh;
import com.example.regal.repository.AnhRepository;
import com.example.regal.service.AnhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnhServiceImp implements AnhService {
    @Autowired
    AnhRepository anhRepository;
    @Override
    public List<Anh> getAll() {
        return anhRepository.findAll();
    }
}

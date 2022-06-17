package com.its.member.service;

import com.its.member.dto.ProductDTO;
import com.its.member.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }
}

package com.its.member.service;

import com.its.member.dto.BoardDTO;
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

    public void insert(ProductDTO productDTO) {
        productRepository.insert(productDTO);
    }

    public ProductDTO findById(Long id) {
        return productRepository.findById(id);
    }

    public void update(ProductDTO productDTO) {
        productRepository.update(productDTO);
    }

    public void delete(Long id) {
        productRepository.delete(id);
    }
}

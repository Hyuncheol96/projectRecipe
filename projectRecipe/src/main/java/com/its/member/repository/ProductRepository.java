package com.its.member.repository;

import com.its.member.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<ProductDTO> findAll() {
        sql.insert("Product.test");
        return sql.selectList("Product.findAll");
    }
}

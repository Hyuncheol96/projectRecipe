package com.its.member.repository;

import com.its.member.dto.OrderListDTO;
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
        return sql.selectList("Product.findAll");
    }

    public void insert(ProductDTO productDTO) {
        sql.insert("Product.insert", productDTO);
    }

    public ProductDTO findById(Long id) {
        return sql.selectOne("Product.findById", id);
    }

    public void update(ProductDTO productDTO) {
        sql.update("Product.update", productDTO);
    }

    public void delete(Long id) {
        sql.delete("Product.delete", id);
    }

    public void orderList(OrderListDTO orderListDTO) {
        sql.insert("Product.orderList", orderListDTO);
    }


    // 한개
    public OrderListDTO orderFindById(String memberId) {
        return sql.selectOne("Product.orderFindById", memberId);
    }

    // 두개
//    public OrderListDTO orderFindById(String memberId) {
//        return sql.selectList("Product.orderFindById", memberId);
//    }

    public List<OrderListDTO> orderFindAll() {
        return sql.selectList("Product.orderFindAll");
    }
}

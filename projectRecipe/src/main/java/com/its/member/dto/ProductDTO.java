package com.its.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private Long id;
    private String productName;
    private int productPrice;
    private int productStock;
    private String productDist;
    private String productInfo;
    private Timestamp productCreatedDate;
}

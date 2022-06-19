package com.its.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderListDTO {
    private Long id;
    private Long productId;
    private String memberId;
    private String productName;
    private int productPrice;
}

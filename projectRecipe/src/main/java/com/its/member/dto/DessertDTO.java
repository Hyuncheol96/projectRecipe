package com.its.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DessertDTO {
    private Long id;
    private String dessertCategory;
    private String dessertTitle;
    private String dessertWriter;
    private String dessertContents;
    private int dessertHits;
    private Timestamp dessertCreatedDate;
}

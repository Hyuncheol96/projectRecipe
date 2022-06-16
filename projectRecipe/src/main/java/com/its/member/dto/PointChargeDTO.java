package com.its.member.dto;

import lombok.Data;

@Data
public class PointChargeDTO {

    private int point_idx;
    private int point_amount;
    private String point_date_time;
    private int user_user_idx;

}
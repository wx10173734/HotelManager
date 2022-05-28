package com.lzc.hotelmanager.core.common.page;

import lombok.Data;

@Data
public class VaptchaMessage {

    private Integer success; //验证结果，1为通过，0为失败

    private Integer score; //可信度，区间[0, 100]

    private String msg; //信息描述


}

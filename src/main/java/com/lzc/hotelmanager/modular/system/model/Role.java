package com.lzc.hotelmanager.modular.system.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Role {
    private Integer roleId;
    private String roleName;
    @JsonFormat(locale = "zh", timezone = "GMT", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date roleCreateTime;
    @JsonFormat(locale = "zh", timezone = "GMT", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date roleLastModifyTime;
}

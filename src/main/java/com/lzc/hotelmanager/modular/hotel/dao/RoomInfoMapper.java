package com.lzc.hotelmanager.modular.hotel.dao;

import com.lzc.hotelmanager.modular.hotel.model.RoomInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoomInfoMapper {
    int deleteByPrimaryKey(Integer roomId);

    int insertSelective(RoomInfo record);

    RoomInfo selectByPrimaryKey(Integer roomId);

    int updateByPrimaryKeySelective(RoomInfo record);

    List<RoomInfo> selectRoomInfoList(Map<String, Object> map);

    int getTotalRoomInfo(Map<String, Object> map);
}
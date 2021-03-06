package com.lzc.hotelmanager.modular.hotel.dao;

import com.lzc.hotelmanager.modular.hotel.model.RoomType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoomTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insertSelective(RoomType record);

    RoomType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(RoomType record);

    List<RoomType> selectRoomTypeList(Map<String, Object> map);

    int getTotalRoomType(Map<String, Object> map);
}
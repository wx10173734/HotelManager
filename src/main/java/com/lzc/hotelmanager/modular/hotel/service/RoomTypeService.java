package com.lzc.hotelmanager.modular.hotel.service;

import com.lzc.hotelmanager.modular.hotel.model.RoomType;

import java.util.List;
import java.util.Map;

public interface RoomTypeService {
    int saveRoomType(RoomType roomType);

    int updateRoomType(RoomType roomType);

    int deleteRoomType(Integer typeId);

    List<RoomType> selectRoomTypeList(Map<String, Object> map);

    int getTotalRoomType(Map<String, Object> map);

    RoomType findByTypeId(Integer typeId);
}

package com.lzc.hotelmanager.modular.hotel.service;

import com.lzc.hotelmanager.modular.hotel.model.RoomInfo;

import java.util.List;
import java.util.Map;

public interface RoomInfoService {
    int saveRoomInfo(RoomInfo roomInfo);

    int updateRoomInfo(RoomInfo roomInfo);

    int deleteRoomInfo(Integer roomId);

    List<RoomInfo> selectRoomInfoList(Map<String, Object> map);

    int getTotalRoomInfo(Map<String, Object> map);
}

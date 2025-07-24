package com.kh.homework0724.Room.vo;


import lombok.Data;

@Data
public class RoomVo {
    private String roomId;
    private String roomNumber;
    private String roomType;
    private String status;
    private String reserverName;
    private String checkinDate;
    private String checkoutDate;
    private String delYn;
}
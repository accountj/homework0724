package com.kh.homework0724.Room.mapper;


import com.kh.homework0724.Room.vo.RoomVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoomMapper {

    @Select("""
            SELECT *
            FROM ROOM
            WHERE DEL_YN = 'N'
            ORDER BY ROOM_NUMBER
            """)
    List<RoomVo> selectAll();


    @Insert("""
            INSERT INTO ROOM (
                ROOM_ID
                , ROOM_NUMBER
                , ROOM_TYPE
                , STATUS
                , RESERVER_NAME
                , CHECKIN_DATE
                , CHECKOUT_DATE
            ) VALUES (
                SEQ_ROOM.NEXTVAL
                , #{roomNumber}
                , #{roomType}
                , #{status}
                , #{reserverName}
                , #{checkinDate}
                , #{checkoutDate}
            )
            """)
    int insert(RoomVo vo);


    @Update("""
                UPDATE ROOM
                SET STATUS = #{status},
                    RESERVER_NAME = #{reserverName},
                    CHECKIN_DATE = TO_DATE(#{checkinDate}, 'YYYY-MM-DD'),
                    CHECKOUT_DATE = TO_DATE(#{checkoutDate}, 'YYYY-MM-DD')
                WHERE ROOM_ID = #{roomId}
            """)
    int update(RoomVo vo);



    @Delete("""
            UPDATE ROOM
            SET DEL_YN = 'Y'
            WHERE ROOM_ID = #{roomId}
            """)
    int delete(String roomId);


    @Select("""
            SELECT *
            FROM ROOM
            WHERE DEL_YN = 'N'
            AND ROOM_ID = #{roomId}
            """)
    RoomVo selectOne(String roomId);
}
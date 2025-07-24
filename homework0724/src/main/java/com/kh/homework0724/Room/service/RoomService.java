package com.kh.homework0724.Room.service;


import com.kh.homework0724.Room.mapper.RoomMapper;
import com.kh.homework0724.Room.vo.RoomVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class RoomService {

    private final RoomMapper mapper;

    public List<RoomVo> selectAll() {
        return mapper.selectAll();
    }

    public int insert(RoomVo vo) {
        return mapper.insert(vo);
    }

    public int update(RoomVo vo) {
        return mapper.update(vo);
    }

    public int delete(String roomId) {
        return mapper.delete(roomId);
    }

    public RoomVo selectOne(String roomId) {
        return mapper.selectOne(roomId);
    }
}
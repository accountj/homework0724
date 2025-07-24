package com.kh.homework0724.Room.api;


import com.kh.homework0724.Room.service.RoomService;
import com.kh.homework0724.Room.vo.RoomVo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/room")
@RequiredArgsConstructor
@CrossOrigin("http://192.168.20.152:5500")
public class RoomApiController {

    private final RoomService service;

    @GetMapping
    public ResponseEntity<List<RoomVo>> selectAll() {
        List<RoomVo> voList = service.selectAll();

        return ResponseEntity.ok().body(voList);
    }

    @GetMapping("{roomId}")
    public ResponseEntity<RoomVo> selectOne(@PathVariable String roomId) {
        RoomVo vo = service.selectOne(roomId);

        return ResponseEntity.ok().body(vo);
    }

    @PostMapping
    public ResponseEntity<Integer> insert(@RequestBody RoomVo vo) {
        int result = service.insert(vo);

        return ResponseEntity.ok().body(result);
    }

    @PutMapping
    public ResponseEntity<Integer> update(@RequestBody RoomVo vo) {
        int result = service.update(vo);

        return ResponseEntity.ok().body(result);
    }

    @DeleteMapping("{roomId}")
    public ResponseEntity<Integer> delete(@PathVariable String roomId) {
        int result = service.delete(roomId);

        return ResponseEntity.ok().body(result);
    }
}
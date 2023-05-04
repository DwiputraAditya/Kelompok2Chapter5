package com.binar.challenge4.controller;

import com.binar.challenge4.model.Seat;
import com.binar.challenge4.repository.SeatRepository;
import com.binar.challenge4.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/seats")
public class SeatController {
    @Autowired
    SeatService seatService;

    @GetMapping
    public ResponseEntity<List<Seat>> getAllSeat(){
        List<Seat> seats = seatService.getAllSeat();
        return ResponseEntity.ok(seats);

    }
    @PostMapping
    public ResponseEntity<Seat> addSeat(@RequestParam(name = "seat_number") Long seatNumber, @RequestParam(name = "is_available") boolean isAvailable, @RequestParam(name = "studio") String studioName) throws Exception{
        Seat addSeat = seatService.addSeats(seatNumber, isAvailable, studioName);
        return new ResponseEntity<>(addSeat, HttpStatus.CREATED);

    }
}

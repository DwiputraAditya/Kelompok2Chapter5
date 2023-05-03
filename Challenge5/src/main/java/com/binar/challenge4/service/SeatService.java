package com.binar.challenge4.service;

import com.binar.challenge4.model.Schedule;
import com.binar.challenge4.model.Seat;
import com.binar.challenge4.repository.ScheduleRepository;
import com.binar.challenge4.repository.SeatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeatService {
    @Autowired
    private SeatRepository seatRepository;
    @Autowired
    private ScheduleRepository scheduleRepository;

    public Seat getAllSeatAvailable(Long scheduleId, Boolean avail) {
        Schedule scheduleById = scheduleRepository.findScheduleByScheduleId(scheduleId);
        Long id = scheduleById.getScheduleId();
        List<Seat> allByStudiosIdAndIsAvailable = seatRepository.findAllBySeatIdAndAndIsAvailable(id, true);
        return (Seat) allByStudiosIdAndIsAvailable;
    }
}

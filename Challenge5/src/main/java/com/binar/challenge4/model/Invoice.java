package com.binar.challenge4.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "invoice")
public class Invoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long invoiceId;

    /*@ManyToOne
    @JoinColumn(name = "user_id")
    @JsonIgnore
    private User user;*/

    @ManyToOne
    @JoinColumn(name = "film_code")
    private Film film;

    @ManyToOne
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;

    @ManyToOne
    @JoinColumn(name = "seat_id")
    private Seat seats;
}

package com.binar.challenge4.repository;

import com.binar.challenge4.model.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
}

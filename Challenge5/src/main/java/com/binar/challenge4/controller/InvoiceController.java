package com.binar.challenge4.controller;

import com.binar.challenge4.model.Film;
import com.binar.challenge4.model.Invoice;
import com.binar.challenge4.model.Seat;
import com.binar.challenge4.service.InvoiceService;
import com.binar.challenge4.service.SeatService;
import net.bytebuddy.implementation.auxiliary.AuxiliaryType;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@RestController
@RequestMapping("/booking")
public class InvoiceController {
    @Autowired
    private SeatService seatService;
    @Autowired
    private InvoiceService invoiceService;

    @Autowired
    private HttpServletResponse response;

    @GetMapping("/getAllInvoice")
    public ResponseEntity<List<Invoice>> getAllInvoice() {
        List<Invoice> allInvoice = invoiceService.getAllInvoice();
        return ResponseEntity.ok(allInvoice);
    }

    @GetMapping("/generateInvoice")
    public void getInvoiceReport(String filmName) throws Exception{
        response.setContentType("application/pdf");
        response.setHeader("Content-disposition", "attachment; filename=\"film.pdf\"");
        JasperPrint jasperPrint = invoiceService.generateInvoice(filmName);
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }

    /*public InvoiceController(SeatService seatService, InvoiceService invoiceService) {
        this.seatService = seatService;
        this.invoiceService = invoiceService;
    }

    @GetMapping("/generatePdf")
    public ResponseEntity<JasperPrint> getInvoicePrint(HttpServletResponse response, @RequestParam(name = "invoiceId") Long invoiceId) throws IOException, JRException {
        JasperPrint jasperPrint = invoiceService.generateInvoice(invoiceId);
        response.setContentType("application/x-download");
        response.addHeader("Content-disposition", "attachment; filename=invoice_report.pdf");
        OutputStream out = response.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint,out);
        return ResponseEntity.ok(jasperPrint);
    }

    @GetMapping("/seatAvailable")
    public ResponseEntity<Seat> checkSeatAvailability(@RequestParam(value = "scheduleId") Long schedule){
        Seat allSeatAvailable = seatService.getAllSeatAvailable(schedule, true);
        return new ResponseEntity<>(allSeatAvailable, HttpStatus.OK);
    }*/

}

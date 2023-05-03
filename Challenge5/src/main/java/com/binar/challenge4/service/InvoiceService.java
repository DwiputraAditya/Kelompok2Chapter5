package com.binar.challenge4.service;

import com.binar.challenge4.model.Invoice;
import com.binar.challenge4.repository.InvoiceRepository;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import javax.sql.*;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class InvoiceService {

    @Autowired
    private DataSource dataSource;
    @Autowired
    private InvoiceRepository invoiceRepository;

    public List<Invoice> getAllInvoice() {
        return invoiceRepository.findAll();
    }

    public Connection getConnection(){
        try {
            return dataSource.getConnection();
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public JasperPrint generateInvoice(String parameter) throws Exception{
        InputStream fileReport = new ClassPathResource("report/Film.jasper").getInputStream();
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(fileReport);
        Map<String, Object> params = new HashMap<>();
        params.put("filmName", "%"+parameter+"%");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, getConnection());
        return jasperPrint;
    }

    /*public InvoiceService(InvoiceRepository invoiceRepository) {
        this.invoiceRepository = invoiceRepository;
    }

    public Invoice createInvoice(Invoice invoice) {
        return invoiceRepository.save(invoice);
    }

    public JasperPrint generateInvoice(Long invoiceId) throws FileNotFoundException, JRException {

        Invoice invoice = invoiceRepository.findById(invoiceId).orElseThrow(() -> new FileNotFoundException("file tidak ditemukan"));
        Map<String, Object> dataMap = dataParameter(invoice);
        List<Invoice> invoiceCollect = new LinkedList<>();
        invoiceCollect.add(invoice);
        dataMap.put("userData", new JRBeanCollectionDataSource(invoiceCollect));
        JasperPrint jasperPrint = JasperFillManager.fillReport(
                JasperCompileManager.compileReport(
                        ResourceUtils.getFile("invoice.jrxml")
                                .getAbsolutePath())
                , dataMap
                , new JREmptyDataSource()
        );
        return jasperPrint;
    }

    public Map<String, Object> dataParameter(Invoice invoice){
        String username = invoice.getUser().getUserName();
        String filmStart = String.format(invoice.getSchedule().getStartHour().toString(), "HH:MM");
        String filmEnd = String.format(invoice.getSchedule().getEndHour().toString(), "HH:MMta");
//        String studioCode = invoice.getSchedule().getStudio().getStudioCode();
        String filmName = invoice.getSchedule().getFilm().getFilmName();
        String seat = invoice.getSeats().getSeatNumber().toString();

        Map<String, Object> dataMap = new HashMap<>();
//        dataMap.put("studioCode", studioCode);
        dataMap.put("userId", username);
        dataMap.put("movieTittle", filmName);
        dataMap.put("movieStart", filmStart);
        dataMap.put("movieEnd", filmEnd);
        dataMap.put("seat", seat);
        dataMap.put("id", "12212");
        return dataMap;
    }*/
}

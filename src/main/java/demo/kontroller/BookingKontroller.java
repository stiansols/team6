/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import Klasser.Booking;
import database.DbConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author Seva
 */
@Controller
public class BookingKontroller {
    private DbConnection db = new DbConnection();
    
    public Date convertToDate(String dato) {
        
        String[] regex = dato.split("-");
        int[] intDato = new int[regex.length];
        for(int i=0; i<regex.length; i++) {
            intDato[i] = Integer.parseInt(regex[i]);
        }

        Date d = new Date(intDato[2], intDato[1]-1, intDato[0], intDato[3], intDato[4]);
        return d;
    }
    
    public boolean isBetween(Date dateToCheck, Date dateFrom, Date dateTil) {
        if(dateToCheck.after(dateFrom) && dateToCheck.before(dateTil)) return true;
        return false;
    }
    
    
    @RequestMapping(value="getBig", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] getAlleBookinger(@RequestParam ("dato") String datoInput) throws SQLException, Exception {
        ArrayList<Booking> bookinger = db.hentAlleBookinger();
        ArrayList<String> ikkeLedigRomnr = new ArrayList();
        
        Date fraDatoInput = convertToDate(datoInput.split(":")[0]);
        Date tilDatoInput = convertToDate(datoInput.split(":")[1]);
        
        for(Booking b: bookinger) {
            Date fraDatoBooking = convertToDate(b.getFratid());
            Date tilDatoBooking = convertToDate(b.getTiltid());
            
            if(isBetween(fraDatoInput, fraDatoBooking, tilDatoBooking) || isBetween(tilDatoInput, fraDatoBooking, tilDatoBooking) 
                    || isBetween(fraDatoBooking, fraDatoInput, tilDatoInput)) {
                ikkeLedigRomnr.add(b.getRomNummer());
            }
        }
        
        return ikkeLedigRomnr.toArray(new String[ikkeLedigRomnr.size()]);
    }
}

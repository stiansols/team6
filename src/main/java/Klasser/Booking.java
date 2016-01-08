/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;
import java.*;
import java.util.Date;
/**
 *
 * @author Archimedes
 */
public class Booking {
    private int bookingId;
    private String brukernavn;
    private String romNummer;
    private Date fratid;
    private Date tiltid;
    private boolean innsjekket;
    
    public Booking(int bookingId, String brukernavn, String romNummer, Date fratid, Date tiltid){
        this.bookingId = bookingId;
        this.brukernavn = brukernavn;
        this.romNummer = romNummer;
        this.fratid = fratid;
        this.tiltid = tiltid;
        innsjekket = false;
        
    }
    
    public Booking() {}

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setBrukernavn(String brukernavn) {
        this.brukernavn = brukernavn;
    }

    public void setRomNummer(String romNummer) {
        this.romNummer = romNummer;
    }

    public void setFratid(Date fratid) {
        this.fratid = fratid;
    }

    public void setTiltid(Date tiltid) {
        this.tiltid = tiltid;
    }

    public int getBookingId() {
        return bookingId;
    }

    public String getBrukernavn() {
        return brukernavn;
    }

    public String getRomNummer() {
        return romNummer;
    }

    public Date getFratid() {
        return fratid;
    }

    public Date getTiltid() {
        return tiltid;
    }
    
    public void sjekkInn() {
        innsjekket = true;
    }
    
}

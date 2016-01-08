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
    private String fratid;
    private String tiltid;
    
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

    public void setFratid(String fratid) {
        this.fratid = fratid;
    }

    public void setTiltid(String tiltid) {
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

    public String getFratid() {
        return fratid;
    }

    public String getTiltid() {
        return tiltid;
    }
}

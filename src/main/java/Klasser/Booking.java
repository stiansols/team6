/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;
import java.*;
import java.sql.Timestamp;
import java.util.Date;
/**
 *
 * @author Archimedes
 */
public class Booking {
    private int bookingId;
    private String brukernavn;
    private String romNummer;
    private Timestamp fratid;
    private Timestamp tiltid;
    
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

    public void setFratid(Timestamp fratid) {
        this.fratid = fratid;
    }

    public void setTiltid(Timestamp tiltid) {
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

    public Timestamp getFratid() {
        return fratid;
    }

    public Timestamp getTiltid() {
        return tiltid;
    }
    
    public String toString(){
        String res = "Booking: "+bookingId+" \n Romnr: "+romNummer+" \n Fra: "+fratid+" \n Til: "+tiltid+" \n";
        return res;
    }
}

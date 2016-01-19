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
    private String fratid;
    private String tiltid;
    private int brukertype;
    
    public Booking() {}

    public Booking(String brukernavn, String romNummer, String fratid, String tiltid, int brukertype) {
        this.brukernavn = brukernavn;
        this.romNummer = romNummer;
        this.fratid = fratid;
        this.tiltid = tiltid;
        this.brukertype = brukertype;
    }
    
    

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getBrukertype() {
        return brukertype;
    }

    public void setBrukertype(int brukertype) {
        this.brukertype = brukertype;
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
    
    public String toString(){
        String res = "Booking: "+bookingId+" \n Romnr: "+romNummer+" \n Fra: "+fratid+" \n Til: "+tiltid+" \n";
        return res;
    }
}

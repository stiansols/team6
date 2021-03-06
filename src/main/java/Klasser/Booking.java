/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;
import java.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Archimedes
 */
public class Booking implements Comparable<Booking>{
    private int bookingId;
    private String brukernavn;
    private String romNummer;
    private String fratid;
    private String tiltid;
    public boolean sjekketInn;
    private int brukertype;
    
    /**
     *
     */
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

    /**
     *
     * @return
     */
    public int getBrukertype() {
        return brukertype;
    }
    
    /**
     *
     * @return
     */
    public boolean getSjekketInn(){
        return sjekketInn;
    }
    
    /**
     *
     * @param verdi
     */
    public void setSjekketInn(boolean verdi){
        this.sjekketInn = verdi;
    }

    /**
     *
     * @param brukertype
     */
    public void setBrukertype(int brukertype) {
        this.brukertype = brukertype;
    }

    /**
     *
     * @param brukernavn
     */
    public void setBrukernavn(String brukernavn) {
        this.brukernavn = brukernavn;
    }

    /**
     *
     * @param romNummer
     */
    public void setRomNummer(String romNummer) {
        this.romNummer = romNummer;
    }

    /**
     *
     * @param fratid
     */
    public void setFratid(String fratid) {
        this.fratid = fratid;
    }

    /**
     *
     * @param tiltid
     */
    public void setTiltid(String tiltid) {
        this.tiltid = tiltid;
    }

    /**
     *
     * @return
     */
    public int getBookingId() {
        return bookingId;
    }

    /**
     *
     * @return
     */
    public String getBrukernavn() {
        return brukernavn;
    }

    /**
     *
     * @return
     */
    public String getRomNummer() {
        return romNummer;
    }

    /**
     *
     * @return
     */
    public String getFratid() {
        return fratid;
    }

    /**
     *
     * @return
     */
    public String getTiltid() {
        return tiltid;
    }
    
    /**
     * toString-metode
     * Returnerer en String med bookingId, Romnr, Fratid og Tiltid.
     * @return 
     */
    public String toString(){
        String res = "Booking: "+bookingId+" \n Romnr: "+romNummer+" \n Fra: "+fratid+" \n Til: "+tiltid+" \n Sjekket inn: "+ sjekketInn;
        return res;
    }
    
    @Override
    public int compareTo(Booking b){   
        

        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
        Date fra = null;
        try {
            fra = formatter.parse(this.getFratid());
        } catch (ParseException ex) {
            Logger.getLogger(Booking.class.getName()).log(Level.SEVERE, null, ex);
        }
        Date fra2 = null;
        try {
            fra2 = formatter.parse(b.getFratid());
        } catch (ParseException ex) {
            Logger.getLogger(Booking.class.getName()).log(Level.SEVERE, null, ex);
        }



        if (fra.before(fra2)){
            return 1;
        }
        if(fra.after(fra2)){
            return -1;
        }

        return 0;
    }
    
}

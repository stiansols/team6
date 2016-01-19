/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

import java.*;
import java.util.ArrayList;

/**
 *
 * @author Archimedes
 */
public class Bruker {
    String brukernavn;
    int brukertype;
    String navn;
    String passord;
    String mail;
    ArrayList<Booking> bookinger = new ArrayList();
    ArrayList<Avtale> avtaler = new ArrayList();
    ArrayList<UndervisningsTime> timer = new ArrayList();
    
    /**
     *
     */
    public Bruker(){
    
    }

    /**
     *
     * @param brukernavn
     * @param brukertype
     * @param navn
     * @param passord
     * @param mail
     */
    public Bruker(String brukernavn, int brukertype, String navn, String passord, String mail){
            this.brukernavn = brukernavn; 
            this.brukertype = brukertype;
            this.navn = navn;
            this.passord = passord;
            this.mail = mail;
    }
    
    /**
     * Metoden returnerer en String med bookinger.
     * 
     * @return
     */
    public String getBookingerTekst(){
        String res = "";
        for(int i = 0; i < bookinger.size(); i++){
            res += bookinger.get(i).toString();
        }
        return res;
    }
    
    /**
     *
     * @return
     */
    public ArrayList<Booking> getBookingerListe(){
        return bookinger;
    }
    
    /**
     *
     * @param nyBooking
     */
    public void setBookinger(Booking nyBooking){
        bookinger.add(nyBooking);
    }
    
    /**
     *
     */
    public void fjernBookinger(){
        bookinger.clear();
    }
    
    /**
     *
     * @return
     */
    public ArrayList<Avtale> getAvtaler(){
        return avtaler;
    }
    
    /**
     *
     * @param nyAvtale
     */
    public void setAvtaler(Avtale nyAvtale){
        avtaler.add(nyAvtale);
    }
    
    /**
     *
     */
    public void fjernAvtaler(){
        avtaler.clear();
    }
    
    /**
     *
     * @return
     */
    public ArrayList<UndervisningsTime> getUndervisningsTimer(){
        return timer;
    }
    
    /**
     *
     * @param nyTime
     */
    public void setUndervisningsTime(UndervisningsTime nyTime){
        timer.add(nyTime);
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
     * @param brukernavn
     */
    public void setBrukernavn(String brukernavn) {
        this.brukernavn = brukernavn;
    }

    /**
     *
     * @return
     */
    public String getNavn() {
        return navn;
    }

    /**
     *
     * @param navn
     */
    public void setNavn(String navn) {
        this.navn = navn;
    }

    /**
     *
     * @return
     */
    public String getPassord() {
        return passord;
    }

    /**
     *
     * @param passord
     */
    public void setPassord(String passord) {
        this.passord = passord;
    }

    /**
     *
     * @return
     */
    public String getMail() {
        return mail;
    }

    /**
     *
     * @param mail
     */
    public void setMail(String mail) {
        this.mail = mail;
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
     * @param brukertype
     */
    public void setBrukertype(int brukertype) {
        this.brukertype = brukertype;
    }

    /**
     * Metoden returnerer en String med hvilken brukertype en bruker har
     * Sjekker en int som viser hvilken brukertype en bruker har, og returnerer en String med brukertypen.
     * 
     * @return
     */
    public String printBrukerType(){
        if (getBrukertype()==0) {
            return "Student";
        }else if (getBrukertype()==1){
            return "Ansatt";
        }else if (getBrukertype()==2){
            return "Timeplan Ansvarlig";
        }else if (getBrukertype()==3){
            return "Administrator";
        }else {
            return null;
        }
    }
}

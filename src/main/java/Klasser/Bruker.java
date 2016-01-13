/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

import java.*;

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
    
    public Bruker(){
    
    }
    public Bruker(String brukernavn, int brukertype, String navn, String passord, String mail){
            this.brukernavn = brukernavn; 
            this.brukertype = brukertype;
            this.navn = navn;
            this.passord = passord;
            this.mail = mail;
    }

    public String getBrukernavn() {
        return brukernavn;
    }

    public void setBrukernavn(String brukernavn) {
        this.brukernavn = brukernavn;
    }

    public String getNavn() {
        return navn;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public String getPassord() {
        return passord;
    }

    public void setPassord(String passord) {
        this.passord = passord;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getBrukertype() {
        return brukertype;
    }

    public void setBrukertype(int brukertype) {
        this.brukertype = brukertype;
    }


    public String printBrukerType(){
        if (getBrukertype()==1) {
            return "Administrator";
        }else if (getBrukertype()==2){
            return "Student";
        }else if (getBrukertype()==3){
            return "Ansatt";
        }else if (getBrukertype()==4){
            return "Timeplanadministrator";
        }else {
            return null;
        }
    }
}

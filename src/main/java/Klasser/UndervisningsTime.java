/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Klasser;

/**
 *
 * @author Eirik Saur
 */
public class UndervisningsTime extends Hendelse{
    
    private String romNr;
    private String lærer;
    private String fagKode;

    public String getRomNr() {
        return romNr;
    }

    public void setRomNr(String romNr) {
        this.romNr = romNr;
    }

    public String getLærer() {
        return lærer;
    }

    public void setLærer(String lærer) {
        this.lærer = lærer;
    }

    public String getFagKode() {
        return fagKode;
    }

    public void setFagKode(String fagKode) {
        this.fagKode = fagKode;
    }
    
}

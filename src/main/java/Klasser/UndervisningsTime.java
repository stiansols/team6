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

    /**
     *
     * @return
     */
    public String getRomNr() {
        return romNr;
    }

    /**
     *
     * @param romNr
     */
    public void setRomNr(String romNr) {
        this.romNr = romNr;
    }

    /**
     *
     * @return
     */
    public String getLærer() {
        return lærer;
    }

    /**
     *
     * @param lærer
     */
    public void setLærer(String lærer) {
        this.lærer = lærer;
    }

    /**
     *
     * @return
     */
    public String getFagKode() {
        return fagKode;
    }

    /**
     *
     * @param fagKode
     */
    public void setFagKode(String fagKode) {
        this.fagKode = fagKode;
    }
    
}

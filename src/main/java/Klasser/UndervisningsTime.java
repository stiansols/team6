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
public class UndervisningsTime{
    
    private String romNr;
    private String fagKode;
    private String fratid;
    private String tiltid;
    private String dato;

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

    public String getFratid() {
        return fratid;
    }

    public String getTiltid() {
        return tiltid;
    }

    public String getDato() {
        return dato;
    }

    public void setFratid(String fratid) {
        this.fratid = fratid;
    }

    public void setTiltid(String tiltid) {
        this.tiltid = tiltid;
    }

    public void setDato(String dato) {
        this.dato = dato;
    }
    
}

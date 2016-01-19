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
public class Rom {
    String romnr; 
    int etasje;
    int plasser;
    boolean harSmartboard;
    boolean harSkjerm;
    boolean harProsjektor;
    int tilgang;
    String coords;
    
    /**
     *
     * @param romnr
     * @param etasje
     * @param plasser
     * @param harSmartboard
     * @param harSkjerm
     * @param harProsjektor
     * @param tilgang
     */
    public Rom(String romnr, int etasje, int plasser, boolean harSmartboard, boolean harSkjerm, boolean harProsjektor, int tilgang) {
        this.romnr = romnr;
        this.etasje=etasje;
        this.plasser = plasser;
        this.harSmartboard = harSmartboard;
        this.harSkjerm = harSkjerm;
        this.harProsjektor=harProsjektor;
        this.tilgang = tilgang;
    }

    public Rom(){}

    /**
     *
     * @return
     */
    public String getRomnr() {
        return romnr;
    }

    /**
     *
     * @param romnr
     */
    public void setRomnr(String romnr) {
        this.romnr = romnr;
    }

    /**
     *
     * @return
     */
    public int getEtasje() {
        return etasje;
    }

    /**
     *
     * @param etasje
     */
    public void setEtasje(int etasje) {
        this.etasje = etasje;
    }

    /**
     *
     * @return
     */
    public int getPlasser() {
        return plasser;
    }
    
    /**
     *
     * @return
     */
    public String getCoords() {
        return coords;
    }
    
    /**
     *
     * @return
     */
    public String getShape() {
        if(coords.split(",").length > 4) return "poly";
        else return "rect";
    }

    /**
     *
     * @param plasser
     */
    public void setPlasser(int plasser) {
        this.plasser = plasser;
    }

    /**
     *
     * @return
     */
    public boolean getHarSmartboard() {
        return harSmartboard;
    }

    /**
     *
     * @param harSmartboard
     */
    public void setHarSmartboard(boolean harSmartboard) {
        this.harSmartboard = harSmartboard;
    }

    /**
     *
     * @return
     */
    public boolean getHarSkjerm() {
        return harSkjerm;
    }

    /**
     *
     * @param harSkjerm
     */
    public void setHarSkjerm(boolean harSkjerm) {
        this.harSkjerm = harSkjerm;
    }

    /**
     *
     * @return
     */
    public boolean getHarProsjektor() {
        return harProsjektor;
    }

    /**
     *
     * @param harProsjektor
     */
    public void setHarProsjektor(boolean harProsjektor) {
        this.harProsjektor = harProsjektor;
    }

    /**
     *
     * @return
     */
    public int getTilgang() {
        return tilgang;
    }

    /**
     *
     * @param tilgang
     */
    public void setTilgang(int tilgang) {
        this.tilgang = tilgang;
    }
    
    /**
     *
     * @param coords
     */
    public void setCoords(String coords) {
        this.coords = coords;
    }
    
    /**
     * toString-metode som returnerer en String som inneholder alle attributtene til et Rom.
     * 
     * @return 
     */
    public String toString(){
        return romnr + " " +etasje+ " "+  " " + plasser+" "+ harSmartboard+" "+ harSkjerm+" "+ harProsjektor+" "+ tilgang;
    }
}



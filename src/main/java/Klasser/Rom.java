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
    
    public Rom(String romnr, int etasje, int plasser, boolean harSmartboard, boolean harSkjerm, boolean harProsjektor, int tilgang) {
        this.romnr = romnr;
        this.etasje=etasje;
        this.plasser = plasser;
        this.harSmartboard = harSmartboard;
        this.harSkjerm = harSkjerm;
        this.harProsjektor=harProsjektor;
        this.tilgang = tilgang;
    }

    public String getRomnr() {
        return romnr;
    }

    public void setRomnr(String romnr) {
        this.romnr = romnr;
    }

    public int getEtasje() {
        return etasje;
    }

    public void setEtasje(int etasje) {
        this.etasje = etasje;
    }

    public int getPlasser() {
        return plasser;
    }
    
    public String getCoords() {
        return coords;
    }

    public void setPlasser(int plasser) {
        this.plasser = plasser;
    }

    public boolean isHarSmartboard() {
        return harSmartboard;
    }

    public void setHarSmartboard(boolean harSmartboard) {
        this.harSmartboard = harSmartboard;
    }

    public boolean isHarSkjerm() {
        return harSkjerm;
    }

    public void setHarSkjerm(boolean harSkjerm) {
        this.harSkjerm = harSkjerm;
    }

    public boolean isHarProsjektor() {
        return harProsjektor;
    }

    public void setHarProsjektor(boolean harProsjektør) {
        this.harProsjektor = harProsjektor;
    }

    public int getTilgang() {
        return tilgang;
    }

    public void setTilgang(int tilgang) {
        this.tilgang = tilgang;
    }
    
    public void setCoords(String coords) {
        this.coords = coords;
    }
    
    public String toString(){
        return romnr + " " +etasje+ " "+  " " + plasser+" "+ harSmartboard+" "+ harSkjerm+" "+ harProsjektor+" "+ tilgang;
    }
}



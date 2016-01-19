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
public class Avtale extends Hendelse{
    
    private boolean hemmelig;
    private String romNr;
    
    /**
     *
     * @return
     */
    public String getRomNr(){
        return romNr;
    }
    
    /**
     *
     * @param nyttRomNr
     */
    public void setRomNr(String nyttRomNr){
        this.romNr = nyttRomNr;
    }

    /**
     *
     * @return
     */
    public boolean isHemmelig() {
        return hemmelig;
    }

    /**
     *
     * @param hemmelig
     */
    public void setHemmelig(boolean hemmelig) {
        this.hemmelig = hemmelig;
    }
}

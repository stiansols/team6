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
public class Fag {
    private String fagkode;
    private String navn;
    
    /**
     *
     */
    public Fag(){
        
    }

    /**
     *
     * @param fagkode
     * @param navn
     */
    public Fag(String fagkode, String navn) {
        this.fagkode = fagkode;
        this.navn = navn;
    }

    /**
     *
     * @param fagkode
     */
    public void setFagkode(String fagkode) {
        this.fagkode = fagkode;
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
    public String getFagkode() {
        return fagkode;
    }

    /**
     *
     * @return
     */
    public String getNavn() {
        return navn;
    }
}

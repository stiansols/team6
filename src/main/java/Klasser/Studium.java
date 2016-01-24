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
public class Studium {
    private int studieId;
    private String studiekode;
    private String studienavn;
    private ArrayList<Fag> fagliste = new ArrayList();
    
    /**
     *
     */
    public Studium(){
        
    }

    /**
     *
     * @param studieId
     * @param studiekode
     * @param studienavn
     */
    public Studium(int studieId, String studiekode, String studienavn) {
        this.studieId = studieId;
        this.studiekode = studiekode;
        this.studienavn = studienavn;
    }

    /**
     *
     * @return
     */
    public int getStudieId() {
        return studieId;
    }

    /**
     *
     * @return
     */
    public String getStudiekode() {
        return studiekode;
    }

    /**
     *
     * @return
     */
    public String getStudienavn() {
        return studienavn;
    }

    /**
     *
     * @param studieId
     */
    public void setStudieId(int studieId) {
        this.studieId = studieId;
    }

    /**
     *
     * @param studiekode
     */
    public void setStudiekode(String studiekode) {
        this.studiekode = studiekode;
    }

    /**
     *
     * @param studienavn
     */
    public void setStudienavn(String studienavn) {
        this.studienavn = studienavn;
    }

    public ArrayList<Fag> getFagliste() {
        return fagliste;
    }

    public void setFagliste(ArrayList<Fag> fagliste) {
        this.fagliste = fagliste;
    }

    
}

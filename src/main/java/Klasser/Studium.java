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
    
    public Studium(){
        
    }

    public Studium(int studieId, String studiekode, String studienavn) {
        this.studieId = studieId;
        this.studiekode = studiekode;
        this.studienavn = studienavn;
    }

    public int getStudieId() {
        return studieId;
    }

    public String getStudiekode() {
        return studiekode;
    }

    public String getStudienavn() {
        return studienavn;
    }

    public void setStudieId(int studieId) {
        this.studieId = studieId;
    }

    public void setStudiekode(String studiekode) {
        this.studiekode = studiekode;
    }

    public void setStudienavn(String studienavn) {
        this.studienavn = studienavn;
    }

    
}

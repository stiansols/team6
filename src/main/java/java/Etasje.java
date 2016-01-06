/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java;
import java.util.ArrayList;
import database.DbConnection;
/**
 *
 * @author Sondre
 */

public class Etasje {
    int etasjenr; 
    ArrayList<Rom> romliste = new ArrayList(); 
    
    public Etasje(){
        
    }

    public ArrayList<Rom> getRomliste() {
        return romliste;
    }

    public void setRomliste(ArrayList<Rom> romliste) {
        this.romliste = romliste;
    }

    public int getEtasjenr() {
        return etasjenr;
    }

    public void setEtasjenr(int etasjenr) {
        this.etasjenr = etasjenr;
    }
    
    public void hentRom(){
        DbConnection conn = new DbConnection();
        
    }
    
}

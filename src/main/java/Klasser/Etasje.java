/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;
import java.*;
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
    
    public void hentRom() throws Exception{
        DbConnection conn = new DbConnection();
        String romnr; 
        int etasje; 
        int plasser;
        boolean harSmartboard;
        boolean harSkjerm;
        boolean harProsjektor;
        int tilgang;
        int k = conn.executeQueryInt("Select count(distinct romnr) from rom");
        
        for(int i = 0; i<k; i++){
            romnr = conn.executeQueryString("Select romnr from rom LIMIT"+(k+1)+",1");
            etasje = conn.executeQueryInt("Select etasje from rom LIMIT"+(k+1)+",1");
            plasser = conn.executeQueryInt("Select plasser from rom LIMIT"+(k+1)+",1");
            harSmartboard = conn.executeQueryBoolean("Select harSmartboard from rom LIMIT"+(k+1)+",1", 4);
            harSkjerm = conn.executeQueryBoolean("Select harSmartboard from rom LIMIT"+(k+1)+",1", 5);
            harProsjektor = conn.executeQueryBoolean("Select harSmartboard from rom LIMIT"+(k+1)+",1", 6);
            tilgang = conn.executeQueryInt("Select tilgang from rom LIMIT"+(k+1)+",1");
            
            System.out.println(romnr);
            
            Rom rom = new Rom(romnr, etasje, plasser, harSmartboard, harSkjerm, harProsjektor, tilgang);
            romliste.add(rom);
           
        }
        
    }
    
}

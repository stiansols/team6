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
    
    /**
     *
     */
    public Etasje(){
        
    }

    /**
     *
     * @return
     */
    public ArrayList<Rom> getRomliste() {
        return romliste;
    }

    /**
     *
     * @param romliste
     */
    public void setRomliste(ArrayList<Rom> romliste) {
        this.romliste = romliste;
    }

    /**
     *
     * @return
     */
    public int getEtasjenr() {
        return etasjenr;
    }

    /**
     *
     * @param etasjenr
     */
    public void setEtasjenr(int etasjenr) {
        this.etasjenr = etasjenr;
    }
    
    /**
     *
     * @throws Exception
     */
    public void hentRom() throws Exception{
        DbConnection conn = new DbConnection();
        String romnr; 
        int etasje; 
        int plasser;
        boolean harSmartboard;
        boolean harSkjerm;
        boolean harProsjektor;
        int tilgang;
        
  /*      String q = conn.executeQueryString("SELECT romnr FROM rom LIMIT 0,1");
        
        System.out.println(q);
        
        int k = conn.executeQueryInt("SELECT COUNT(DISTINCT romnr) FROM rom");
        System.out.println(k);
        
        for(int i = 0; i<k; i++){
            romnr = conn.executeQueryString("SELECT romnr FROM rom LIMIT"+(i)+",1");
            etasje = conn.executeQueryInt("SELECT etasje FROM rom LIMIT"+(i)+",1");
            plasser = conn.executeQueryInt("SELECT plasser FROM rom LIMIT"+(i)+",1");
            harSmartboard = conn.executeQueryBoolean("SELECT harSmartboard FROM rom LIMIT"+(i)+",1", 4);
            harSkjerm = conn.executeQueryBoolean("SELECT harSmartboard FROM rom LIMIT"+(i)+",1", 5);
            harProsjektor = conn.executeQueryBoolean("SELECT harSmartboard FROM rom LIMIT"+(i)+",1", 6);
            tilgang = conn.executeQueryInt("SELECT tilgang FROM rom LIMIT"+(i)+",1");
            
            System.out.println(romnr);
            
            Rom rom = new Rom(romnr, etasje, plasser, harSmartboard, harSkjerm, harProsjektor, tilgang);
            romliste.add(rom);
          
        }
     */   
    }
    
}

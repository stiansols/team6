/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Klasser;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Eirik Saur
 */
public class Hendelse {
    
    private int id;
    private Timestamp startTid;
    private Timestamp sluttTid;
    private String beskrivelse;    

    public int getId(){
        return id;
    }
    
    public void setId(int nyId){
        this.id = nyId;
    }
    public Timestamp getStartTid() {
        return startTid;
    }

    public void setStartTid(Timestamp startTid) {
        this.startTid = startTid;
    }

    public Timestamp getSluttTid() {
        return sluttTid;
    }

    public void setSluttTid(Timestamp sluttTid) {
        this.sluttTid = sluttTid;
    }

    public String getBeskrivelse() {
        return beskrivelse;
    }

    public void setBeskrivelse(String beskrivelse) {
        this.beskrivelse = beskrivelse;
    }
}

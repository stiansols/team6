/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Klasser;

import java.util.Date;

/**
 *
 * @author Eirik Saur
 */
public class Hendelse {
    
    private Date startTid;
    private Date sluttTid;
    private String beskrivelse;    

    public Date getStartTid() {
        return startTid;
    }

    public void setStartTid(Date startTid) {
        this.startTid = startTid;
    }

    public Date getSluttTid() {
        return sluttTid;
    }

    public void setSluttTid(Date sluttTid) {
        this.sluttTid = sluttTid;
    }

    public String getBeskrivelse() {
        return beskrivelse;
    }

    public void setBeskrivelse(String beskrivelse) {
        this.beskrivelse = beskrivelse;
    }
}

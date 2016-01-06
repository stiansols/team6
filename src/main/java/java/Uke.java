/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java;
import java.util.ArrayList;

/**
 *
 * @author Archimedes
 */
public class Uke {
    int ukeId;
    int ukenr;
    ArrayList<Dag> uke = new ArrayList<Dag>();
    
    public Uke(){
        
    }

    public int getUkeId() {
        return ukeId;
    }

    public void setUkeId(int ukeId) {
        this.ukeId = ukeId;
    }

    public int getUkenr() {
        return ukenr;
    }

    public void setUkenr(int ukenr) {
        this.ukenr = ukenr;
    }

    public ArrayList<Dag> getUke() {
        return uke;
    }

    public void setUke(ArrayList<Dag> uke) {
        this.uke = uke;
    }
    
    
}




/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;
import java.util.Date;
/**
 *
 * @author Archimedes
 */
public class Dag {
    int dagId;
    String navn;
    Date dato;
    boolean helligdag;

    public int getDagId() {
        return dagId;
    }

    public void setDagId(int dagId) {
        this.dagId = dagId;
    }

    public String getNavn() {
        return navn;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public Date getDato() {
        return dato;
    }

    public void setDato(Date dato) {
        this.dato = dato;
    }

    public boolean isHelligdag() {
        return helligdag;
    }

    public void setHelligdag(boolean helligdag) {
        this.helligdag = helligdag;
    }
    
}

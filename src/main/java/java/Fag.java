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
public class Fag {
    private String fagkode;
    private String navn;
    private ArrayList<Student> elever = new ArrayList<Student>();
    private ArrayList<Ansatt> lærere = new ArrayList<Ansatt>();

    public Fag(String fagkode, String navn) {
        this.fagkode = fagkode;
        this.navn = navn;
    }

    public void setFagkode(String fagkode) {
        this.fagkode = fagkode;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public void setElever(ArrayList<Student> elever) {
        this.elever = elever;
    }

    public void setLærere(ArrayList<Ansatt> lærere) {
        this.lærere = lærere;
    }

    public String getFagkode() {
        return fagkode;
    }

    public String getNavn() {
        return navn;
    }

    public ArrayList<Student> getElever() {
        return elever;
    }

    public ArrayList<Ansatt> getLærere() {
        return lærere;
    }
}

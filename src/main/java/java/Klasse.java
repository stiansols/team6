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
public class Klasse {
    ArrayList<Student> elever = new ArrayList<Student>();
    Fag fag;
    
    public Klasse(Fag fag) {
        this.fag = fag;
    }
    
    public Klasse(Fag fag, ArrayList<Student> elever) {
        this.fag = fag;
        this.elever = elever;
    }
    
    public void leggTilElev(Student student) {
        elever.add(student);
    }
    
    public void fjernElev(Student student) {
        elever.remove(student);
    }
    
    public void tomListe() {
        ArrayList<Student> tom = new ArrayList<Student>();
        elever = tom;
    }
    
}

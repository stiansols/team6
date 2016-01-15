/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

import java.*;
import database.DbConnection;

/**
 *
 * @author Archimedes
 */
public class Administrator extends Bruker {
    
    public Administrator(){

    }

    public String getBrukernavn() {
        return brukernavn;
    }

    public void setBrukernavn(String brukernavn) {
        this.brukernavn = brukernavn;
    }

    public String getNavn() {
        return navn;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public String getPassord() {
        return passord;
    }

    public void setPassord(String passord) {
        this.passord = passord;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    public void RegBruker(String brukernavn,int brukertype, String navn,String passord,String email,int type)throws Exception{
        DbConnection conn = new DbConnection();
        conn.executeUpdate("Insert into bruker (brukernavn,brukertype,navn,passord,mail) values('"+brukernavn+"'"+",'"+brukertype+"','"+navn+"'"+",'"+passord+"'"+",'"+email+"'"+")");  //","+type+""+")");
    }
    
    public void slettBruker(String brukernavn)throws Exception{
        DbConnection conn = new DbConnection();
        conn.executeUpdate("delete from bruker where brukernavn = '"+brukernavn+"'");
    }
    
   
    
    
}

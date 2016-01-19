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
    
    /**
     *
     */
    public Administrator(){

    }

    /**
     *
     * @return
     */
    public String getBrukernavn() {
        return brukernavn;
    }

    /**
     *
     * @param brukernavn
     */
    public void setBrukernavn(String brukernavn) {
        this.brukernavn = brukernavn;
    }

    /**
     *
     * @return
     */
    public String getNavn() {
        return navn;
    }

    /**
     *
     * @param navn
     */
    public void setNavn(String navn) {
        this.navn = navn;
    }

    /**
     *
     * @return
     */
    public String getPassord() {
        return passord;
    }

    /**
     *
     * @param passord
     */
    public void setPassord(String passord) {
        this.passord = passord;
    }

    /**
     *
     * @return
     */
    public String getMail() {
        return mail;
    }

    /**
     *
     * @param mail
     */
    public void setMail(String mail) {
        this.mail = mail;
    }
    
    /**
     * Registrerer en ny bruker i databasen.
     * Metoden tar inn den nødvendige informasjonen for en bruker og legger inn brukeren i brukertabellen i databasen.
     * 
     * @param brukernavn
     * @param brukertype
     * @param navn
     * @param passord
     * @param email
     * @param type
     * @throws Exception
     */
    public void RegBruker(String brukernavn,int brukertype, String navn,String passord,String email,int type)throws Exception{
        DbConnection conn = new DbConnection();
        conn.executeUpdate("Insert into bruker (brukernavn,brukertype,navn,passord,mail) values('"+brukernavn+"'"+",'"+brukertype+"','"+navn+"'"+",'"+passord+"'"+",'"+email+"'"+")");  //","+type+""+")");
    }
    
    /**
     * Sletter en bruker fra databasen. 
     * Metoden tar inn et brukernavn fra sluttbrukeren og sletter brukeren med dette brukernavnet fra databasen.
     * 
     * @param brukernavn
     * @throws Exception
     */
    public void slettBruker(String brukernavn)throws Exception{
        DbConnection conn = new DbConnection();
        conn.executeUpdate("delete from bruker where brukernavn = '"+brukernavn+"'");
    }
    
   
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author Eirik Saur
 */
public class test2 {
    public static void main(String [] args) throws Exception {
    
        try{
        DbConnection db = new DbConnection();
        
        String bruker = db.hentPassord("brukernavn1");
        System.out.println("Her skal det være ett passord: " +bruker);
        }
        catch(Exception e){
            System.out.println("feilmelding: ************" +e);
        }
        System.out.println("feilmelding: ************");
    }
    
}

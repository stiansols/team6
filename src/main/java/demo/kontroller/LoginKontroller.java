/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import Klasser.Bruker;
import database.DbConnection;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Seva
 */
@Controller
public class LoginKontroller {
    @RequestMapping("/innlogging")
    public String loggInn(@RequestParam String brukernavn,String passord) throws SQLException, Exception{
        
        DbConnection db = new DbConnection();
        Bruker bruker = null;
        
        try{
           bruker = db.loggInn(brukernavn, passord);
           if(bruker != null){
               switch(bruker.getBrukertype()){
                
                   case 1: System.out.println("Student"); break; //return studentGUI
                   case 2: System.out.println("Ansatt"); break;  //return ansattGUI
                   case 3: System.out.println("Admin"); break;   //return adminGUI
               }
               
               return "index";
           }
        
        else{
            System.out.println("ikke lik");
        }
        }
        catch(Exception e){
            System.out.println("Noe gikk galt: "+ e);
        }
        System.out.println("Feil brukernavn eller passord" + brukernavn);
        return "login";
        
    }
}

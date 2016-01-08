/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import Klasser.Rom;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import database.DbConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import org.springframework.web.bind.annotation.RequestParam;
/**
 *
 * @author Benjamin
 */
@Controller
public class Kontroller {
    
    
    static String sha1(String input) throws NoSuchAlgorithmException {
        MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
         
        return sb.toString();
    }
    
    @RequestMapping("/*")
    public String visStartView(){
        System.out.println("FEil ****************************");
     return "index";   
    }
    
    @RequestMapping("/romOversikt")
    public String visRomOversikt(){
        return "romOversikt";   
    }
    
    @RequestMapping("/booking")
    public String visBooking(){
        return "booking";   
    }
    
    @RequestMapping("/test")
    public String test(){
        return "test";   
    }
    
    @RequestMapping("/spam")
    public String loggInn(@RequestParam String brukernavn,String passord) throws SQLException, Exception{
        
        System.out.println("Her starter metoden");
        DbConnection db = new DbConnection();
       
        String pass1 = db.hentPassord(brukernavn);
        System.out.println("Her er passordet hentet ut");
        System.out.println("Her skall det ligg ett passord:  "+pass1);
        try{
            System.out.println(""+sha1(passord));
        if(pass1.equals(sha1(passord))){
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
        return "test";
        
    }
    
    
    @ModelAttribute("alleRom")
    public ArrayList getHobby() throws SQLException, Exception
    {
        ArrayList alleRom = new ArrayList();

        DbConnection et = new DbConnection();
        
        ArrayList<Rom> q = new ArrayList<>();
        try{
            
            q = et.hentRom(q);
            
         for(int i = 0; i < q.size(); i++){
            alleRom.add(q.get(i).getRomnr());
            
        }
                 
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
        

            return alleRom;
    }
}

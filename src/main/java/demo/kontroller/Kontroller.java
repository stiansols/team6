/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import Klasser.Booking;
import Klasser.Bruker;
import Klasser.Rom;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import database.DbConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMethod;
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
     return "login";   
    }
    
    @RequestMapping("/romOversikt")
    public String visRomOversikt(){
        return "romOversikt";   
    }
    
    @RequestMapping("/registrerBruker")
    public String regBruker(){
        return "registrerBruker";   
    }
    
    @RequestMapping("/oppdaterBruker")
    public String oppBruker(){
        return "oppdaterBruker";   
    }
     @RequestMapping("/admin")
    public String admin(){
        return "admin";   
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
    
    @ModelAttribute("alleBrukere")
    public ArrayList getBrukere() throws SQLException, Exception
    {
        ArrayList<Bruker> alleBrukere = new ArrayList();

        DbConnection et = new DbConnection();
        
        
        try{
            
            alleBrukere = et.hentAlleBrukere();
            

                 
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
        

            return alleBrukere;
    }
    
    @RequestMapping("/addBooking")
    public String visBooking(Model model){
        model.addAttribute("booking", new Booking());
        System.out.println("232");
        return "addBooking";   
    }
    
    @RequestMapping(value="/nyBooking", method=RequestMethod.POST)
    public String leggTilBooking(@ModelAttribute(value = "booking") Booking nyBooking) throws SQLException{

        DbConnection et = new DbConnection();
        
        String[] verdier = {"brukernavn1", nyBooking.getRomNummer(), ""+nyBooking.getFratid(), ""+nyBooking.getTiltid()};
        et.leggTil("booking", verdier); //brukernavn skal hentes fra sesjonen
        
        return "index";
    }
}

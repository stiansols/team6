
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import Klasser.Booking;
import Klasser.Bruker;
import Klasser.Fag;
import Klasser.Rom;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import database.DbConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Benjamin
 */
@Controller
@SessionAttributes("person")
public class Kontroller {
    
    @ModelAttribute("person")
    public Bruker getPerson(){
        return new Bruker();
    }
    
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
    
    
    @RequestMapping(value = "/etasjeVis", method = RequestMethod.POST)
    public ModelAndView getEtasje(@RequestParam String etasje) throws Exception {
        String url = "";

        switch (etasje) {
            case "1": url = "http://www.mediafire.com/convkey/9236/736fif9tr2s21zczg.jpg";
                      break;
            case "2": url = "http://www.mediafire.com/convkey/1183/670c89ehc1w9b2ozg.jpg";
                      break;
            case "3": url = "http://www.mediafire.com/convkey/64b7/ate3wife1pm8yskzg.jpg";
                      break;
            case "4": url = "http://www.mediafire.com/convkey/6543/kbjzj4ijm88nlv4zg.jpg";
                      break;
        }
        ModelAndView etasjeMV = new ModelAndView("visEtasjePlan","etasjeLink", url);
        return etasjeMV;
    }
    
    @RequestMapping(value = "/etasje", method = RequestMethod.POST)
    public String visEtasjeValg() {
        return "etasje";
    }
    
    @RequestMapping("/test")
    public String test(){
        return "test";   
    }
    
    @RequestMapping("/registrerBruker")
    public String regBruker(){
        return "registrerBruker";   
    }
    
    @RequestMapping("/oppdaterPersonlig")
    public String oppBruker(){
        return "oppdaterPersonlig";   
    }
     @RequestMapping("/admin")
    public String admin(){
        return "admin";   
    }

    @RequestMapping("/bruker")
    public String bruker(){return "bruker";}

    @RequestMapping("/innstillinger")
    public String innstillinger(){return "innstillinger";}

    
   
    
    @RequestMapping("/spam")
    public String loggInn(@RequestParam String brukernavn,String passord, @ModelAttribute(value="person") Bruker person) throws SQLException, Exception{
        
        DbConnection et = new DbConnection();
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
               Bruker b = et.hentBruker(brukernavn);
               person.setBrukernavn(b.getBrukernavn());
               person.setNavn(b.getNavn());
               person.setMail(b.getMail());
               person.setBrukertype(b.getBrukertype());
               for(int i = 0; i < b.getBookingerListe().size(); i++){
                   person.setBookinger(b.getBookingerListe().get(i));
               }
               for(int i = 0; i < b.getAvtaler().size(); i++){
                   person.setAvtaler(b.getAvtaler().get(i));
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
    
    
    @ModelAttribute("alleRom")
    public ArrayList getHobby() throws SQLException, Exception
    {
        ArrayList alleRom = new ArrayList();

        DbConnection et = new DbConnection();
        
        ArrayList<Rom> q = new ArrayList<>();
        try{

            q = et.hentRom(q);
            et.close();
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
            
            et.close();
                 
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
        

            return alleBrukere;
    }
    
    @ModelAttribute("alleFag")
    public ArrayList getFag() throws SQLException, Exception
    {
        ArrayList<Fag> alleFag = new ArrayList();
        DbConnection db = new DbConnection();
    
        try{
            alleFag = db.hentAlleFag();
            db.close();
                 
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
        
       return alleFag;
    }
    
    @RequestMapping("/addBooking")
    public String visBooking(Model model){
        model.addAttribute("booking", new Booking());
        System.out.println("232");
        return "addBooking";   
    }
    
    @RequestMapping(value="/nyBooking", method=RequestMethod.POST)
    public String leggTilBooking(@ModelAttribute(value = "booking") Booking nyBooking) throws Exception{

        DbConnection et = new DbConnection();
        
        String[] verdier = {"brukernavn1", nyBooking.getRomNummer(), ""+nyBooking.getFratid(), ""+nyBooking.getTiltid()};
        et.leggTil("booking", verdier); //brukernavn skal hentes fra sesjonen
        et.close();
        
        return "index";
    }
    
    @RequestMapping(value="/nyBruker", method=RequestMethod.POST)
    public String leggTilBruker(@ModelAttribute(value= "bruker")Bruker bruker)throws Exception{
        DbConnection db = new DbConnection();
        
        db.lagBruker(bruker.getBrukernavn(),bruker.getBrukertype(),bruker.getNavn(), bruker.getPassord(), bruker.getMail());
        db.close();
        
        return "redirect:admin";
        
    }
    
    @RequestMapping(value="/oppdater", method=RequestMethod.POST)
    public String oppdaterBruker(@ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception{

        DbConnection et = new DbConnection();
        
        et.oppdaterBruker(bruker.getBrukernavn(), bruker.getBrukertype(), bruker.getNavn(), bruker.getMail());
        et.close();
        
        return "redirect:admin";
    }
    
    @RequestMapping(value="/slett", method=RequestMethod.POST)
    public String slettBruker(@ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception{

        DbConnection et = new DbConnection();
        
       
        et.slettBruker(bruker.getBrukernavn());
        et.close();
        return "redirect:admin";
    }
    
    @RequestMapping(value="/oppdaterMail", method=RequestMethod.POST)
    public String oppdaterMail(@RequestParam String email, @ModelAttribute(value = "person") Bruker person) throws Exception{

        DbConnection et = new DbConnection();
        Bruker bruker = new Bruker();
        bruker.setMail(email);
        
        et.oppdaterMail(person.getBrukernavn(), bruker.getMail());
        et.close();
        
        return "redirect:admin";
    }
    
    @RequestMapping(value="/oppdaterPassord", method=RequestMethod.POST)
    public String oppdaterPassord(@RequestParam String passord, @ModelAttribute(value = "person") Bruker person) throws Exception{

        DbConnection et = new DbConnection();
        Bruker bruker = new Bruker();
        bruker.setPassord(passord);
        
        et.oppdaterPassord(person.getBrukernavn(), bruker.getPassord());
        et.close();
        
        return "redirect:admin";
    }      
    
    @RequestMapping(value="/leggTil", method=RequestMethod.POST)
    public String leggTilFag(@ModelAttribute(value= "nyttFagForm") Fag fag)throws Exception{
        DbConnection db = new DbConnection();
        
        db.leggTilFag(fag.getFagkode(), fag.getNavn());
        
        db.close();
        return "redirect:admin";
        
    }
    
     @RequestMapping(value="/slettFag", method=RequestMethod.POST)
    public String slettFag(@ModelAttribute(value= "slettFagForm") Fag fag)throws Exception{
        DbConnection db = new DbConnection();
        
        db.slettFag(fag.getFagkode());
        
        db.close();
        return "redirect:admin";
        
    }
   
    @ModelAttribute("alleStudIFag")
    public ArrayList getStudIFag(String fagkode) throws SQLException, Exception
    {
        ArrayList<String> studenter = new ArrayList();
        DbConnection db = new DbConnection();
    
        try{
            studenter = db.hentStudenterIFag("IT-01");
            db.close();
                 
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
        
       return studenter;
    }
   
   /* 
    @RequestMapping(value="/velgFag", method=RequestMethod.POST)
    public String velgFag(@RequestParam("data") String id )throws SQLException{
        DbConnection db = new DbConnection();
        ArrayList<String> studenter = new ArrayList();
        
        try {
            studenter = db.hentStudenterIFag(id);
        } catch (Exception ex) {
           
        }
        
        db.close();
        return "redirect:admin";
        
    }
*/
    
    

}

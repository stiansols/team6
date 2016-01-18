package demo.kontroller;

import Klasser.Booking;
import Klasser.Bruker;
import Klasser.Fag;
import Klasser.Rom;
import Klasser.Tidsintervall;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import database.DbConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Benjamin
 */
@Controller
@SessionAttributes("person")
public class Kontroller {

    private DbConnection db = new DbConnection();

    @ModelAttribute("person")
    public Bruker getPerson() {
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
    
    public void lastInnPerson(@ModelAttribute(value="person") Bruker person, String brukernavn) throws Exception {
        person.fjernBookinger();
        person.fjernAvtaler();
    Bruker b = db.hentBruker(brukernavn);
                person.setBrukernavn(b.getBrukernavn());
                person.setNavn(b.getNavn());
                person.setMail(b.getMail());
                person.setBrukertype(b.getBrukertype());
                for (int i = 0; i < b.getBookingerListe().size(); i++) {
                    person.setBookinger(b.getBookingerListe().get(i));
                }
                for (int i = 0; i < b.getAvtaler().size(); i++) {
                    person.setAvtaler(b.getAvtaler().get(i));
                }
    }


    @RequestMapping("/*")
    public String visStartView() throws Exception {
        Tidsintervall spamMail = new Tidsintervall();
                spamMail.run();
        return "login";
    }
    
    
    @RequestMapping("/index")
    public String getHovedisde(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "index";
    }
    
    @RequestMapping("/logut")
    public String getLogut(@ModelAttribute(value = "person") Bruker person , HttpSession session, SessionStatus status) {
        status.setComplete();
        session.removeAttribute("person");
        return "login";
    } 

    @RequestMapping("/romOversikt")
    public String visRomOversikt(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "romOversikt";
    }

    @RequestMapping(value = "/etasjeVis", method = RequestMethod.POST)
    public ModelAndView getEtasje(@RequestParam String etasje) throws Exception {
        String url = "";

        switch (etasje) {
            case "1":
                url = "http://www.mediafire.com/convkey/4033/d5amxa19msuu4x99g.jpg";
                break;
            case "2":
                url = "http://www.mediafire.com/convkey/f168/lmwe83xtax53qdh9g.jpg";
                break;
            case "3":
                url = "http://www.mediafire.com/convkey/6d08/5gaam91oken79zm9g.jpg";
                break;
            case "4":
                url = "http://www.mediafire.com/convkey/d436/3cz4at4dbhuohpm9g.jpg";
                break;
        }
        ModelAndView etasjeMV = new ModelAndView("visEtasjePlan", "etasjeLink", url);
        return etasjeMV;
    }

    @RequestMapping(value = "/etasje", method = RequestMethod.POST)
    public String visEtasjeValg(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "etasje";
    }

    @RequestMapping("/test")
    public String test(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "test";
    }

    @RequestMapping("/registrerBruker")
    public String regBruker(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        if(person.getBrukertype() != 3){
            return "index";
        }
        return "registrerBruker";
    }

    @RequestMapping("/oppdaterPersonlig")
    public String oppBruker(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "oppdaterPersonlig";
    }

    @RequestMapping("/admin")
    public String admin(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        if(person.getBrukertype() != 3){
            return "index";
        }
        return "admin";
    }

    @RequestMapping("/bruker")
    public String bruker(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "bruker";
    }

    @RequestMapping("/innstillinger")
    public String innstillinger(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "innstillinger";
    }

    @RequestMapping("/hjem")
    public String home(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "hjem";
    }

    @RequestMapping("/romOrganisering")
    public String romOrganisering(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "romOrganisering";}

    @RequestMapping("/spam")
    public String loggInn(@RequestParam String brukernavn, String passord, @ModelAttribute(value = "person") Bruker person) throws SQLException, Exception {
        Bruker bruker = null;

        try {
            bruker = db.loggInn(brukernavn, passord);
            if (bruker != null) {
                switch (bruker.getBrukertype()) {

                    case 0:
                        System.out.println("Student");
                        break; //return studentGUI
                    case 1:
                        System.out.println("Ansatt");
                        break;  //return ansattGUI
                    case 2:
                        System.out.println("Timeplanansvarlig");
                        break;   //return adminGUI
                    case 3:
                        System.out.println("Admin");
                        break;   //return adminGUI
                }
                Bruker b = db.hentBruker(brukernavn);
                person.setBrukernavn(b.getBrukernavn());
                person.setNavn(b.getNavn());
                person.setMail(b.getMail());
                person.setBrukertype(b.getBrukertype());
                for (int i = 0; i < b.getBookingerListe().size(); i++) {
                    person.setBookinger(b.getBookingerListe().get(i));
                }
                for (int i = 0; i < b.getAvtaler().size(); i++) {
                    person.setAvtaler(b.getAvtaler().get(i));
                }

                return "index";
            } else {
                System.out.println("ikke lik");
            }
        } catch (Exception e) {
            System.out.println("Noe gikk galt: " + e);
        }
        System.out.println("Feil brukernavn eller passord" + brukernavn);
        return "redirect:login";

    }

    @ModelAttribute("alleRom")
    public ArrayList getHobby() throws SQLException, Exception
    {
        ArrayList<Rom> alleRom = new ArrayList<>();
        try{

            alleRom = db.hentRom(alleRom);
            alleRom = db.hentCoords(alleRom);

        } catch (SQLException e) {
            System.out.println(e + " fail");
        }
        return alleRom;
    }
    @ModelAttribute("romForste")
    public ArrayList getRomForste() throws SQLException, Exception{
        ArrayList<Rom> romForste = new ArrayList<>();
        try {
            romForste = db.hentRomEtasje(1);
        } catch (SQLException e) {
            System.out.println(e + " fail");
        }
        return romForste;
    }
    @ModelAttribute("romAndre")
    public ArrayList getRomAndre() throws SQLException, Exception{
        ArrayList<Rom> rom = new ArrayList<>();
        try {
            rom = db.hentRomEtasje(2);
        } catch (SQLException e) {
            System.out.println(e + " fail");
        }
        return rom;
    }
    @ModelAttribute("romTredje")
    public ArrayList getRomTredje() throws SQLException, Exception{
        ArrayList<Rom> rom = new ArrayList<>();
        try {
            rom = db.hentRomEtasje(3);
        } catch (SQLException e) {
            System.out.println(e + " fail");
        }
        return rom;
    }
    @ModelAttribute("romFjerde")
    public ArrayList getRomFjerde() throws SQLException, Exception{
        ArrayList<Rom> rom = new ArrayList<>();
        try {
            rom = db.hentRomEtasje(4);
        } catch (SQLException e) {
            System.out.println(e + " fail");
        }
        return rom;
    }

    @ModelAttribute("alleBrukere")
    public ArrayList getBrukere() throws SQLException, Exception {
        ArrayList<Bruker> alleBrukere = new ArrayList();
        alleBrukere = db.hentAlleBrukere();
        return alleBrukere;
    }

    @ModelAttribute("alleFag")
    public ArrayList getFag() throws SQLException, Exception {
        ArrayList<Fag> alleFag = new ArrayList();
        alleFag = db.hentAlleFag();

        return alleFag;
    }

      @RequestMapping("/addBooking")
    public String visBooking(Model model,@ModelAttribute(value = "booking")Booking nyBooking, @ModelAttribute(value="person")Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        model.addAttribute("booking", new Booking());
        return "addBooking";
    }

    @RequestMapping(value = "/nyBooking", method = RequestMethod.POST)
    public String leggTilBooking(@ModelAttribute(value = "booking") Booking nyBooking, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        String [] stringFratid = nyBooking.getFratid().split("-");
        String fratids = stringFratid[2] +"-"+ stringFratid[1] + "-" + stringFratid[0];
        String[] stringTiltid = nyBooking.getTiltid().split("-");
        String tiltids = stringTiltid[2] +"-"+ stringTiltid[1] + "-" + stringTiltid[0];
        nyBooking.setFratid(fratids + "-00-00");
        nyBooking.setTiltid(tiltids + "-00-00");
        nyBooking.setBookingId(10);
        db.regBooking(person.getBrukernavn(), nyBooking, person.getBrukertype());
        
        lastInnPerson(person, person.getBrukernavn());

        return "index";
    }

    @RequestMapping(value = "/nyBruker", method = RequestMethod.POST)
    public String leggTilBruker(@RequestParam(value = "brukertypen") String brukertypen, @ModelAttribute(value = "nyBrukerForm") Bruker bruker, @ModelAttribute(value = "person")Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        if (brukertypen.equals("Student")) {
            bruker.setBrukertype(0);
        }
        if (brukertypen.equals("Ansatt")) {
            bruker.setBrukertype(1);
        }
        if (brukertypen.equals("TimeplanAnsvarlig")) {
            bruker.setBrukertype(2);
        }
        if (brukertypen.equals("Administrator")) {
            bruker.setBrukertype(3);
        }

        db.lagBruker(bruker.getBrukernavn(), bruker.getBrukertype(), bruker.getNavn(), bruker.getPassord(), bruker.getMail());
         String melding = "Det er opprettet en bruker konto på StudEasy for deg <br> Du kan logge inn for å endre mail og passord hvis du ønsker det <br><br> Dine opplysninger er: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+" <br>Velkomen til StudyEasy";
        String header = "Det er opprettet en brukerkonto på StudyEasy";
         db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";

    }

    @RequestMapping(value = "/oppdater", method = RequestMethod.POST)
    public String oppdaterBruker(@ModelAttribute(value = "brukerForm") Bruker bruker, @ModelAttribute(value = "person")Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        db.oppdaterBruker(bruker.getBrukernavn(), bruker.getBrukertype(), bruker.getNavn(), bruker.getPassord(), bruker.getMail());
        String melding = "Dine brukeropplysninger har blitt endret <br><br> Nåværende verdier: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";
    }

    @RequestMapping(value = "/slett", method = RequestMethod.POST)
    public String slettBruker(@ModelAttribute(value = "brukerForm") Bruker bruker, @ModelAttribute(value = "person")Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        db.slettBruker(bruker.getBrukernavn());

        return "redirect:admin";
    }

    @RequestMapping(value = "/oppdaterMail", method = RequestMethod.POST)
    public String oppdaterMail(@RequestParam String email, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        Bruker bruker = new Bruker();
        bruker.setMail(email);

        db.oppdaterMail(person.getBrukernavn(), bruker.getMail());
        String melding = "Gratulerer <br><br> Du har lyktes med å endre din mail <br> Din nye mail er: "+email+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";
    }

    @RequestMapping(value = "/oppdaterPassord", method = RequestMethod.POST)
    public String oppdaterPassord(@RequestParam String passord, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        Bruker bruker = new Bruker();
        bruker.setPassord(passord);

        db.oppdaterPassord(person.getBrukernavn(), bruker.getPassord());
        String melding = "Gratulerer <br><br> Du har lyktes med å endre ditt passord <br> Ditt nye passord er: "+passord+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";
    }

    @RequestMapping(value = "/leggTil", method = RequestMethod.POST)
    public String leggTilFag(@ModelAttribute(value = "nyttFagForm") Fag fag, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        db.leggTilFag(fag.getFagkode(), fag.getNavn());

        return "redirect:admin";

    }

    @RequestMapping(value = "/slettFag", method = RequestMethod.POST)
    public String slettFag(@ModelAttribute(value = "slettFagForm") Fag fag, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        db.slettFag(fag.getFagkode());

        return "redirect:admin";

    }

    @ModelAttribute("alleStudIFag")
    public ArrayList getStudIFag(String fagkode) throws SQLException, Exception {
        ArrayList<String> studenter = new ArrayList();
        studenter = db.hentStudenterIFag("IT-01");

        return studenter;
    }

    /* 
     @RequestMapping(value="/velgFag", method=RequestMethod.POST)
     public String velgFag(@RequestParam("data") String id )throws SQLException{
     ArrayList<String> studenter = new ArrayList();
        
     try {
     studenter = db.hentStudenterIFag(id);
     } catch (Exception ex) {
           
     }

     return "redirect:admin";
        
     }
     */
}

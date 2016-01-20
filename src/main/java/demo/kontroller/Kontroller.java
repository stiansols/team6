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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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
    
    public void lastInnPerson(@ModelAttribute(value="person")Bruker person) throws Exception{
        Bruker b = db.hentBruker(person.getBrukernavn());
        person.fjernAvtaler();
        person.fjernBookinger();
            
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
    
    public void LagSjekketInnListe(Model model,@ModelAttribute(value="person")Bruker person ){
    ArrayList<Booking> bookings = new ArrayList();                   
                    for(int i = 0; i< person.getBookingerListe().size(); i++){
                        if(person.getBookingerListe().get(i).getSjekketInn()== false){
                            bookings.add(person.getBookingerListe().get(i));
                        }
                        
                    }
                   
                model.addAttribute("brukerBookinger", bookings);
    }


    @RequestMapping("/*")
    public String visStartView(@ModelAttribute(value="person") Bruker person) throws Exception {
       if(person.getBrukertype()== 4){
                Tidsintervall spamMail = new Tidsintervall();
                spamMail.run();
                }
        return "login";
    }
    
    
    @RequestMapping("/index")
    public String getHovedisde(Model model, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        lastInnPerson(person);
        LagSjekketInnListe(model, person);
        return "index";
    }
    
    @RequestMapping("/logut")
    public String getLogut(@ModelAttribute(value = "person") Bruker person , HttpSession session, SessionStatus status) {
        status.setComplete();
        session.removeAttribute("person");
        return "login";
    } 
    
     @RequestMapping(value = "/sjekkInn", method = RequestMethod.POST)
    public String sjekkeInn(Model model, @RequestParam int buttonSupreme, @ModelAttribute(value="person")Bruker person) throws Exception {
        DbConnection db = new DbConnection();
        Date now = new Date();
        Booking bookings = db.getBooking(buttonSupreme);
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
        Date fra = formatter.parse(bookings.getFratid());
        if(now.after(fra)){
            db.setSjekketInn(buttonSupreme);
            LagSjekketInnListe(model, person);
            return "redirect:index";
        }
        return "denied";
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
        return "romOrganisering";
    }

      @RequestMapping(value = "/oppdaterrom", method = RequestMethod.POST)
    public String oppdaterRom(@ModelAttribute(value = "romForm")Rom rom,@ModelAttribute(value = "rom")Bruker person) throws Exception {
        try {
            db.oppdaterRom(rom.getRomnr(), rom.getEtasje(), rom.getPlasser(), rom.getHarSmartboard(), rom.getHarSkjerm(), rom.getHarProsjektor(), rom.getTilgang());
        }catch (Exception e){
            System.out.println("Noe gikk galt: " + e);
        }
        return "romOrganisering";
    }

    @RequestMapping("/spam")
    public String loggInn(Model model, @RequestParam String brukernavn, String passord, @ModelAttribute(value = "person") Bruker person) throws SQLException, Exception {
        Bruker bruker = null;
        
        try {
            bruker = db.loggInn(brukernavn, passord);
            if (bruker != null) {
                
                
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
                LagSjekketInnListe(model, person);
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
    
      @RequestMapping(value="test2", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
      @ResponseBody
      public String[] getStudIFag(@RequestParam ("data") String fagkode) throws SQLException, Exception {
          String studenter[] = null;
         // System.out.println(data);
          studenter = db.hentStudenterIFag(fagkode);
        // studenter = new String[10];
        //+ studenter[0] = "student1";
          return studenter;
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
    
    @ModelAttribute("brukerBookinger")
    public ArrayList<Booking> sjekkInn(@ModelAttribute(value="person") Bruker person){
    ArrayList<Booking> bookings = new ArrayList();
                    for(int i = 0; i<person.getBookingerListe().size(); i++){
                        bookings.add(person.getBookingerListe().get(i));
                    }
                    for(int i = 0; i<bookings.size(); i++){
                        if(bookings.get(i).getSjekketInn()==true){
                            bookings.remove(i);
                        }
                    }
                    return bookings;
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
    public String leggTilBooking(@RequestParam String fratidtimer,String fratidmin,String tiltidtimer,String tiltidmin,@ModelAttribute(value = "booking") Booking nyBooking, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        int tilgang = db.hentSpesRom(nyBooking.getRomNummer());
        
        if(person.getBrukertype()<tilgang){
            return "index";
        }
        
        String [] stringFratid = nyBooking.getFratid().split("-");
        String fratids = stringFratid[2] +"-"+ stringFratid[1] + "-" + stringFratid[0] + "-" + fratidtimer + "-" + fratidmin;
        String[] stringTiltid = nyBooking.getTiltid().split("-");
        String tiltids = stringTiltid[2] +"-"+ stringTiltid[1] + "-" + stringTiltid[0] + "-"+tiltidtimer + "-" + tiltidmin;
        nyBooking.setFratid(fratids);
        nyBooking.setTiltid(tiltids);
        //nyBooking.setBookingId(NULL);
        db.regBooking(person.getBrukernavn(), nyBooking, person.getBrukertype());
        
        lastInnPerson(person);

        return "index";
    }

    @RequestMapping(value = "/nyBruker", method = RequestMethod.POST)
    public String leggTilBruker(@RequestParam(value = "brukertypen") String brukertypen, @ModelAttribute(value = "nyBrukerForm") Bruker bruker) throws Exception {
        
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
         /*String melding = "Det er opprettet en bruker konto på StudEasy for deg <br> Du kan logge inn for å endre mail og passord hvis du ønsker det <br><br> Dine opplysninger er: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+" <br>Velkomen til StudyEasy";
        String header = "Det er opprettet en brukerkonto på StudyEasy";
         db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);*/
        return "redirect:admin";

    }

    @RequestMapping(value = "/oppdater", method = RequestMethod.POST)
    public String oppdaterBruker(@ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception {
        
        db.oppdaterBruker(bruker.getBrukernavn(), bruker.getBrukertype(), bruker.getNavn(), bruker.getPassord(), bruker.getMail());
        /*String melding = "Dine brukeropplysninger har blitt endret <br><br> Nåværende verdier: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);*/
        return "redirect:admin";
    }

    @RequestMapping(value = "/slett", method = RequestMethod.POST)
    public String slettBruker(@ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception {
        
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
        /*String melding = "Gratulerer <br><br> Du har lyktes med å endre din mail <br> Din nye mail er: "+email+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);*/
        return "redirect:index";
    }

    @RequestMapping(value = "/oppdaterPassord", method = RequestMethod.POST)
    public String oppdaterPassord(@RequestParam String passord, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        Bruker bruker = new Bruker();
        bruker.setPassord(passord);

        db.oppdaterPassord(person.getBrukernavn(), bruker.getPassord());
        /*String melding = "Gratulerer <br><br> Du har lyktes med å endre ditt passord <br> Ditt nye passord er: "+passord+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);*/
        return "redirect:index";
    }

    @RequestMapping(value = "/leggTil", method = RequestMethod.POST)
    public String leggTilFag(@ModelAttribute(value = "nyttFagForm") Fag fag) throws Exception {

        db.leggTilFag(fag.getFagkode(), fag.getNavn());

        return "redirect:admin";

    }

    @RequestMapping(value = "/slettFag", method = RequestMethod.POST)
    public String slettFag(@ModelAttribute(value = "slettFagForm") Fag fag) throws Exception {
       
        db.slettFag(fag.getFagkode());

        return "redirect:admin";

    }
    @RequestMapping(value="books", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[]getBookRom(@RequestParam ("data") Object data) throws SQLException, Exception {
        JSONObject js = new JSONObject();
        JSONParser parser = new JSONParser();
        js = (JSONObject)parser.parse((String)data);
        String romnr = (String)js.get("romnr");
        String dato = (String)js.get("dato");
        String[] bookinger = null;
        
        String[] stringdato = dato.split("-");
        String fratids = stringdato[2] +"-"+ stringdato[1] + "-" + stringdato[0];
        
        //System.out.println(data);
        //System.out.println(romnr + " : " + dato);
       
        bookinger = db.getBook(romnr,fratids);
        //System.out.println("getBookRom");

        for(int i = 0; i<bookinger.length; i++){
            
            System.out.println(i + ":" + bookinger[i]);
            
        }

      // studenter = new String[10];
      //+ studenter[0] = "student1";
        return bookinger;
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

   

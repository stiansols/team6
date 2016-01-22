package demo.kontroller;

import Klasser.*;
import database.DbConnection;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Map;

/**
 *
 * @author Benjamin
 */
@Controller
@SessionAttributes("person")
public class Kontroller {

    private DbConnection db = new DbConnection();

    /**
     *
     * @return
     */
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
    
    /**
     *
     * @param person
     * @throws Exception
     */
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
    
    /**
     *
     * @param model
     * @param person
     */
    public void LagSjekketInnListe(Model model,@ModelAttribute(value="person")Bruker person ){
        ArrayList<Booking> bookings = new ArrayList();                   
            for(int i = 0; i< person.getBookingerListe().size(); i++){
                if(person.getBookingerListe().get(i).getSjekketInn()== false){
                    bookings.add(person.getBookingerListe().get(i));
                }
            }
            Collections.sort(bookings);
            Collections.reverse(bookings);
            model.addAttribute("brukerBookinger", bookings);

    }

    /**
     *
     * @param person
     * @return
     * @throws Exception
     */
    @RequestMapping("/*")
    public String visStartView(@ModelAttribute(value="person") Bruker person) throws Exception {
        return "login";
    }
    
    /**
     *
     * @param model
     * @param person
     * @return
     * @throws Exception
     */
    @RequestMapping("/index")
    public String getHovedisde(Model model, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        lastInnPerson(person);
        LagSjekketInnListe(model, person);
        return "index";
    }
    
    /**
     *
     * @param person
     * @param session
     * @param status
     * @return
     */
    @RequestMapping("/logut")
    public String getLogut(@ModelAttribute(value = "person") Bruker person , HttpSession session, SessionStatus status) {
        status.setComplete();
        session.removeAttribute("person");
        return "login";
    } 
    
    /**
     *
     * @param model
     * @param buttonSupreme
     * @param person
     * @return
     * @throws Exception
     */
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

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping("/romOversikt")
    public String visRomOversikt(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "romOversikt";
    }

    /**
     *
     * @param datoInf
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/etasjeVis", method = RequestMethod.POST)
    public ModelAndView getEtasje(@RequestParam Map<String,String> datoInf) throws Exception {
        String url = "";
        String romnr = datoInf.get("romnr");
        String etasje = datoInf.get("etasje");
        String datoFra = datoInf.get("fradato");
        String tidFra = datoInf.get("fratid");
        String tidTil = datoInf.get("tiltid");

        url = db.hentPlanBilde("plan" + etasje);

        ArrayList<String> model = new ArrayList();
        model.add(url);
        model.add(datoFra);
        model.add(tidFra);
        model.add(tidTil);
        model.add(romnr);
        model.add(etasje);
        ModelAndView etasjeMV = new ModelAndView("visEtasjePlan", "etasjeLink", model);
        return etasjeMV;
    }

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping(value = "/etasje", method = RequestMethod.POST)
    public String visEtasjeValg(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "etasje";
    }

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping("/test")
    public String test(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "test";
    }

    /**
     *
     * @param person
     * @return
     */
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

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping("/oppdaterPersonlig")
    public String oppBruker(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "oppdaterPersonlig";
    }

    /**
     *
     * @param person
     * @return
     */
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

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping("/bruker")
    public String bruker(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "bruker";
    }

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping("/innstillinger")
    public String innstillinger(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "innstillinger";
    }

    /**
     *
     * @param person
     * @return
     */
    @RequestMapping("/hjem")
    public String home(@ModelAttribute(value = "person") Bruker person) {
        if(person.getBrukernavn() == null){
            return "login";
        }
        return "hjem";
    }

    /**
     *
     * @param rom
     * @param person
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/oppdaterrom", method = RequestMethod.POST)
    public String oppdaterRom(@ModelAttribute(value = "romForm")Rom rom,@ModelAttribute(value = "rom")Bruker person) throws Exception {
        try {
            db.oppdaterRom(rom.getRomnr(), rom.getEtasje(), rom.getPlasser(), rom.getHarSmartboard(), rom.getHarSkjerm(), rom.getHarProsjektor(), rom.getTilgang());
        }catch (Exception e){
            System.out.println("Noe gikk galt: " + e);
        }
        return "admin";
    }

    /**
     *
     * @param model
     * @param brukernavn
     * @param passord
     * @param person
     * @return
     * @throws SQLException
     * @throws Exception
     */
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
                if(person.getBrukertype()== 4){
                Tidsintervall spamMail = new Tidsintervall();
                spamMail.run();
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

    /**
     *
     * @return
     * @throws SQLException
     * @throws Exception
     */
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
    
    /**
     *
     * @param fagkode
     * @return
     * @throws SQLException
     * @throws Exception
     */
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

    /**
     *
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @ModelAttribute("alleBrukere")
    public ArrayList getBrukere() throws SQLException, Exception {
        ArrayList<Bruker> alleBrukere = new ArrayList();
        alleBrukere = db.hentAlleBrukere();
        return alleBrukere;
    }

    /**
     *
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @ModelAttribute("alleFag")
    public ArrayList getFag() throws SQLException, Exception {
        ArrayList<Fag> alleFag = new ArrayList();
        alleFag = db.hentAlleFag();

        return alleFag;
    }
    
    /**
     *
     * @param person
     * @return
     */
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

    /**
     *
     * @param model
     * @param nyBooking
     * @param person
     * @return
     */
    @RequestMapping("/etasjeVis")
        public String visBooking(Model model,@ModelAttribute(value = "booking")Booking nyBooking, @ModelAttribute(value="person")Bruker person) {
            if(person.getBrukernavn() == null){
                return "login";
            }
            model.addAttribute("booking", new Booking());
            return "etasjeVis";
    }
    
    /**
     *
     * @param fratidtimer
     * @param fratidmin
     * @param tiltidtimer
     * @param tiltidmin
     * @param nyBooking
     * @param person
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/nyBooking", method = RequestMethod.POST)
        public String leggTilBooking(@RequestParam String fratidtimer,String fratidmin,String tiltidtimer,String tiltidmin,@ModelAttribute(value = "booking") Booking nyBooking, @ModelAttribute(value = "person") Bruker person) throws Exception {
            try{
            if(person.getBrukernavn() == null){
                return "login";
            }
            int tilgang = db.hentSpesRom(nyBooking.getRomNummer());
            
            if(person.getBrukertype()<tilgang){
                return "index";
            }
            
            String [] stringFratid = nyBooking.getFratid().split("-");
            String fratids = stringFratid[0] +"-"+ stringFratid[1] + "-" + stringFratid[2] + "-" + fratidtimer + "-" + fratidmin;
            String[] stringTiltid = nyBooking.getTiltid().split("-");
            String tiltids = stringFratid[0] +"-"+ stringFratid[1] + "-" + stringFratid[2] + "-"+tiltidtimer + "-" + tiltidmin;
            nyBooking.setFratid(fratids);
            nyBooking.setTiltid(tiltids);
            nyBooking.setBrukertype(person.getBrukertype());
            //nyBooking.setBookingId(NULL);
            db.regBooking(person.getBrukernavn(), nyBooking, person.getBrukertype(),person.getBookingerListe());
            
            lastInnPerson(person);
            System.out.println("Dette er plassen");
    
            return "romOversikt";
            }
            
            catch(Exception e){
                System.out.println("Feil " +e);
                return "oppdaterPersonlig";
            }
    }

    /**
     *
     * @param brukertypen
     * @param bruker
     * @return
     * @throws Exception
     */
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
    
    @RequestMapping(value = "slettbooking", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String slettBooking(Model model, @RequestParam ("data") int bookingId, @ModelAttribute(value = "person") Bruker person) throws SQLException, Exception {
        if(person.getBrukernavn() == null){
                return "login";
            }
        
        db.fjernBooking(bookingId);

        return "index";
    }  

    /**
     *
     * @param bruker
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/oppdater", method = RequestMethod.POST)
    public String oppdaterBruker(@ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception {
        
        db.oppdaterBruker(bruker.getBrukernavn(), bruker.getBrukertype(), bruker.getNavn(), bruker.getPassord(), bruker.getMail());
        String melding = "Dine brukeropplysninger har blitt endret <br><br> Nåværende verdier: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";
    }

    /**
     *
     * @param bruker
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/slett", method = RequestMethod.POST)
    public String slettBruker(@ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception {
        
        db.slettBruker(bruker.getBrukernavn());

        return "redirect:admin";
    }

    /**
     *
     * @param email
     * @param person
     * @return
     * @throws Exception
     */
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
        return "redirect:index";
    }

    /**
     *
     * @param passord
     * @param person
     * @return
     * @throws Exception
     */
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
        return "redirect:index";
    }

    /**
     *
     * @param fag
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/leggTil", method = RequestMethod.POST)
    public String leggTilFag(@ModelAttribute(value = "nyttFagForm") Fag fag) throws Exception {

        db.leggTilFag(fag.getFagkode(), fag.getNavn());

        return "redirect:admin";

    }

    /**
     *
     * @param fag
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/slettFag", method = RequestMethod.POST)
    public String slettFag(@ModelAttribute(value = "slettFagForm") Fag fag) throws Exception {
       
        db.slettFag(fag.getFagkode());

        return "redirect:admin";

    }
   
    /**
     *
     * @param data
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping(value="books", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
       @ResponseBody
       public String[]getBookRom(@RequestParam ("data") Object data) throws SQLException, Exception {
           JSONObject js = new JSONObject();
          
           JSONParser parser = new JSONParser();
           js = (JSONObject)parser.parse((String)data);
           String romnr = (String)js.get("romnr");
           System.out.println(romnr);
           String dato = (String)js.get("dato");
           String[] bookinger = null;
           
           
           String[] stringdato = dato.split("-");
           String fratids = stringdato[0] +"-"+ stringdato[1] + "-" + stringdato[2];
           
           //System.out.println(data);
           //System.out.println(romnr + " : " + dato);
          
           bookinger = db.getBook(romnr,fratids);
           //System.out.println("getBookRom");

         // studenter = new String[10];
         //+ studenter[0] = "student1";
           return bookinger;
    }
      
    /**
     *
     * @param studienavn
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping(value="studStudium", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] getStudIStudium(@RequestParam ("data") String studienavn) throws SQLException, Exception {
        String studenter[] = null;
       // System.out.println(data);
        studenter = db.hentStudenterIStudium(studienavn);
      // studenter = new String[10];
      //+ studenter[0] = "student1";
      
        return studenter;
    }
    
    /**
     *
     * @param data
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping(value="lagreStud", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] lagreStud(@RequestParam ("data") Object data) throws SQLException, Exception {
        String studenter[] = null;
         JSONParser parser = new JSONParser();
         
         JSONObject json = new JSONObject();
         json = (JSONObject) parser.parse((String)data);
         Long lengde1 = (Long) json.get("lengde1");
         Long lengde2 =  (Long) json.get("lengde2");
  
         for(int i = 0; i < lengde1; i++){
             String index = Integer.toString(i);
             String brukernavn = (String)(json.get("slettbruker" + index));
             String studiekode = (String)(json.get("studiekode"));

             try{
                 if(studiekode != null){
                     db.slettStudIStudium(brukernavn, studiekode);
                 }
                 
             }catch(SQLException e){
                 System.out.println("SQL Ex: "+ e);
             }
         }
        

       for(int i = 0; i < lengde2; i++){
           String index = Integer.toString(i);
           String brukernavn = (String) (json.get("brukernavn" + index));
           String studiekode = (String)(json.get("studiekode"));
           String studienavn = (String)(json.get("studienavn" + index));
           
           try{
               db.leggTilStudIStudium(brukernavn, studiekode,studienavn);
           }catch(SQLException e){
          //     System.out.println("SQL Ex: "+ e);
           }
          
       }
     
        return studenter;
    }
    
    /**
     *
     * @param brukertype
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping(value="alleStud", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] getAlleStudenter(@RequestParam ("data") String brukertype) throws SQLException, Exception {
        String studenter[] = null;
        int brukertypeInt = Integer.parseInt(brukertype);
        studenter = db.hentAlleStudenter(brukertypeInt);

        return studenter;
    }
    
    @RequestMapping(value="hentRessurs", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] getRessurs(@RequestParam ("beskrivelse") String beskrivelse) throws SQLException, Exception {
        String[] url = new String[1];
        url[0] = db.hentPlanBilde(beskrivelse);
        return url;
    }
  
    /**
     *
     * @param fagkode
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @ModelAttribute("alleStudier")
    public ArrayList<Studium> getAlleStudier(String fagkode) throws SQLException, Exception {
        ArrayList<Studium> studier = new ArrayList();
        
        studier = db.hentAlleStudier();

        return studier;
    }
    
     @RequestMapping(value="getBooking", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] getBooking(@RequestParam ("data") int bookingId) throws SQLException, Exception {
        Booking booking = null;
      //  int brukertypeInt = Integer.parseInt(brukertype);
        booking = db.getBooking(bookingId);
        String[] bookingArr = new String[3];
        bookingArr[0] = booking.getRomNummer();
        bookingArr[1] = booking.getFratid();
        bookingArr[2] = booking.getTiltid();
        
        return bookingArr;
    }

}


   

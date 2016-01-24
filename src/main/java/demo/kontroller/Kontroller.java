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
    private static String pologgetBruker = "";

    private DbConnection db = new DbConnection();

    /**
     * Lager et tomt brukerobjekt og returnerer det
     *
     * @return
     */
    @ModelAttribute("person")
    public Bruker getPerson() {
        return new Bruker();
    }

    /**
     * Utfører sha1-kryptering på inputstrengen som sendes inn, or returnerer
     * den ferdigkryptert.
     *
     * @param input
     * @return String
     */
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
     * Laster inn bruker-
     * 
     * @param person
     * @throws Exception
     */
    public void lastInnPerson(@ModelAttribute(value="person")Bruker person) throws Exception{
        Bruker b = db.hentBruker(pologgetBruker);
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
     * Laster inn brukerens fremtidige bookinger som ikke er sjekket inn på.
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
     * Returnerer til login-siden. Kalles dersom url-en viser til en side som
     * ikke er mappet til.
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
     * Omdirigerer til index-siden. Utfører en sjekk om en bruker er innlogget.
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
     * Logger ut. Fjerner brukerinfo fra session, og omdirigerer til
     * login-siden.
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
     * Sjekker om en booking kan sjekkes inn på. Dersom det stemmer, sjekker den
     * inn, og omdirigerer til index. Om ikke, omdirigerer den til en nettside
     * med feilmelding.
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
     * Omdirigerer til etasjevisning. Sjekker om bruker er logget inn først. Om
     * det ikke stemmer, omdiriger til login-siden.
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
     * Henter inn et bilde av planvisningen til etasjen som er etterspurt
     * gjennom POST-forespørsel, og omdirigerer til visEtasjePlan-siden sammen
     * med imagemapping-koordinater for hvert rom.
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
     * Returnerer etasje siden
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
     * Returnerer test siden
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
     * Omdirigerer til registrerBruker-siden. Må være administrator-bruker
     * (brukertype = 3), ellers returnerer den til indeks. Sjekker om bruker er
     * logget inn først. Om det ikke stemmer, omdiriger til login-siden.
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
     * Omdirigerer til oppdaterPersonlig-siden. Sjekker om bruker er logget inn
     * først. Om det ikke stemmer, omdiriger til login-siden.
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
     * Omdirigerer til siden med bruker/studium/rom-administrative funksjoner.
     * Må være administrator, ellers returnerer den til indeks.
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
     * Omdirigerer til bruker-siden. Sjekker om bruker er logget inn først. Om
     * det ikke stemmer, omdiriger til login-siden.
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
     * Utfører en forespørsel som sender inn nye rom-attributter til databasen.
     * Om feil eller kollisjon i inndata/andre feil med SQL-spørringen skrives
     * det ut feilmelding i konsollen. Om vellykket returnerer den til admin.
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
        return "redirect:admin";
    }

    /**
     * Logg-inn-metoden. Sender spørring til databasen med data fra brukernavn-
     * og passordfeltene om en slik bruker fins. Om det stemmer, henter den inn
     * brukerens informasjon (mail, bookinger, avtaler), og viser disse i
     * indeks-siden. Om brukeren som logger inn er av brukertype 4
     * (epost-utsenderkonto), startes spamMail-funksjonen. Dersom den innsendte
     * informasjonen ikke stemmer med en bruker i databasen, omdirigeres det
     * tilbake til login-siden, og skriver ut feilmeldinger i konsollen.
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
        pologgetBruker = brukernavn;
        
        try {
            bruker = db.loggInn(pologgetBruker, passord);
            if (bruker != null) {
                
                
                Bruker b = db.hentBruker(pologgetBruker);
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
                for (int i = 0; i < b.getUndervisningsTimer().size(); i++) {
                    person.setUndervisningsTime(b.getUndervisningsTimer().get(i));
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
     * Returnerer rom-koordinater og rom-objekter som en ArrayList for den
     * etasjen som er etterspurt.
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
     * Returnerer studentene som tilhører den innsendte fagkoden.
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
     * Returnerer alle brukere i StudyEasy-systemet i en ArrayList.
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
     * Returnerer alle registrerte fag i en ArrayList.
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
     * Metode som fjerner en booking etter man har sjekket inn på den.
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
     * Legger til en booking .Sjekker om bruker er logget inn først. Om det ikke stemmer, omdiriger til login-siden
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
     * Henter brukertypen som er loggen inn fra databasen, og sjekker om brukeren har tilgang til å booke rommet. Slår dette feil, omdirigeres det til en side med feilmelding.
     * Om brukeren har tilgang, kall en funksjon fra databaseklassen om å legge til en booking med de innsendte parameterene. Om det returneres en exception, send til samme side med feilmelding.
     * Om alt gikk bra, omdiriger til indeks siden. Eventuelle feil blir pålyst i konsollen.
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
        public String leggTilBooking(Model model, @RequestParam String fratidtimer,String fratidmin,String tiltidtimer,String tiltidmin, @ModelAttribute(value = "booking") Booking nyBooking, @ModelAttribute(value = "person") Bruker person) throws Exception {

            try{
            if(person.getBrukernavn() == null){
                return "login";
            }
            int tilgang = db.hentSpesRom(nyBooking.getRomNummer());
             
            if(person.getBrukertype()<tilgang){
                String meldingen = "Du har ikke tilgang til å booke dette rommet";
                model.addAttribute("feilMelding", meldingen);
                return "denied";
            }
            
         String fratids = nyBooking.getFratid() + "-" + fratidtimer + "-" + fratidmin;
         String tiltids =  nyBooking.getFratid() + "-" + tiltidtimer + "-" + tiltidmin;
     
            nyBooking.setFratid(fratids);
            nyBooking.setTiltid(tiltids);
            nyBooking.setBrukertype(person.getBrukertype());
            //nyBooking.setBookingId(NULL);
     
            if(db.regBooking(person.getBrukernavn(), nyBooking, person.getBrukertype(),person.getBookingerListe())== false){
                String melding = "Du fikk ikke booket dette rommet <br> Mulige grunner: <br> Du har booket tilbake i tid <br> Du har Booket for langt frem i tid (Du kan booke til slutten av neste måned) <br> Du har prøvd å booke ett opptatt tidsrom <br> Du har brukt opp dine booking timer (max 20 timer på en gang)";
                model.addAttribute("feilMelding", melding);
                return "denied";
            }
     
            return "redirect:index";
            }
            
            catch(Exception e){
                System.out.println("Feil!: " +e);
                return "oppdaterPersonlig";
            }
    }


    /**
     * Sender parameterene innsendt inn mot lagBruker()-metoden i databaseklassen. Lager en bruker basert på disse.
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
        String melding = "Det er opprettet en bruker konto på StudEasy for deg <br> Du kan logge inn for å endre mail og passord hvis du ønsker det <br><br> Dine opplysninger er: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+" <br>Velkomen til StudyEasy";
        String header = "Det er opprettet en brukerkonto på StudyEasy";
         db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";

    }
    
    /**
     * Fjerner en booking. Sjekker om bruker er logget inn først. Om det ikke stemmer, omdiriger til login-siden.
     *
     * @param model
     * @param bookingId
     * @param person
     * @return
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping(value = "slettbooking", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String slettBooking(Model model, @RequestParam ("data") int bookingId, @ModelAttribute(value = "person") Bruker person) throws SQLException, Exception {
        if(person.getBrukernavn() == null){
                return "login";
            }
        
        db.fjernBooking(bookingId);

        return "index";
    }  

    /**
     * Endrer en bruker med de innsendte verdiene. Sender en epost til brukeren (den eposten som ble innsendt, samme som før eller ny) om endringene. Omdirigerer til admin-siden.
     *
     * @param bruker
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/oppdater", method = RequestMethod.POST)
    public String oppdaterBruker(@RequestParam(value="brukertypen") String brukertypen, @ModelAttribute(value = "brukerForm") Bruker bruker) throws Exception {
        
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
        
        db.oppdaterBruker(bruker.getBrukernavn(), bruker.getBrukertype(), bruker.getNavn(), bruker.getPassord(), bruker.getMail());
        String melding = "Dine brukeropplysninger har blitt endret <br><br> Nåværende verdier: <br> Brukernavn: "+bruker.getBrukernavn()+" <br> Brukertype: "+bruker.printBrukerType()+" <br> Navn: "+ bruker.getNavn()+" <br> Passord: "+bruker.getPassord()+" <br> mail: "+bruker.getMail()+"";
        String header = "Endringer i din bruker på StudyEasy";
        db.generateAndSendEmail(bruker.getBrukernavn(), melding, header);
        return "redirect:admin";
    }

    /**
     * Sletter innsendte bruker.
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
     * Sletter innsendt rom.
     *
     * @param rom
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/slettRom", method = RequestMethod.POST)
    public String slettRom(@ModelAttribute(value = "romForm") Rom rom) throws Exception {

        db.slettRom(rom.getRomnr());

        return "redirect:admin";
    }

    /**
     * Oppdaterer en brukers epostadredde med den som blir sendt inn. Sender en epost til den nye epostadressen med tilhørende informasjon. Sjekker om bruker er logget inn først. Om det ikke stemmer, omdiriger til login-siden.
     *
     * @param model
     * @param email
     * @param gpassord
     * @param person
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/oppdaterMail", method = RequestMethod.POST)
    public String oppdaterMail(Model model,@RequestParam String email, String gpassord, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
        
        String beskjed = "Siden du ikke har tastet inn riktig gammelt passord, fikk du ikke endret din mail"; 
        
        if(sha1(gpassord).equals(person.getPassord())){
            Bruker bruker = new Bruker();
            bruker.setMail(email);
            
            db.oppdaterMail(person.getBrukernavn(), bruker.getMail());
            String melding = "Gratulerer <br><br> Du har lyktes med å endre din mail <br> Din nye mail er: "+email+"";
            String header = "Endringer i din bruker på StudyEasy";
            db.generateAndSendEmail(person.getBrukernavn(), melding, header);
            return "redirect:index";
        }
        model.addAttribute("feilMelding", beskjed);
        return "denied";
        
    }

    /**
     * Oppdaterer en brukers passord, men det kreves att verifisering av det gamle passordet for å få lov, mail vill bli sendt til brukeren ved vellyket passord endring
     *
     * @param model
     * @param npassord
     * @param gpassord
     * @param person
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/oppdaterPassord", method = RequestMethod.POST)
    public String oppdaterPassord(Model model, @RequestParam(value="npassord") String npassord, @RequestParam(value="gpassord") String gpassord, @ModelAttribute(value = "person") Bruker person) throws Exception {
        if(person.getBrukernavn() == null){
            return "login";
        }
   
        
        String beskjed = "Siden du ikke har tastet inn riktig gammelt passord, fikk du ikke endret passordet"; 
        
        System.out.println(gpassord + "\n"+ person.getPassord());
        if(sha1(gpassord).equals(person.getPassord())){
            Bruker bruker = new Bruker();
            bruker.setPassord(npassord);
        

            db.oppdaterPassord(person.getBrukernavn(), bruker.getPassord());
            String melding = "Gratulerer <br><br> Du har lyktes med å endre ditt passord <br> Ditt nye passord er: "+bruker.getPassord()+"";
            String header = "Endringer i din bruker på StudyEasy";
            db.generateAndSendEmail(person.getBrukernavn(), melding, header);
            return "redirect:index";
        }
        model.addAttribute("feilMelding", beskjed);
        return "denied";
        
          
    }

    /**
     * Legger til ett nytt fag i databasen
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
     * Sletter ett fag fra databasen basert på innsendt fagkode
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
     * Henter ut alle bookinger knyttet til romnummeret som blir sendt inn
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
     * Henter ut alle studenter som tar ett gitt studium
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
     * Knytter en bruker til ett studium
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
     * Henter ut alle brukere med brukertype lik student
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
    
    /**
     * Henter ut linken til bildene som brukes for å vise planoversiktene
     * 
     * @param beskrivelse
     * @return
     * @throws SQLException
     * @throws Exception 
     */
    @RequestMapping(value="hentRessurs", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String[] getRessurs(@RequestParam ("beskrivelse") String beskrivelse) throws SQLException, Exception {
        String[] url = new String[1];
        url[0] = db.hentPlanBilde(beskrivelse);
        return url;
    }
  
    /**
     * Henter ut en liste som inneholder alle studier
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
    
    /**
     * Oppdaterer innholdet i feilmelding 
     * 
     * @param feilMelding
     * @return
     * @throws SQLException
     * @throws Exception 
     */
    @ModelAttribute("feilMelding")
    public String setFeilMelding(String feilMelding) throws SQLException, Exception {
        return feilMelding;
    }
    
    /**
     * Henter ut en booking og lagrer den i ett tabell format
     * 
     * @param bookingId
     * @return
     * @throws SQLException
     * @throws Exception 
     */
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
    
    /**
     * Legger en undervisningstime inn i databasen
     * 
     * @param fagkode
     * @param fratid
     * @param tiltid
     * @param dato
     * @param romnr
     * @return
     * @throws Exception 
     */
    
       @RequestMapping(value = "/nyTime", method = RequestMethod.POST)
    public String leggTilTime(@RequestParam String fagkode, String fratid, String tiltid, String dato, String romnr) throws Exception {
  
        db.leggTilTime(fagkode, fratid, tiltid, dato, romnr);
        
        return "redirect:admin";

    }

}


   

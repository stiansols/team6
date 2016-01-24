/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import Klasser.Booking;
import Klasser.Bruker;
import Klasser.Fag;
import Klasser.Rom;
import Klasser.Studium;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Seva
 */
public class DbConnectionTest {
    DbConnection instance = new DbConnection();
    public DbConnectionTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {

    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        

    }
    
    
    @After
    public void tearDown() {
    }

    /**
     * Test of hentRom method, of class DbConnection.
     */
    @Test
    public void testHentRom() throws Exception {
        System.out.println("hentRom");
        ArrayList<Rom> a = new ArrayList();
        String expResult = "[102 1  10 false true false 0, 103 1  10 false true false 0, 104 1  10 false true false 0, 105 1  10 false true false 0, 106 1  10 false true false 0, 107 1  10 false true false 0, 108 1  10 false true false 0, 109 1  10 false false false 0, 112 1  10 false true false 0, 113 1  10 false true false 0, 114 1  10 false true false 0, 115 1  10 false true false 0, 119 1  70 true true true 2, 119A 1  20 false false false 2, 120 1  10 false false false 2, 121 1  20 true true true 2, 122 1  70 true true true 2, 123 1  10 false false false 2, 168 1  15 false true true 1, 184 1  10 false false true 1, 220 2  58 false false false 2, 243 2  61 true true true 2, 245 2  26 true false false 2, 249 2  12 false true false 0, 251 2  39 false true true 2, 252 2  9 true true false 0, 254 2  34 true true true 2, 255 2  40 false false false 2, 256 2  57 true true false 2, 262 2  14 true false false 1, 264 2  80 false false false 2, 272 2  6 false true false 0, 285 2  49 true true true 2, 296 2  24 true true true 1, 302 3  93 false true false 2, 351 3  80 true true true 2, 352 3  60 true true true 2, 353 3  90 true true true 2, 354 3  65 true true true 2, 355 3  90 true true true 2, 396 3  12 false true true 0, 397 3  25 true true false 0, 400 4  50 true true true 2, 401 4  90 true true true 2]";
        ArrayList result = instance.hentRom(a);
        assertEquals(expResult, result.toString());
    }

    /**
     * Test of hentCoords method, of class DbConnection.
     */
    @Test
    public void testHentCoords() throws Exception {
        System.out.println("hentCoords");
        ArrayList<Rom> a = new ArrayList();
        Rom r = new Rom();
        r.setRomnr("102");
        a.add(r);
        String expResult = "677, 802, 766, 976";
        ArrayList<Rom> result = instance.hentCoords(a);
        assertEquals(expResult, result.get(0).getCoords());
    }

    /**
     * Test of hentBruker method, of class DbConnection.
     */
    @Test
    public void testHentBruker() throws Exception {
        System.out.println("hentBruker");
        String brukernavn = "AntonioJo";
        String expResult = "AntonioJo, 0, Antoniossssss, da39a3ee5e6b4b0d3255bfef95601890afd80709, antoio1@mail.com";
        Bruker result = instance.hentBruker(brukernavn);
        assertEquals(expResult, result.getBrukernavn() + ", " + result.getBrukertype() + ", " + result.getNavn() + ", " + result.getPassord() + ", " + result.getMail());
    }

    /**
     * Test of oppdaterPassord method, of class DbConnection.
     */
    @Test
    public void testOppdaterPassord() throws Exception {
        System.out.println("oppdaterPassord");
        String brukernavn = "sevaD";
        String passord = "passord2";
        
        instance.oppdaterPassord(brukernavn, passord);
        assertEquals(instance.hentPassord("sevaD"), instance.sha1("passord2"));
        instance.oppdaterPassord(brukernavn, "passord");
    }

    /**
     * Test of hentPassord method, of class DbConnection.
     */
    @Test
    public void testHentPassord() throws Exception {
        System.out.println("hentPassord");
        String brukernavn = "AntonioJo";
        
        String expResult = "da39a3ee5e6b4b0d3255bfef95601890afd80709";
        String result = instance.hentPassord(brukernavn);
        assertEquals(expResult, result);
    }

    /**
     * Test of getBooking method, of class DbConnection.
     */
    @Test
    public void testGetBooking() throws Exception {
        System.out.println("getBooking");
        int bookingId = 173;
        
        String expResult = "173, 0, SjurRin, 102, 30-01-2016-06-00, 30-01-2016-07-00, true";
        Booking result = instance.getBooking(bookingId);
        assertEquals(expResult, result.getBookingId() + ", " + result.getBrukertype() + ", " + result.getBrukernavn() + ", "+ result.getRomNummer()+ ", " + result.getFratid() + ", " + result.getTiltid() + ", " + result.getSjekketInn());
    }

    /**
     * Test of hentRomEtasje method, of class DbConnection.
     */
    @Test
    public void testHentRomEtasje() throws Exception {
        System.out.println("hentRomEtasje");
        int etasjen = 2;
        
        String expResult = "[220 2  58 false false false 2, 243 2  61 true true true 2, 245 2  26 true false false 2, 249 2  12 false true false 0, 251 2  39 false true true 2, 252 2  9 true true false 0, 254 2  34 true true true 2, 255 2  40 false false false 2, 256 2  57 true true false 2, 262 2  14 true false false 1, 264 2  80 false false false 2, 272 2  6 false true false 0, 285 2  49 true true true 2, 296 2  24 true true true 1]";
        ArrayList<Rom> result = instance.hentRomEtasje(etasjen);
        assertEquals(expResult, result.toString());
    }

    /**
     * Test of sha1 method, of class DbConnection.
     */
    @Test
    public void testSha1() throws Exception {
        System.out.println("sha1");
        String input = "passord";
        String expResult = "ec40c62ddf2d2d7d353e6ad7d1e3529bb6867e0f";
        String result = DbConnection.sha1(input);
        assertEquals(expResult, result);

    }

    /**
     * Test of loggInn method, of class DbConnection.
     */
    @Test
    public void testLoggInn() throws Exception {
        System.out.println("loggInn");
        String brukernavn = "sevaD";
        String passord = "passord";
        
        Bruker expResult = new Bruker("sevaD", 3, "seva", "ec40c62ddf2d2d7d353e6ad7d1e3529bb6867e0f", "aelfkjjf@ejfaifj.com");
        Bruker result = instance.loggInn(brukernavn, passord);
        assertEquals(expResult.getBrukernavn(), result.getBrukernavn());
    }

    /**
     * Test of hentSpesRom method, of class DbConnection.
     */
    @Test
    public void testHentSpesRom() throws Exception {
        System.out.println("hentSpesRom");
        String romnr = "102";
        
        int expResult = 0;
        int result = instance.hentSpesRom(romnr);
        assertEquals(expResult, result);
    }

    /**
     * Test of hentStudenterIFag method, of class DbConnection.
     */
    @Test
    public void testHentStudenterIFag() throws Exception {
        System.out.println("hentStudenterIFag");
        String fagkode = "IT-01";
        
        String[] expResult = {"brukernavn2", "Stians"};
        String[] result = instance.hentStudenterIFag(fagkode);
        assertArrayEquals(expResult, result);
    }

    /**
     * Test of getBook method, of class DbConnection.
     */
    @Test
    public void testGetBook() throws Exception {
        System.out.println("getBook");
        String romnr = "102";
        String dato = "30-01-2016-06-00";
        
        String expResult = "Opptatt";
        String[] result = instance.getBook(romnr, dato);
        assertEquals(expResult, result[0]);
    }

    /**
     * Test of hentPlanBilde method, of class DbConnection.
     */
    @Test
    public void testHentPlanBilde() throws Exception {
        System.out.println("hentPlanBilde");
        String plan = "plan1";
        
        String expResult = "https://lh3.googleusercontent.com/j3yy_71VajIVo4tkBmiObtKL1E-DiJzQb3yO8qizbKPqEw9HeMQ9L4jAXxvq4W1ukveuJp4Hxn_6VXyqbTfdTezWFKKE6yPq0umKmnmgOX_P8DVFyEn19x6TTUSt1wtWmlgQpWQX";
        String result = instance.hentPlanBilde(plan);
        assertEquals(expResult, result);
    }


    /**
     * Test of hentAlleStudenter method, of class DbConnection.
     */
    @Test
    public void testHentAlleStudenter() throws Exception {
        System.out.println("hentAlleStudenter");
        int brukertype = 4;
        
        String[] expResult = {"Server", "server2"};
        String[] result = instance.hentAlleStudenter(brukertype);
        assertArrayEquals(expResult, result);
    }
}

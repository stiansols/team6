/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

import database.DbConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimerTask;

/**
 *
 * @author Eirik Saur
 */
class intervallOppgave extends TimerTask {

    public void run() {
        System.out.println("Nå Sjekker vi om vi skal sende mail");
        DbConnection db = new DbConnection();
        try {

            ArrayList<Booking> bookinger = db.hentAlleBookinger();
            for (int i = 0; i < bookinger.size(); i++) {
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
                Date fra = formatter.parse(bookinger.get(i).getFratid());
                Date til = formatter.parse(bookinger.get(i).getTiltid());
                Date now = new Date();
                Date snart = new Date(System.currentTimeMillis() + 16 * 60 * 1000);
                if (fra.after(now) && fra.before(snart)) {
                    String oppdatering = "Din rombooking starter om 15 minutter, husk å sjekke inn på rommet";
                    String header = "Påminnelse om rombooking";
                    db.generateAndSendEmail(bookinger.get(i).getBrukernavn(), oppdatering, header);
                }
                Date snart2 = new Date(System.currentTimeMillis() - 16 * 60 * 1000);
                if (fra.before(now) && fra.after(snart2)) {
                    if (bookinger.get(i).getSjekketInn() == false) {
                        String header = "Mistet rom";
                        String oppdatering = "Du har glemt å sjekke inn og har derfor mistet din rombooking";
                        db.fjernBooking(bookinger.get(i).getBookingId());
                        db.generateAndSendEmail(bookinger.get(i).getBrukernavn(), oppdatering, header);
                    }
                }
                if (til.before(now)) {
                    db.fjernBooking(bookinger.get(i).getBookingId());
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

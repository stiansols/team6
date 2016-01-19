/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

/**
 *
 * @author Eirik Saur
 */
import database.DbConnection;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

/**
 *
 * @author Sondre
 */
public class Tidsintervall {

    private static Timer timer = new Timer();

    private static Calendar getFirstTime() {
        Calendar cal = Calendar.getInstance();

        int currentMinute = cal.get(Calendar.MINUTE);

        
        if (currentMinute < 45) {
            cal.set(Calendar.MINUTE, 45);
        }
       
        if (currentMinute < 15) {
            cal.set(Calendar.MINUTE, 15);
        }

        cal.set(Calendar.SECOND, 0);

        return cal;
    }

    /**
     *
     * @throws Exception
     */
    public void run()  throws Exception {
        Calendar firstTaskTime = getFirstTime();
        System.out.println("Task will start at: " + firstTaskTime.getTime());
        timer.schedule(new intervallOppgave(), firstTaskTime.getTime(), 1000 * 60 * 30);
    }
}


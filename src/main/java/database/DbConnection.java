package database;

import Klasser.Avtale;
import Klasser.Booking;
import Klasser.Bruker;
import Klasser.Fag;
import Klasser.Rom;
import demo.repository.BrukerMapper;
import demo.repository.FagMapper;
import demo.repository.RomMapper;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class DbConnection {

    private final Statement statement;
    private final Connection connection;
    private final DataSource dataSource;
    private final ApplicationContext appContext;
    private ResultSet resultSet = null;
    private PreparedStatement preparedStatement = null;
    JdbcTemplate jdbcTemplateObject;

    public DbConnection() throws SQLException {
        appContext = new ClassPathXmlApplicationContext("beans.xml");
        dataSource = (DataSource) appContext.getBean("dataSource");
        connection = dataSource.getConnection();
        statement = connection.createStatement();
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);

    }

    public void executeUpdate(String query) throws Exception {

        try {
            statement.executeUpdate(query);

        } catch (SQLException e) {

        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    public ArrayList hentRom(ArrayList<Rom> a) {
        return new ArrayList(jdbcTemplateObject.query("SELECT * FROM rom", new RomMapper()));
    }

    public ArrayList<Bruker> hentAlleBrukere() {
        return new ArrayList(jdbcTemplateObject.query("SELECT * FROM bruker", new BrukerMapper()));

    }

    public Bruker hentBruker(String brukernavn) {
        return (Bruker) jdbcTemplateObject.queryForObject("SELECT * FROM bruker where brukernavn = '" + brukernavn + "'", new Object[]{brukernavn}, new BrukerMapper());
    }

    public ArrayList<Fag> hentAlleFag() {
        return new ArrayList(jdbcTemplateObject.query("SELECT * FROM fag", new FagMapper()));
    }

    public void leggTilFag(String fagkode, String navn) {
        jdbcTemplateObject.execute("INSERT INTO fag values( '" + fagkode + " ' , '" + navn + "')");
    }

    public void slettFag(String fagkode) {
        jdbcTemplateObject.execute("DELETE FROM fag where fagkode = '" + fagkode + "'");
    }

    public void lagBruker(String brukernavn, int brukertype, String navn, String passord, String mail) {
        jdbcTemplateObject.execute("INSERT INTO bruker values ('" + brukernavn + "','" + brukertype + "', '" + navn + "', SHA1('" + passord + "'), '" + mail + "')");
    }

    public void slettBruker(String brukernavn) {
        jdbcTemplateObject.execute("DELETE FROM bruker where brukernavn = '" + brukernavn + "'");
    }

    public void oppdaterBruker(String brukernavn, int brukertype, String navn, String mail) {
        jdbcTemplateObject.execute("UPDATE bruker SET brukertype = '" + brukertype + "', navn = '" + navn + "', mail = '" + mail + "' where brukernavn = '" + brukernavn + "'");
    }

    public void oppdaterPassord(String brukernavn, String passord) {
        jdbcTemplateObject.execute("UPDATE bruker SET passord = SHA1('" + passord + "') where brukernavn = '" + brukernavn + "'");
    }

    public void oppdaterMail(String brukernavn, String mail) {
        jdbcTemplateObject.execute("UPDATE bruker SET mail = '" + mail + "' where brukernavn = '" + brukernavn + "'");

    }

    public void slett(String tabell, String pr_key, String keyValue) {
        jdbcTemplateObject.execute("DELETE FROM " + tabell + " WHERE " + pr_key + " = '" + keyValue + "'");
    }

    public String hentPassord(String brukernavn) throws Exception {
        return hentBruker(brukernavn).getPassord();
    }

    public void leggTil(String tabell, String[] values) throws Exception, SQLException {
        resultSet = statement.executeQuery("SELECT `COLUMN_NAME` \n"
                + "FROM `INFORMATION_SCHEMA`.`COLUMNS` \n"
                + "WHERE `TABLE_SCHEMA`='g_scrum_t6' \n"
                + "    AND `TABLE_NAME`='" + tabell + "';");
        String felt = "";
        resultSet.next();
        resultSet.next();
        felt += resultSet.getString(1);
        while (resultSet.next()) {
            felt += ", " + resultSet.getString(1);
        }

        String query = "INSERT INTO " + tabell + "(" + felt + ") values( '" + values[0] + "'";
        for (int i = 1; i < values.length; i++) {
            query += ", ";
            query += "'" + values[i] + "'";
        }
        query += ")";
        System.out.println(query);
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.executeUpdate();

    }

    public ArrayList<Rom> hentRomEtasje(int etasjen) throws Exception {
        return new ArrayList(jdbcTemplateObject.query("SELECT * FROM rom where etasje = " + etasjen, new RomMapper()));
    }

    public ArrayList<Rom> romSok(String romnavn) throws Exception, SQLException {
        ArrayList arr = new ArrayList();
        resultSet = statement.executeQuery("SELECT * FROM rom where romnr like '%" + romnavn + "%'");
        Rom r;
        while (resultSet.next()) {
            String romnr = resultSet.getString("romnr");
            int etasje = resultSet.getInt("etasje");
            int plasser = resultSet.getInt("plasser");
            boolean harSmart = resultSet.getBoolean("harSmartboard");
            boolean harSkjerm = resultSet.getBoolean("harSkjerm");
            boolean harProsjektor = resultSet.getBoolean("harProsjektor");
            int tilgn = resultSet.getInt("tilgang");

            r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
            r.toString();
            arr.add(r);
        }

        return arr;
    }

    public ArrayList<Rom> romSok2(int etasje, int plasser, boolean harSmart, boolean harSkjerm, boolean harProsjektor) throws Exception, SQLException {
        String query = "select* from rom";
        if (etasje == 0) {
            query += " where etasje >0";
        } else {
            query += " where etasje = " + etasje;
        }

        if (plasser == 0) {
            query += " and plasser >0";
        } else {
            query += " and plasser >= " + plasser + " and plasser <=" + (plasser + 5);
        }

        if (harSmart) {
            query += " and harSmartboard = true";
        }

        if (harSkjerm) {
            query += " and harSkjerm = true";
        }

        if (harProsjektor) {
            query += " and harProsjektor = true";
        }

        ArrayList arr = new ArrayList();
        resultSet = statement.executeQuery(query);
        Rom r;
        while (resultSet.next()) {
            String romnr = resultSet.getString("romnr");
            etasje = resultSet.getInt("etasje");
            plasser = resultSet.getInt("plasser");
            harSmart = resultSet.getBoolean("harSmartboard");
            harSkjerm = resultSet.getBoolean("harSkjerm");
            harProsjektor = resultSet.getBoolean("harProsjektor");
            int tilgn = resultSet.getInt("tilgang");

            r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
            r.toString();
            arr.add(r);
        }

        return arr;
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

    public Bruker loggInn(String brukernavn, String passord) throws Exception, SQLException {
        Bruker bruker = null;
        String pass = hentPassord(brukernavn);
        if (pass.equals(sha1(passord))) {
            ResultSet res = statement.executeQuery("SELECT * from bruker where brukernavn = '" + brukernavn + "'");

            while (res.next()) {
                int brukertype = res.getInt("brukertype");
                String navn = res.getString("navn");
                String pw = res.getString("passord");
                String mail = res.getString("mail");

                bruker = new Bruker(brukernavn, brukertype, navn, pw, mail);

            }
        }

        return bruker;
    }

    public ArrayList<String> hentStudenterIFag(String fagkode) throws Exception, SQLException {
        ArrayList<String> studenter = new ArrayList();
        resultSet = statement.executeQuery("SELECT brukernavn FROM fagstudent where fagkode = '" + fagkode + "'");

        while (resultSet.next()) {
            String brukernavn = resultSet.getString("brukernavn");
            studenter.add(brukernavn);
        }
        return studenter;
    }

    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
            }
        }
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
            }
        }

    }

    public ArrayList<Booking> hentBooking(String romnr) {
        return new ArrayList(jdbcTemplateObject.query("SELECT * FROM booking where romnummer = '" + romnr + "'", new RomMapper()));
    }

    public boolean regBooking(String brukernavn, Booking b, int brukerType) throws Exception, SQLException {
        ArrayList<Booking> booking = hentBooking(b.getRomNummer());
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
        Date dateFra = formatter.parse(b.getFratid());
        Date dateTil = formatter.parse(b.getTiltid());
        for (int i = 0; i < booking.size(); i++) {
            //System.out.println(b.getFratid().after(booking.get(0).getFratid()) + "" + b.getTiltid().before(booking.get(0).getTiltid()));
            Date gammelFra = formatter.parse(booking.get(i).getFratid());
            Date gammelTil = formatter.parse(booking.get(i).getTiltid());
            if ((dateFra.after(gammelFra) || dateFra.equals(gammelFra)) && dateFra.before(gammelTil) || (dateTil.after(gammelFra) || dateTil.equals(gammelFra)) && dateTil.before(gammelTil)) {

                return false;
            } else if ((gammelFra.after(dateFra) || dateFra.equals(gammelFra)) && gammelTil.before(dateFra) || (gammelFra.after(dateTil) || dateTil.equals(gammelFra)) && gammelTil.before(dateTil)) {

                return false;
            } else if (dateFra.before(gammelFra) && dateTil.after(gammelTil)) {
                return false;
            }

        }

        jdbcTemplateObject.execute("INSERT INTO booking (`bookingId`, `brukernavn`, `romNummer`, `fratid`, `tiltid`)values( NULL,'" + brukernavn + " ' , '" + b.getRomNummer() + "'," + "'" + b.getFratid() + "', '" + b.getTiltid() + "')");

        return true;
    }

}

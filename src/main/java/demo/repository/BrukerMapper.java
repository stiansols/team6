package demo.repository;

import Klasser.Bruker;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Seva
 */
public class BrukerMapper implements RowMapper<Bruker> {

    @Override
    public Bruker mapRow(ResultSet rs, int i) throws SQLException {
        Bruker bruker = new Bruker();
        bruker.setBrukernavn(rs.getString("brukernavn"));
        bruker.setBrukertype(Integer.parseInt(rs.getString("brukertype")));
        bruker.setNavn(rs.getString("navn"));
        bruker.setPassord(rs.getString("passord"));
        bruker.setMail(rs.getString("mail"));
        return bruker;
    }
}
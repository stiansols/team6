package demo.repository;

import Klasser.Fag;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Seva
 */
public class FagMapper implements RowMapper<Fag> {

    @Override
    public Fag mapRow(ResultSet rs, int i) throws SQLException {
        Fag fag = new Fag();
        fag.setFagkode(rs.getString("fagkode"));
        fag.setNavn(rs.getString("navn"));
        return fag;
    }
}

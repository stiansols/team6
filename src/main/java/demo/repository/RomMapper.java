package demo.repository;

import Klasser.Rom;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Seva
 */
public class RomMapper implements RowMapper<Rom> {

    @Override
    public Rom mapRow(ResultSet rs, int i) throws SQLException {
        Rom rom = new Rom();
        rom.setRomnr(rs.getString("romnr"));
        rom.setEtasje(Integer.parseInt(rs.getString("etasje")));
        rom.setPlasser(Integer.parseInt(rs.getString("plasser")));
        rom.setHarSmartboard(Boolean.parseBoolean(rs.getString("harsmartboard")));
        rom.setHarSkjerm(Boolean.parseBoolean(rs.getString("harskjerm")));
        rom.setHarProsjektor(Boolean.parseBoolean(rs.getString("harprosjektor")));
        rom.setTilgang(Integer.parseInt(rs.getString("tilgang")));
        return rom;
    }
}
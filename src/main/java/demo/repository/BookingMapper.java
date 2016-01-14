/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.repository;

import Klasser.Booking;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Seva
 */
public class BookingMapper implements RowMapper<Booking> {

    @Override
    public Booking mapRow(ResultSet rs, int i) throws SQLException {
        Booking booking = new Booking();
        booking.setBookingId(rs.getInt("bookingId"));
        booking.setBrukernavn(rs.getString("brukernavn"));
        booking.setRomNummer(rs.getString("romnummer"));
        booking.setFratid(rs.getString("fratid"));
        booking.setTiltid(rs.getString("tiltid"));
        return booking;
    }
}
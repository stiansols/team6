/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

import database.DbConnection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Svein
 */
public class Test {
    public static void main(String[] args)throws Exception{
        try{
            Administrator a = new Administrator();
            DbConnection et = new DbConnection();
            String[] verdier = {"brukernavn1", "2", "2013-04-13", "2014-06-07"};
            et.leggTil("booking", verdier);
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
    }
    
}

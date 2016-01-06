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
        Administrator a = new Administrator();
        DbConnection et = new DbConnection();
        
        ArrayList q = new ArrayList<>();
        try{
            
            et.hentRom(q);
            
        
                
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
    }
    
}

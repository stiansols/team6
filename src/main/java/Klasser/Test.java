/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Klasser;

import java.sql.SQLException;

/**
 *
 * @author Svein
 */
public class Test {
    public static void main(String[] args)throws Exception{
        Administrator a = new Administrator();
        try{
            
        a.RegBruker("sondre",1, "sondre", "123", "epost",0);
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
    }
    
}

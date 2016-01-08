/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import Klasser.Rom;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import database.DbConnection;
import java.sql.SQLException;
/**
 *
 * @author Benjamin
 */
@Controller
public class Kontroller {
    
    @RequestMapping("/*")
    public String visStartView(){
        System.out.println("FEil ****************************");
     return "index";   
    }
    
    @RequestMapping("/romOversikt")
    public String visRomOversikt(){
        return "romOversikt";   
    }
    
    @RequestMapping("/booking")
    public String visBooking(){
        return "booking";   
    }
    
    @ModelAttribute("alleRom")
    public ArrayList getHobby() throws SQLException, Exception
    {
        ArrayList alleRom = new ArrayList();

        DbConnection et = new DbConnection();
        
        ArrayList<Rom> q = new ArrayList<>();
        try{
            
            q = et.hentRom(q);
            
         for(int i = 0; i < q.size(); i++){
            alleRom.add(q.get(i).getRomnr());
            
        }
                 
        }catch(SQLException e ){
            System.out.println(e + " fail");
        }
        

            return alleRom;
    }
}

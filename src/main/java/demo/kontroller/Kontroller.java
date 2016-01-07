/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    @ModelAttribute("alleRom")
    public ArrayList getHobby()
    {
            ArrayList alleRom = new ArrayList();
            
            //placeholder, skal hentes fra databasen
            alleRom.add("K353");
            alleRom.add("103");
            alleRom.add("G256");
            return alleRom;
    }
}

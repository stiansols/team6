/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.kontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Benjamin
 */
@Controller
public class Kontroller {
    
    @RequestMapping("/")
    public String visStartView(){
        System.out.println("FEil ****************************");
     return "index";   
    }
    
    
}

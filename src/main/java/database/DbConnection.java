package database;
import Klasser.Avtale;
import Klasser.Booking;
import Klasser.Bruker;
import Klasser.Fag;
import Klasser.Rom;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
 

public class DbConnection {
        private Statement statement;
        private Connection connection;
        private DataSource dataSource;
        private ApplicationContext appContext;
        private ResultSet resultSet = null;
        private PreparedStatement preparedStatement = null;
        
        public DbConnection()throws SQLException{
            appContext = new ClassPathXmlApplicationContext("beans.xml");
            dataSource = (DataSource) appContext.getBean("dataSource");
            connection = dataSource.getConnection();
            statement = connection.createStatement();
        
        }
        
        public void opprettForbindelse() throws SQLException{
            appContext = new ClassPathXmlApplicationContext("beans.xml");
            dataSource = (DataSource) appContext.getBean("dataSource");
            connection = dataSource.getConnection();
            statement = connection.createStatement();
        }
   
        public void executeUpdate(String query)throws Exception, SQLException {
       
         try{
             statement.executeUpdate(query);
            
         }catch(SQLException e){
             
         }finally{
              if(connection != null){
        try{
            connection.close();
        }catch(SQLException e){
        }
       }
        if(statement != null){
        try{
            statement.close();
        }catch(SQLException e){   
        }
        }
        if(preparedStatement != null){
        try{
          preparedStatement.close();       
                     }
                 catch(SQLException e){        
                             }
        }
        if(resultSet != null){
        try{
         resultSet.close();  
                     }  
                 catch(SQLException e){           
                             }
       }
         }
            
            
        }
            
            public ArrayList hentRom(ArrayList<Rom> a) throws Exception, SQLException{
             
                try{
                    resultSet = statement.executeQuery("SELECT * FROM rom");
                    Rom r ;
                while(resultSet.next()) {
                    String romnr = resultSet.getString("romnr");           
                    int etasje = resultSet.getInt("etasje");                     
                    int plasser = resultSet.getInt("plasser");
                    boolean harSmart =resultSet.getBoolean("harSmartboard");
                    System.out.println(harSmart);
                    boolean harSkjerm = resultSet.getBoolean("harSkjerm");
                    boolean harProsjektor = resultSet.getBoolean("harProsjektor");
                    int tilgn = resultSet.getInt("tilgang");
                    
                    r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
                    r.toString();
                    a.add(r);
                    
                }
                for(int i = 0; i<a.size(); i++){
                    System.out.println(a.get(i));
                }
                return a;        
                } catch(Exception e){
                    
                } finally{
                    if(connection != null){
        try{
            connection.close();
        }catch(SQLException e){
        }
       }
        if(statement != null){
        try{
            statement.close();
        }catch(SQLException e){   
        }
        }
        if(preparedStatement != null){
        try{
          preparedStatement.close();       
                     }
                 catch(SQLException e){        
                             }
        }
        if(resultSet != null){
        try{
         resultSet.close();  
                     }  
                 catch(SQLException e){           
                             }
       }
                }
                return null;
            
            }
            
            public ArrayList<Bruker> hentAlleBrukere() throws Exception, SQLException{
                ArrayList<Bruker> liste = new ArrayList();
                try{
                    resultSet = statement.executeQuery("SELECT * FROM bruker");
                Bruker b;
                while(resultSet.next()){
                    String brukernavn = resultSet.getString("brukernavn");
                    int brukertype = resultSet.getInt("brukertype");
                    String navn = resultSet.getString("navn");
                    String passord = resultSet.getString("passord");
                    String mail = resultSet.getString("mail");
                    
                    b = new Bruker(brukernavn, brukertype, navn, passord, mail);
                    liste.add(b);
                }
                return liste;
                } catch(SQLException e){
                    
                } finally{
                    if(connection != null){
        try{
            connection.close();
        }catch(SQLException e){
        }
       }
        if(statement != null){
        try{
            statement.close();
        }catch(SQLException e){   
        }
        }
        if(preparedStatement != null){
        try{
          preparedStatement.close();       
                     }
                 catch(SQLException e){        
                             }
        }
        if(resultSet != null){
        try{
         resultSet.close();  
                     }  
                 catch(SQLException e){           
                             }
       }
                }
                return null;
            }
            
            public Bruker hentBruker(String brukernavn) throws Exception, SQLException{
                try{
                    resultSet = statement.executeQuery("SELECT * FROM bruker where brukernavn = '"+brukernavn+"'");
                Bruker b = null;
                while(resultSet.next()){
                    String brukernavn1 = resultSet.getString("brukernavn");
                    int brukertype = resultSet.getInt("brukertype");
                    String navn = resultSet.getString("navn");
                    String passord = resultSet.getString("passord");
                    String mail = resultSet.getString("mail");
                    
                    b = new Bruker(brukernavn1, brukertype, navn, passord, mail);
                }
                resultSet = statement.executeQuery("SELECT * FROM booking where brukernavn = '"+brukernavn+"'");
                while(resultSet.next()){
                    Booking nyBooking = new Booking();
                    nyBooking.setBookingId(resultSet.getInt("bookingID"));
                    nyBooking.setFratid(resultSet.getString("fratid"));
                    nyBooking.setTiltid(resultSet.getString("tiltid"));
                    nyBooking.setBrukernavn(brukernavn);
                    nyBooking.setRomNummer(resultSet.getString("romnr"));
                    b.setBookinger(nyBooking);
                }
                resultSet = statement.executeQuery("SELECT * FROM personligavtale where brukernavn = '"+brukernavn+"'");
                while(resultSet.next()){
                    Avtale nyAvtale = new Avtale();
                    nyAvtale.setId(resultSet.getInt("avtaleId"));
                    nyAvtale.setStartTid(resultSet.getTimestamp("fratid"));
                    nyAvtale.setSluttTid(resultSet.getTimestamp("tiltid"));
                    nyAvtale.setBeskrivelse(resultSet.getString("beskrivelse"));
                    nyAvtale.setRomNr(resultSet.getString("romnr"));
                    b.setAvtaler(nyAvtale);
                }
                return b;
                }catch(SQLException e){
                    
                } finally{
                    if(connection != null){
                                    try{
                                        connection.close();
                                    }catch(SQLException e){
                                    }
                                   }
                                    if(statement != null){
                                    try{
                                        statement.close();
                                    }catch(SQLException e){   
                                    }
                                    }
                                    if(preparedStatement != null){
                                    try{
                                      preparedStatement.close();       
                                                 }
                                             catch(SQLException e){        
                                                         }
                                    }
                                    if(resultSet != null){
                                    try{
                                     resultSet.close();  
                                                 }  
                                             catch(SQLException e){           
                                                         }
                                   }
            
                }
                return null;
            }
            
             public ArrayList<Fag> hentAlleFag() throws Exception, SQLException {
                 try{
                     resultSet = statement.executeQuery("SELECT * FROM fag");
                 Fag fag = null;
                 ArrayList<Fag> alleFag = new ArrayList();
                 while(resultSet.next()){
                    String fagkode = resultSet.getString("fagkode");
                    String navn = resultSet.getString("navn");
                    
                    fag = new Fag(fagkode, navn);
                    alleFag.add(fag);
                 }
                 return alleFag;
                 }catch(SQLException e){
                     
                 } finally{
                            if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
            
                 }
                 return null;
             }
            
             public void leggTilFag(String fagkode, String navn) throws Exception, SQLException{
                 try{
                     preparedStatement = connection.prepareStatement("INSERT INTO fag values( '"+ fagkode + " ' , '"  + navn + "')");
                     preparedStatement.executeUpdate();
                 } catch(SQLException e){
                     // Gi en feilmelding til bruker...... hvis f.eks faget finnes fra før osv.
                      System.out.println("FEIL: " + e);
                 } finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
             
            }
             
             public void slettFag(String fagkode) throws Exception, SQLException{
                 try{
                     preparedStatement = connection.prepareStatement("DELETE FROM fag where fagkode = '" + fagkode + "'");                                                             
                     preparedStatement.executeUpdate();
                 } catch(SQLException e){
                     // Gi en feilmelding til bruker...... 
                      System.out.println("FEIL!: " + e);
                 } finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
             }
           
             public void lagBruker(String brukernavn, int brukertype, String navn, String passord, String mail) throws Exception, SQLException{
                 try{
                     preparedStatement = connection.prepareStatement("INSERT INTO bruker values ('"+ brukernavn +"','" + brukertype + "', '" + navn + "', SHA1('" + passord + "'), '"+ mail +"')");                                                             
                     preparedStatement.executeUpdate();  
                 } catch(SQLException e){
                     System.out.println("FEIL: " + e);
                 } finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
                 
             }
             
             public void slettBruker(String brukernavn) throws Exception, SQLException{
                 try{
                     preparedStatement = connection.prepareStatement("DELETE FROM bruker where brukernavn = '"+ brukernavn +"'");                                             
                     preparedStatement.executeUpdate();  
                 } catch(SQLException e){
                     System.out.println("FEIL: " + e);
                 } finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
             }
             public void oppdaterBruker(String brukernavn, int brukertype, String navn, String mail) throws Exception, SQLException{
                 preparedStatement = null;
                 try{
                     preparedStatement = connection.prepareStatement("UPDATE bruker SET brukertype = '" + brukertype + "', navn = '"+ navn +"', mail = '" + mail + "' where brukernavn = '" + brukernavn + "'");                                            
                     preparedStatement.executeUpdate();  
                 } catch(SQLException e){
                     System.out.println("FEIL oppdater bruker: " + e);
                 }  finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
                 
             }
             
              public void oppdaterPassord(String brukernavn, String passord) throws Exception, SQLException{
                 try{
                     preparedStatement = connection.prepareStatement("UPDATE bruker SET passord = SHA1('" + passord + "') where brukernavn = '" + brukernavn + "'");                                            
                     preparedStatement.executeUpdate();  
                 } catch(SQLException e){
                     System.out.println("FEIL oppdater bruker: " + e);
                 }  finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
             }
              
              public void oppdaterMail(String brukernavn, String mail) throws Exception, SQLException{
                 preparedStatement = null;
                 try{
                     preparedStatement = connection.prepareStatement("UPDATE bruker SET mail = '" + mail + "' where brukernavn = '" + brukernavn + "'");                                            
                     preparedStatement.executeUpdate();  
                 } catch(SQLException e){
                     System.out.println("FEIL oppdater bruker: " + e);
                 }  finally{
                      if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                 }
             }                
              
             
            public void slett(String tabell, String pr_key, String keyValue) throws Exception, SQLException {
                try{
                    String query = "DELETE FROM " + tabell + " WHERE " + pr_key + " = '" + keyValue + "'";

                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.executeUpdate();
                } catch(SQLException e){
                    // Gi en feilmelding til bruker...... hvis f.eks faget finnes fra før osv.
                     System.out.println("FEIL: " + e);
                } finally{
                     if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                }
            }
            
            public String hentPassord(String brukernavn) throws Exception, SQLException{
                String pass = "";
                try{
                    resultSet = statement.executeQuery("SELECT passord FROM bruker where brukernavn = '"+brukernavn+"'");
                    resultSet.next();
                    pass = resultSet.getString("passord");                             
                }catch(Exception e){
                        
                } finally{
                     if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                }
                return pass;
            }
            
        
            public void leggTil(String tabell, String[] values) throws Exception, SQLException{
                try{
                     
                    resultSet = statement.executeQuery("SELECT `COLUMN_NAME` \n" +
                                                                "FROM `INFORMATION_SCHEMA`.`COLUMNS` \n" +
                                                                "WHERE `TABLE_SCHEMA`='g_scrum_t6' \n" +
                                                                "    AND `TABLE_NAME`='" + tabell + "';");
                    String felt = "";
                    resultSet.next();
                    resultSet.next();
                    felt += resultSet.getString(1);
                    while(resultSet.next()) {
                        felt += ", " + resultSet.getString(1);
                    }
                    
                    String query = "INSERT INTO " + tabell + "(" + felt + ") values( '" + values[0] + "'";
                    for(int i=1; i<values.length; i++) {
                        query += ", ";
                        query += "'" + values[i] +  "'";
                    }
                    query += ")";
                    System.out.println(query);
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.executeUpdate();
                } catch(SQLException e){
                    // Gi en feilmelding til bruker...... hvis f.eks faget finnes fra før osv.
                     System.out.println("FEIL: " + e);
                } finally{
                     if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                }
            }
            
            public ArrayList<Rom> hentRomEtasje(int etasjen)throws Exception, SQLException{
            ArrayList arr = new ArrayList();     
            try{
                resultSet = statement.executeQuery("SELECT * FROM rom where etasje = " + etasjen);
                Rom r ;
                while(resultSet.next()) {
                    String romnr = resultSet.getString("romnr");           
                    int etasje = resultSet.getInt("etasje");                     
                    int plasser = resultSet.getInt("plasser");
                    boolean harSmart =resultSet.getBoolean("harSmartboard");
                    boolean harSkjerm = resultSet.getBoolean("harSkjerm");
                    boolean harProsjektor = resultSet.getBoolean("harProsjektor");
                    int tilgn = resultSet.getInt("tilgang");
                    
                    r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
                    r.toString();
                    arr.add(r);
                }
                }catch(Exception e){
                        
                } finally{
                 if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
            }
            return arr;
            }
            
            public ArrayList<Rom> romSok(String romnavn)throws Exception, SQLException{
            ArrayList arr = new ArrayList();     
            try{
                resultSet = statement.executeQuery("SELECT * FROM rom where romnr like '%"+romnavn+"%'");
                Rom r ;
                while(resultSet.next()) {
                    String romnr = resultSet.getString("romnr");           
                    int etasje = resultSet.getInt("etasje");                     
                    int plasser = resultSet.getInt("plasser");
                    boolean harSmart =resultSet.getBoolean("harSmartboard");
                    boolean harSkjerm = resultSet.getBoolean("harSkjerm");
                    boolean harProsjektor = resultSet.getBoolean("harProsjektor");
                    int tilgn = resultSet.getInt("tilgang");
                    
                    r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
                    r.toString();
                    arr.add(r);
                }
                }catch(Exception e){
                        
                } finally{
                 if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
            }
            return arr;
            }
            
            public ArrayList<Rom> romSok2(int etasje,int plasser,boolean harSmart,boolean harSkjerm,boolean harProsjektor) throws Exception, SQLException{
                String query="select* from rom";
            if(etasje == 0)query += " where etasje >0";
            else query += " where etasje = "+etasje;
            
            
            if(plasser == 0)query += " and plasser >0";
            else query+=" and plasser >= "+plasser + " and plasser <=" +(plasser+5) ;
            
            if(harSmart)query+=" and harSmartboard = true";
            
            if(harSkjerm)query+= " and harSkjerm = true";
            
            if(harProsjektor)query+= " and harProsjektor = true";
              
            ArrayList arr = new ArrayList();     
            try{
                resultSet = statement.executeQuery(query);
                Rom r ;
                while(resultSet.next()) {
                    String romnr = resultSet.getString("romnr");           
                    etasje = resultSet.getInt("etasje");                     
                    plasser = resultSet.getInt("plasser");
                    harSmart =resultSet.getBoolean("harSmartboard");
                    harSkjerm = resultSet.getBoolean("harSkjerm");
                     harProsjektor = resultSet.getBoolean("harProsjektor");
                    int tilgn = resultSet.getInt("tilgang");
                    
                    r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
                    r.toString();
                    arr.add(r);
                }
                }catch(Exception e){
                    System.out.println(e);
                        
                } finally{
                 if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
            }
            return arr;
            }
            
        static String sha1(String input) throws NoSuchAlgorithmException {
        MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
         
        return sb.toString();
    }
            
    
    public Bruker loggInn(String brukernavn, String passord) throws Exception, SQLException{
                Bruker bruker = null;
                try{
                    String pass = hentPassord(brukernavn);
                if(pass.equals(sha1(passord))){
                    opprettForbindelse();
                    ResultSet res = statement.executeQuery("SELECT * from bruker where brukernavn = '" +brukernavn + "'");
                    
                    while(res.next()){
                        int brukertype = res.getInt("brukertype");
                        String navn = res.getString("navn");
                        String pw = res.getString("passord");
                        String mail = res.getString("mail");
                    
                    bruker = new Bruker(brukernavn, brukertype, navn, pw, mail);
                    
                   return bruker;
                    }
                }
                    
                } catch(SQLException e){
                    
            } finally{
                    if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                            return bruker;
                }
    }
    
    public ArrayList<String> hentStudenterIFag(String fagkode) throws Exception, SQLException{
                ArrayList<String> studenter = new ArrayList();
                try{
                    resultSet = statement.executeQuery("SELECT brukernavn FROM fagstudent where fagkode = '" + fagkode + "'");
                
                while(resultSet.next()){
                    String brukernavn = resultSet.getString("brukernavn");
                    studenter.add(brukernavn);
                }
                }catch(SQLException e){
                    
                }finally{
                        if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
                }
                
                return studenter;
            }
            
    
    public void close(){
        if(connection != null){
        try{
            connection.close();
        }catch(SQLException e){
        }
       }
        if(statement != null){
        try{
            statement.close();
        }catch(SQLException e){   
        }
        }
        if(preparedStatement != null){
        try{
          preparedStatement.close();       
                     }
                 catch(SQLException e){        
                             }
        }
        if(resultSet != null){
        try{
         resultSet.close();  
                     }  
                 catch(SQLException e){           
                             }
       }
 
   }
  public ArrayList<Booking> hentBooking(String romnr) throws Exception, SQLException{
               
               ArrayList bookinger = new ArrayList();
               
               try{
                ResultSet resultSet = statement.executeQuery("select* from booking where romnr= '" + romnr + "'");
                
                while(resultSet.next()){
                    int bookingId = resultSet.getInt("bookingId");
                    String brukernavn = resultSet.getString("brukernavn");
                    String fratid = resultSet.getString("fratid");
                    String romNummer = resultSet.getString("romnr");
                    String tiltid = resultSet.getString("tiltid");
                    
                   Booking b= new Booking();
                   b.setBookingId(bookingId);
                   b.setBrukernavn(brukernavn);
                   b.setFratid(fratid);
                   b.setRomNummer(romNummer);
                   b.setTiltid(tiltid);
                   bookinger.add(b);
                   System.out.println(b.getTiltid());
                }
                return bookinger;
               }catch(SQLException e){
                   System.out.println(e);
               } finally{
                   if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
               }
              return null; 
           }
    
        public boolean regBooking(String brukernavn,Booking b,int brukerType) throws Exception, SQLException{
            ArrayList<Booking> booking = hentBooking(b.getRomNummer());
            opprettForbindelse();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HH-mm");
            Date dateFra = formatter.parse(b.getFratid());
            Date dateTil = formatter.parse(b.getTiltid());
            for(int i =0; i<booking.size(); i++){
               //System.out.println(b.getFratid().after(booking.get(0).getFratid()) + "" + b.getTiltid().before(booking.get(0).getTiltid()));
                
                if((dateFra.after(formatter.parse(booking.get(i).getFratid())) || dateFra.equals(formatter.parse(booking.get(i).getFratid()))) && (dateTil.before(formatter.parse(booking.get(i).getTiltid())) || dateTil.equals(formatter.parse(booking.get(i).getTiltid())))){
                  if(brukerType < b.getBrukertype()){
                      String sql = "INSERT INTO booking (`bookingId`, `brukernavn`,`brukertype` ,`romnr`, `fratid`, `tiltid`) values ( 60,'"+ brukernavn+ "' , "+b.getBrukertype()+"  , '"  + b.getRomNummer() + "' , '"+b.getFratid()+"', '"+b.getTiltid()+"')";
                    }
                  else if(brukerType == b.getBrukertype()) return false;
                  else return false;
                    
                  return false;
                }
            }
            try{
                Statement statement = connection.createStatement();
                String sql = "INSERT INTO booking (`bookingId`, `brukernavn`,`brukertype` ,`romnr`, `fratid`, `tiltid`) values ( 60,'"+ brukernavn+ "' , "+b.getBrukertype()+"  , '"  + b.getRomNummer() + "' , '"+b.getFratid()+"', '"+b.getTiltid()+"')";
                statement.executeUpdate(sql);
            }catch(SQLException e){
                System.out.println(e);
            } finally{
                        if(connection != null){
                            try{
                                connection.close();
                            }catch(SQLException e){
                            }
                           }
                            if(statement != null){
                            try{
                                statement.close();
                            }catch(SQLException e){   
                            }
                            }
                            if(preparedStatement != null){
                            try{
                              preparedStatement.close();       
                                         }
                                     catch(SQLException e){        
                                                 }
                            }
                            if(resultSet != null){
                            try{
                             resultSet.close();  
                                         }  
                                     catch(SQLException e){           
                                                 }
                           }
            }
           return true;         
        }
           
}    


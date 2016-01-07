package database;
import Klasser.Rom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
 

public class DbConnection {

        Statement statement;
        Connection connection;
        DataSource dataSource;
        ApplicationContext appContext;
        public DbConnection()throws SQLException{
            appContext = new ClassPathXmlApplicationContext("beans.xml");
            dataSource = (DataSource) appContext.getBean("dataSource");
            connection = dataSource.getConnection();
            statement = connection.createStatement();
        
        }
               
    
    /*public static void main(String[] args) throws Exception {
 
        appContext = new ClassPathXmlApplicationContext("beans.xml");
        dataSource = (DataSource) appContext.getBean("dataSource");
 
        connection = dataSource.getConnection();
        System.out.println("Database with data source connected!");
        String result = query(connection);
        System.out.println(result);
    }*/
 
      /*  private static String query(Connection connection) throws SQLException{
 
        String query="";
         statement = connection.createStatement();
 
        ResultSet resultSet = statement.executeQuery("SELECT * FROM rom");
 
        while(resultSet.next()) {
            int id = resultSet.getInt("etasje");
            String nimi = resultSet.getString("romnr");  
 
            query = query + id + "\t" + nimi + "\n";
        }
        return query;
    }*/
        public void executeUpdate(String query)throws Exception {
         //   ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
         //   DataSource dataSource = (DataSource) appContext.getBean("dataSource");
         //   Connection connection = dataSource.getConnection();
         //   Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("success");
            
        }
            
            public ArrayList hentRom(ArrayList<Rom> a)throws Exception{
             

                ResultSet resultSet = statement.executeQuery("SELECT * FROM rom");
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
            
            }
            
             public void leggTilFag(String fagkode, String navn){
                 try{
                     PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO fag values( '"+ fagkode + " ' , '"  + navn + "')");
                     preparedStatement.executeUpdate();
                 } catch(SQLException e){
                     // Gi en feilmelding til bruker...... hvis f.eks faget finnes fra før osv.
                      System.out.println("FEIL: " + e);
                 }
             
            }
             
             public void slettFag(String fagkode){
                 try{
                     PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM fag where fagkode = '" + fagkode + "'");                                                             
                     preparedStatement.executeUpdate();
                 } catch(SQLException e){
                     // Gi en feilmelding til bruker...... 
                      System.out.println("FEIL: " + e);
                 }
             }
           
             public void lagBruker(String brukernavn, int brukertype, String navn, String passord, String mail){
                 try{
                     PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO bruker values ('"+ brukernavn +"','" + brukertype + "', '" + navn + "', SHA1('" + passord + "'), '"+ mail +"')");                                                             
                     preparedStatement.executeUpdate();  
                 } catch(SQLException e){
                     System.out.println("FEIL: " + e);
                 }
                 
             }
             
        public void slett(String tabell, String pr_key, String keyValue) {
            try{
                String query = "DELETE FROM " + tabell + " WHERE " + pr_key + " = '" + keyValue + "'";

                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.executeUpdate();
            } catch(SQLException e){
                // Gi en feilmelding til bruker...... hvis f.eks faget finnes fra før osv.
                 System.out.println("FEIL: " + e);
            }
        }
        
        public void leggTil(String tabell, String[] values) {
            try{
                String query = "INSERT INTO " + tabell + " values( '" + values[0];
                for(int i=1; i<values.length; i++) {
                    query += "', ";
                    query += "'" + values[i] +  "'";
                }
                query += ")";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.executeUpdate();
            } catch(SQLException e){
                // Gi en feilmelding til bruker...... hvis f.eks faget finnes fra før osv.
                 System.out.println("FEIL: " + e);
            }
        }
}
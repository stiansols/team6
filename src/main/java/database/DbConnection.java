package database;
import Klasser.Rom;
import java.sql.Connection;
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
 
        private static String query(Connection connection) throws SQLException{
 
        String query="";
         statement = connection.createStatement();
 
        ResultSet resultSet = statement.executeQuery("SELECT * FROM rom");
 
        while(resultSet.next()) {
            int id = resultSet.getInt("etasje");
            String nimi = resultSet.getString("romnr");  
 
            query = query + id + "\t" + nimi + "\n";
        }
        return query;
    }
        public void executeUpdate(String query)throws Exception {
         //   ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
         //   DataSource dataSource = (DataSource) appContext.getBean("dataSource");
         //   Connection connection = dataSource.getConnection();
         //   Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("success");
            
        }
            
            public ArrayList hentRom(ArrayList a)throws Exception{
                ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
                DataSource dataSource = (DataSource) appContext.getBean("dataSource");
               Connection connection = dataSource.getConnection();
              Statement statement = connection.createStatement();
               

                ResultSet resultSet = statement.executeQuery("SELECT * FROM rom");
                Rom r ;
                while(resultSet.next()) {
                    int etasje = resultSet.getInt("etasje");
                    String romnr = resultSet.getString("romnr");  
                    int plasser = resultSet.getInt("plasser");
                    boolean harSmart =resultSet.getBoolean("harSmartboard");
                    boolean harSkjerm = resultSet.getBoolean("harSkjerm");
                    boolean harProsjektor = resultSet.getBoolean("harProsjektor");
                    int tilgn = resultSet.getInt("tilgang");
                    
                    r = new Rom(romnr, etasje, plasser, harSmart, harSkjerm, harProsjektor, tilgn);
                    a.add(r);
                    
                }
                for(int i = 0; i<a.size(); i++){
                    System.out.println(a.get(i));
                }
                return a;        
            
            }
 
}
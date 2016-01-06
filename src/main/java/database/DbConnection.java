package database;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
 

public class DbConnection {
    
    public static void main(String[] args) throws Exception {
 
        ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
        DataSource dataSource = (DataSource) appContext.getBean("dataSource");
 
        Connection connection = dataSource.getConnection();
        System.out.println("Database with data source connected!");
        String result = query(connection);
        System.out.println(result);
    }
 
        private static String query(Connection connection) throws SQLException{
 
        String query="";
         Statement statement = connection.createStatement();
 
        ResultSet resultSet = statement.executeQuery("SELECT * FROM table1");
 
        while(resultSet.next()) {
            int id = resultSet.getInt("id");
            String nimi = resultSet.getString("name");  
 
            query = query + id + "\t" + nimi + "\n";
        }
        return query;
    }
        public void executeQuery(String query)throws Exception {
            ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
            DataSource dataSource = (DataSource) appContext.getBean("dataSource");
            Connection connection = dataSource.getConnection();
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("success");
            
        }
 
}
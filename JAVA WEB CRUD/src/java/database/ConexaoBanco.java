
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.sql.Statement;
public class ConexaoBanco {
    
    static Connection con;
    
     public ConexaoBanco() {                        
        
        System.out.println("Conectando ao banco...");
                
     try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            System.out.println("Conectado.");

        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(ConexaoBanco.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
 
         
    } //Possibilita instancias
    
    
    public ResultSet select() throws SQLException{   
        String sqlConsulta = "select * from teste";
        Statement st = con.createStatement();
        st.executeQuery(sqlConsulta);
        ResultSet rs = st.executeQuery(sqlConsulta); 
        return rs; 
        }   

public Connection GetCon (){
    return con;   
}    
    
    public int close_conn() throws SQLException{
        con.close();
        return 0;    
    }
 
    
}
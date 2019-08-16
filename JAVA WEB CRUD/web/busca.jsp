<%-- 
    Document   : conectar.jsp
    Created on : 03/08/2019, 12:51:18
    Author     : Ietzz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.ConexaoBanco"%>
<%@page import="java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Instancia conexão com o Banco de Dados
            ConexaoBanco c = new ConexaoBanco();   
            // Cria variavel para "setar" resultados
            ResultSet rs;
            // Salva resultados da função select na variavel criada
            rs = c.select();   
            // Printa resultados
            while (rs.next()) {
                    int id = rs.getInt("idTest"); 
                    out.println("Id: "+id);
                    String nm = rs.getString("Nme");               
                    out.println("Nome: "+nm+"</p>");
                }
            // Fecha conexão
            c.close_conn();   
        %>
        <a href="index.html">Voltar a Tela Inicial</a>
     </body>
</html>

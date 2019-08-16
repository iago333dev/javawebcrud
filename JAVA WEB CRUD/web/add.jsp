<%-- 
    Document   : adicionar
    Created on : 08/08/2019, 00:41:10
    Author     : Ietzz
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.ConexaoBanco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
         // recebe parametro "nm" e salva em variavel "nome"      
         String nome = request.getParameter("nm");
         
        // recebe parametro 'id' e salva e variavem 'id' 
        int id =  Integer.parseInt(request.getParameter("id"));
        
        // instancia classe banco de dados  
         ConexaoBanco c =  new ConexaoBanco();
         
         //cria comando sql
         String sql = "insert into teste (idTest,Nme) values (?,?)";
         
         //prepara requisição sql com conexao banco
         PreparedStatement stmt = c.GetCon().prepareStatement(sql);
         
        // 'SETA' valores de variaveis ao comando sql
         stmt.setInt(1,id);
         stmt.setString(2,nome);
         
         // executa comando sql
         stmt.execute();
         
         //fecha conexao
         c.close_conn();
         
         // cria string de redirecionamento a pagina principal
         String url = "index.html" ;
         
         //redireciona para pagina
         response.sendRedirect(url);   
        %>    
    </body>
</html>

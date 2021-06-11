<%-- 
    Document   : distrito
    Created on : 14/12/2019, 09:59:00 AM
    Author     : Estudiante
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Distrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.min.js" type="text/javascript"></script>
        <script src="scripts/popper.min.js" type="text/javascript"></script>
        <title>Distrito</title>
    </head>
    <body>
        
        <%  Distrito d=new Distrito();
            LinkedList<Distrito> listaD;
            listaD=d.listaDsitrito();
            %>
            
            <h1 class="display-4">Lista de distritos</h1><br>
        
        <table class="table table-bordered table-light table-striped table-hover">
                        <thead style="background: black" class="text-white">
                            <tr>
                                <td>ID </td>
                                <td>Nombre</td>
                                <td>Provincia</td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listaD.size(); i++) {%>
                            <tr>
                                <td><%=listaD.get(i).getDistrito_id()%></td> 
                                <td><%=listaD.get(i).getDistrito_nombre()%></td>
                                <td><%=listaD.get(i).getDistrito_provincia()%></td>
                               
                            </tr>
                            <% };%>
                        </tbody>
                    </table>
                        <link href="../scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                        <script src="../scripts/bootstrap.min.js" type="text/javascript"></script>
                        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
                        <script src="../scripts/popper.min.js" type="text/javascript"></script>
    </body>
</html>

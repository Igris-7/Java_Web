<%-- 
    Document   : producto
    Created on : 14/12/2019, 09:59:16 AM
    Author     : Estudiante
--%>

<%@page import="modelo.Producto"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Modelo"%>
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
        
        <%  Modelo d=new Modelo();
            LinkedList<Modelo> listaD;
            listaD=d.listaModelo();
            
            Producto p=new Producto();
            LinkedList<Producto> listaP;
            listaP=p.listaProducto();
            %>
            
            <h1 class="display-4">Lista de productos</h1><br>

        
        <table class="table table-bordered table-light table-striped table-hover">
                        <thead style="background: black" class="text-white">
                            <tr>
                                <td>ID </td>
                                <td>Nombre</td>
                                <td>Precio</td>
                                <td>Modelo</td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listaP.size(); i++) {%>
                            <tr>
                                <td><%=listaP.get(i).getProducto_id()%></td> 
                                <td><%=listaP.get(i).getProducto_nombre()%></td>
                                <td><%=listaP.get(i).getProducto_precio()%></td>
                                <td><%=listaD.get(listaP.get(i).getModelo_id()-1).getModelo_nombre()%></td>
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



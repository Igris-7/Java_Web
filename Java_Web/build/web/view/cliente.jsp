<%-- 
    Document   : newjspcliente
    Created on : 14/12/2019, 09:59:22 AM
    Author     : Estudiante
--%>

<%@page import="modelo.Distrito"%>
<%@page import="modelo.Distrito"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.min.js" type="text/javascript"></script>
        <script src="scripts/popper.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
         <% Distrito d=new Distrito();
            LinkedList<Distrito> listaD;
            listaD=d.listaDsitrito();
            
            Cliente p=new Cliente();
            LinkedList<Cliente> listaP;
            listaP=p.listaCliente();
         %>
        
          <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="jumbotron">
                        <h1 style="text-align: center"><b>Registro de Cliente</b></h1>
                        <form name="nuevoCliente" method="post" action="view/agregar_cliente.jsp">
                            
                                
                                    <b>ID:</b><br>
                                    <input type="text" name="cliente_id" class="form-control"><br>
                                    <b>Nombre:</b><br>
                                     <input type="text" name="cliente_nombre" class="form-control"><br>
                                    <b>Direccion:</b><br>
                                     <input type="text" name="cliente_direccion" class="form-control"><br>
                                    <b>Distritos:</b><br>
                                   
                                     <select name="distrito_id" class="form-control">
                                    <% for (int i = 0; i < listaD.size(); i++) {
                                    %>
                                    <option value="<%= listaD.get(i).getDistrito_id()%>">
                                        <%= listaD.get(i).getDistrito_nombre()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select><br>
                                
                            
                            <input type="submit" value="Grabar" class="btn btn-primary"><br><br>
                        </form>
                    </div>
                </div>
            
         
         
        <div class="col-sm-6">
          <table class="table table-bordered table-light table-striped table-hover">
                        <thead style="background: black" class="text-white">
                            <tr>
                                <td>ID </td>
                                <td>Nombre</td>
                                <td>Direccion</td>
                                <td>Distrito</td>
                                <td>Editar</td>
                                <td>Eliminar</td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listaP.size(); i++) {%>
                            <tr>
                                <td><%=listaP.get(i).getCliente_id()%></td> 
                                <td><%=listaP.get(i).getCliente_nombre()%></td>
                                <td><%=listaP.get(i).getCliente_direccion()%></td>
                                <td><%=listaD.get(listaP.get(i).getDistrito_id()-1).getDistrito_nombre()%></td>
                                <td><a class =" btn btn-outline-info" href="view/cliente_editar.jsp?cliente_id=<%=listaP.get(i).getCliente_id()%>&cliente_nombre=<%=listaP.get(i).getCliente_nombre()%>&cliente_direccion=<%=listaP.get(i).getCliente_direccion()%>&distrito_id=<%=listaP.get(i).getDistrito_id()%>">Editar</a></td>
                                <td><a class =" btn btn-outline-danger" href="view/cliente_eliminar.jsp?cliente_id=<%=listaP.get(i).getCliente_id()%>&cliente_nombre=<%=listaP.get(i).getCliente_nombre()%>&cliente_direccion=<%=listaP.get(i).getCliente_direccion()%>&distrito_id=<%=listaP.get(i).getDistrito_id()%>">Eliminar</a></td>
                            </tr>
                            <% };%>
                        </tbody>
                    </table>
        </div>
                        <link href="../scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                        <script src="../scripts/bootstrap.min.js" type="text/javascript"></script>
                        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
                        <script src="../scripts/popper.min.js" type="text/javascript"></script>
            </div>
                  </div>        
    </body>
</html>

<%-- 
    Document   : pedido
    Created on : 14/12/2019, 09:59:38 AM
    Author     : Estudiante
--%>

<%@page import="modelo.Pedido"%>
<%@page import="modelo.Producto"%>
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
         <% 
             Cliente c=new Cliente();
            LinkedList<Cliente> listaC;
            listaC=c.listaCliente();
             
            Producto p=new Producto();
            LinkedList<Producto> listaP;
            listaP=p.listaProducto();
            

            Pedido pe=new Pedido();
            LinkedList<Pedido> Ped;
            Ped=pe.listaPedido();
            %>
            
             <div class="container">
         <div class="jumbotron">
                <h1 >Registro dePedido</h1>
                <form name="nuevoPedido" method="post" action="view/pedido_agregar.jsp">
                    <div class="row">
                        <div class="col-sm-6">
                            <b>Id Pedido</b><br>
                            <input type="text" name="pedido_id" class="form-control" required><br>
                            <b>Cliente:  </b><br>
                              <select name="cliente_id" class="form-control">
                                <% for (int i = 0; i < listaC.size(); i++) { 
                                %>
                                <option value="<%=listaC.get(i).getCliente_id()%>">
                                    <%=listaC.get(i).getCliente_nombre()%>
                                </option>
                                <%
                                    }
                                %>
                            </select><br>
                            <b>Producto : </b><br>
                            <select name="producto_id" class="form-control">
                                <% for (int i = 0; i < listaP.size(); i++) { 
                                %>
                                <option value="<%=listaP.get(i).getProducto_id()%>">
                                    <%=listaP.get(i).getProducto_nombre()%>
                                </option>
                                <%
                                    }
                                %>
                            </select><br>
                            <b>Cantidad : </b><br>
                            <input type="text" name="pedido_cantidad" class="form-control" required><br>    
                            <b>Fecha : </b><br>
                            <input type="date" name="pedido_fecha" class="form-control" required><br>    
                            
                        </div>
                    </div><br>
                    <input type="submit" value="Grabar" class="btn btn-success"><br><br>
                </form>
            </div>

            
            <h1 class="display-4">Registro de pedidos</h1>
            <br>
              <table class="table table-bordered table-light table-striped table-hover">
                        <thead style="background: black" class="text-white">
                            <tr>
                                <td>ID </td>
                                <td>Cliente</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>Fecha</td>
                                <td>Editar</td>
                                <td>Eliminar<td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < Ped.size(); i++) {%>
                            <tr>
                                <td><%=Ped.get(i).getPedido_id()%></td> 
                                <td><%=listaC.get(Ped.get(i).getCliente_id()-1).getCliente_nombre()%></td>
                                <td><%=listaP.get(Ped.get(i).getProducto_id()-1).getProducto_nombre()%></td>
                                <td><%=Ped.get(i).getPedido_cantidad()%></td>
                                <td><%=Ped.get(i).getPedido_fecha()%></td>
                                <td><a  class =" btn btn-outline-info" href="view/editar_pedido.jsp?pedido_id=<%=Ped.get(i).getPedido_id()%>&cliente_id=<%=Ped.get(i).getCliente_id()%>&producto_id=<%=Ped.get(i).getProducto_id()%>&pedido_cantidad=<%=Ped.get(i).getPedido_cantidad()%>&pedido_fecha=<%=Ped.get(i).getPedido_fecha()%>">Editar</a></td>
                                <td><a class =" btn btn-outline-danger" href="view/eliminar_pedido.jsp?pedido_id=<%=Ped.get(i).getPedido_id()%>&cliente_id=<%=Ped.get(i).getCliente_id()%>&producto_id=<%=Ped.get(i).getProducto_id()%>&pedido_cantidad=<%=Ped.get(i).getPedido_cantidad()%>&pedido_fecha=<%=Ped.get(i).getPedido_fecha()%>">Eliminar</a></td>

                            </tr>
                            <% };%>
                        </tbody>
                    </table>
             </div>
                        
    </body>
</html>

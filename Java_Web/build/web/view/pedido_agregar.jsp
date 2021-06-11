<%-- 
    Document   : pedido_agregar
    Created on : 16/11/2019, 12:43:12 PM
    Author     : Estudiante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/popper.min.js" type="text/javascript"></script>
        <title>Agregar Pedido</title>
    </head>
    <body>
         <%
         int pedido_id=Integer.parseInt(request.getParameter("pedido_id"));
         int cliente_id=Integer.parseInt(request.getParameter("cliente_id"));
         int producto_id=Integer.parseInt(request.getParameter("producto_id"));
         String pedido_cantidad=request.getParameter("pedido_cantidad");
         String pedido_fecha=request.getParameter("pedido_fecha");
        %>
        <div class="container">
         <div class="jumbotron">
                <h1 >Se agregara el siguiente Pedido</h1>
                <form name="nuevoPedido" method="post" action="../procesa_ped">
                    <div class="row">
                        <div class="col-sm-6">
                            <b>Id Pedido</b><br>
                            <input type="text" name="pedido_id"  value="<%=pedido_id%>" class="form-control" readonly="readonly"><br>
                            <b>Cliente:  </b><br>
                             <input type="text" name="cliente_id"  value="<%=cliente_id%>" class="form-control" readonly="readonly"><br>
                            <b>Producto : </b><br>
                              <input type="text" name="producto_id"  value="<%=producto_id%>" class="form-control" readonly="readonly"><br>
                            <b>Cantidad : </b><br>
                            <input type="text" name="pedido_cantidad"  value="<%=pedido_cantidad%>" class="form-control" readonly="readonly"><br>
                            <b>Fecha : </b><br>
                            <input type="text" name="pedido_fecha"  value="<%=pedido_fecha%>" class="form-control" readonly="readonly"><br>     
                        </div>
                    </div><br>
                    <input type="submit" value="Grabar" name="agregar_pedido" class="btn btn-success"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>

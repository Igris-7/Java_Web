<%-- 
    Document   : cliente_editar
    Created on : 14/12/2019, 11:53:34 AM
    Author     : Estudiante
--%>

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
            int cliente_id=Integer.parseInt(request.getParameter("cliente_id"));
            String cliente_nombre=request.getParameter("cliente_nombre");
            String cliente_direccion=request.getParameter("cliente_direccion");
            int distrito_id = Integer.parseInt(request.getParameter("distrito_id"));

            %>
        <div class="container">
         <div class="jumbotron">
             <h1><b>Se agregara el siguiente cliente: </b></h1>
                <form name="nuevoCliente" method="post" action="../procesa_cliente">
                    <div class="row">
                        <div class="col-sm-6">
                            <b>ID Cliente :</b><br>
                            <input type="text" name="cliente_id"  value="<%=cliente_id%>" class="form-control" readonly="readonly"><br>
                            <b>Nombre: </b><br>
                            <input type="text" name="cliente_nombre" value="<%=cliente_nombre%>" class="form-control" ><br>
                            <b>Direccion: </b><br>
                            <input type="text" name="cliente_direccion" value="<%=cliente_direccion%>" class="form-control" readonly="readonly"><br>     
                            <b>Distrito</b><br>
                            <input type="text" name="distrito_id" class="form-control" value="<%= distrito_id %>" readonly="readonly"><br>
                        </div>
                    </div><br>
                    <input type="submit" value="Grabar" name="editar_cliente" class="btn btn-success"><br><br>
                </form>
                        
            </div>
        </div>             
                        
                        
                        
                        
                        
                        
                        
                        <link href="../scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                        <script src="../scripts/bootstrap.min.js" type="text/javascript"></script>
                        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
                        <script src="../scripts/popper.min.js" type="text/javascript"></script>
    </body>
</html>

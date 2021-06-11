
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1">
          <link href="scripts/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.min.js" type="text/javascript"></script>
        <script src="scripts/popper.min.js" type="text/javascript"></script>
        
        <title>Menu</title>
  <style>
            body {
                background: #007bff;
                background: linear-gradient(to right, #284758, #33AAFF);
            }
        </style>
    </head>
    <body ><br><br><br>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="card" style="width: 400px">
                    <div class="card-body" style="text-align: center">
                        
                        <form  name="r_distrito" method="post" action="procesa_d">
                            <input type="submit" name="rdistrito" value="Distrito" style="width: 70%" class="form-control btn btn-success text white"><br><br>
                        </form>
                        <form  name="r_modelo" method="post" action="procesa_m">
                            <input type="submit" name="rmodelo" value="Modelo" style="width: 70%" class="form-control btn btn-success text white"><br><br>
                        </form>
                        <form  name="r_producto" method="post" action="procesa_p">
                            <input type="submit" name="rproducto" value="Producto" style="width: 70%" class="form-control btn btn-success text white"><br><br>
                        </form>
                        <form  name="r_cliente" method="post" action="procesa_c">
                            <input type="submit" name="rcliente" value="Cliente" style="width: 70%" class="form-control btn btn-success text white"><br><br>
                        </form>
                        <form  name="r_pedido" method="post" action="procesa_pedido">
                            <input type="submit" name="rpedido" value="Pedido" style="width: 70%"  class="form-control btn btn-success text white"><br><br>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4"></div>
        </div>

    </body>
</html>

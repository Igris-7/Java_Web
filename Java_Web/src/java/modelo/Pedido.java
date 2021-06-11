
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;


public class Pedido {
private int pedido_id;
private int cliente_id;
private int producto_id;
private String pedido_cantidad;
private String pedido_fecha;
private Connection conexion;

    public Pedido(int pedido_id, int cliente_id, int producto_id, String pedido_cantidad, String pedido_fecha) {
        this.pedido_id = pedido_id;
        this.cliente_id = cliente_id;
        this.producto_id = producto_id;
        this.pedido_cantidad = pedido_cantidad;
        this.pedido_fecha = pedido_fecha;
    }

    public Pedido() {
    }

    public int getPedido_id() {
        return pedido_id;
    }

    public void setPedido_id(int pedido_id) {
        this.pedido_id = pedido_id;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getPedido_cantidad() {
        return pedido_cantidad;
    }

    public void setPedido_cantidad(String pedido_cantidad) {
        this.pedido_cantidad = pedido_cantidad;
    }

    public String getPedido_fecha() {
        return pedido_fecha;
    }

    public void setPedido_fecha(String pedido_fecha) {
        this.pedido_fecha = pedido_fecha;
    }

      public void conecta(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String login="root";
            String pass="lab06mysql";
            String url="jdbc:mysql://localhost:3306/examen";
            this.conexion=DriverManager.getConnection(url,login,pass);
            //System.out.println("HOLA");
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
    }
      
      public LinkedList<Pedido> listaPedido(){
        try {
            conecta();
            String query = "SELECT * FROM pedido; ";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Pedido> lista;
            lista = new LinkedList<Pedido>();
            while(resultado.next()){
                Pedido u = new Pedido();
                u.setPedido_id(Integer.parseInt(resultado.getString("pedido_id")));
                u.setCliente_id(Integer.parseInt(resultado.getString("cliente_id")));
                u.setProducto_id(Integer.parseInt(resultado.getString("producto_id")));
                u.setPedido_cantidad(resultado.getString("pedido_cantidad"));
                u.setPedido_fecha(resultado.getString("pedido_fecha"));
                lista.add(u);
            }
            conexion.close();
            return lista;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
     public void agregarPedido(int pedido_id,int cliente_id,int producto_id,String pedido_cantidad,String pedido_fecha)
     {
        try {
            conecta();
            String query = "INSERT INTO pedido VALUES(?,?,?,?,?);";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setInt(1, pedido_id);
            sentencia.setInt(2, cliente_id);
            sentencia.setInt(3, producto_id);
            sentencia.setString(4,pedido_cantidad);
            sentencia.setString(5,pedido_fecha);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println("Problemas de insercion...");
        }
    }
    
    public void editarPedido(int usr2, String psw, int usr){
        try {
            conecta();
            String query = "UPDATE pedido SET pedido_id=?, ";
            query = query + "pedido_cantidad=? ";
            query = query + "WHERE pedido_id=?; ";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setInt(1, usr2);
            sentencia.setString(2, psw);
            sentencia.setInt(3, usr);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println("Problemas de actualizacion...");
        }
    }
    
    public void eliminarPedido(int id){
        try {
            conecta();
            String query = "DELETE FROM pedido WHERE pedido_id=?; ";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setInt(1, id);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println("Problemas de eliminacion...");
        }
    }
  
}




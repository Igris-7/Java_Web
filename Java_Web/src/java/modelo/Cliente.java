/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author Estudiante
 */
public class Cliente {
    private int cliente_id;
    private String cliente_nombre;
    private String cliente_direccion;
    private int distrito_id;
    private Connection conexion;

    public Cliente() {
    }

    public Cliente(int cliente_id, String cliente_nombre, String cliente_direccion, int distrito_id) {
        this.cliente_id = cliente_id;
        this.cliente_nombre = cliente_nombre;
        this.cliente_direccion = cliente_direccion;
        this.distrito_id = distrito_id;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public String getCliente_nombre() {
        return cliente_nombre;
    }

    public void setCliente_nombre(String cliente_nombre) {
        this.cliente_nombre = cliente_nombre;
    }

    public String getCliente_direccion() {
        return cliente_direccion;
    }

    public void setCliente_direccion(String cliente_direccion) {
        this.cliente_direccion = cliente_direccion;
    }

    public int getDistrito_id() {
        return distrito_id;
    }

    public void setDistrito_id(int distrito_id) {
        this.distrito_id = distrito_id;
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
    
       
       public LinkedList<Cliente> listaCliente(){
        try {
            conecta();
            String query = "SELECT * FROM cliente; ";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Cliente> lista;
            lista = new LinkedList<Cliente>();
            while(resultado.next()){
                Cliente u = new Cliente();
                u.setCliente_id(Integer.parseInt(resultado.getString("cliente_id")));
                u.setCliente_nombre(resultado.getString("cliente_nombre"));
                u.setCliente_direccion(resultado.getString("cliente_direccion"));
                u.setDistrito_id(Integer.parseInt(resultado.getString("distrito_id")));
                lista.add(u);
            }
            conexion.close();
            return lista;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
    
    public void agregarCliente(int id, String nombre,String direccion,int distrito ){   
         try {
            conecta();
            String query = "INSERT INTO cliente VALUES(?,?,?,?)";
            PreparedStatement sentencia = conexion.prepareStatement(query);
             sentencia.setInt(1, id);
            sentencia.setString(2, nombre);
            sentencia.setString(3, direccion);
            sentencia.setInt(4, distrito);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println("Problemas de insercion...");
        }
        
        
    }
    
    public void editarCliente(int usr2, String psw, int usr){
        try {
            conecta();
            String query = "UPDATE cliente SET cliente_id=?, ";
            query = query + "cliente_nombre=? ";
            query = query + "WHERE cliente_id=?; ";
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
    
    public void eliminarCliente(int id){
        try {
            conecta();
            String query = "DELETE FROM cliente WHERE cliente_id=?; ";
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

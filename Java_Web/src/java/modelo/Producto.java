/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author Estudiante
 */
public class Producto {
    private int producto_id;
    private String producto_nombre;
    private double producto_precio;
    private int modelo_id;
    private Connection conexion;

    public Producto() {
    }

    public Producto(int producto_id, String producto_nombre, double producto_precio, int modelo_id) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.producto_precio = producto_precio;
        this.modelo_id = modelo_id;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getProducto_nombre() {
        return producto_nombre;
    }

    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }

    public double getProducto_precio() {
        return producto_precio;
    }

    public void setProducto_precio(double producto_precio) {
        this.producto_precio = producto_precio;
    }

    public int getModelo_id() {
        return modelo_id;
    }

    public void setModelo_id(int modelo_id) {
        this.modelo_id = modelo_id;
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
      
      
       public LinkedList<Producto> listaProducto(){
        try {
            conecta();
            String query = "SELECT * FROM producto; ";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Producto> lista;
            lista = new LinkedList<Producto>();
            while(resultado.next()){
                Producto m = new Producto(); 
                
                m.setProducto_id(Integer.parseInt(resultado.getString("producto_id")));
                m.setProducto_nombre(resultado.getString("producto_nombre"));
                m.setProducto_precio(Double.parseDouble(resultado.getString("producto_precio")));
                m.setModelo_id(Integer.parseInt(resultado.getString("modelo_id")));       
                lista.add(m);
            }
            conexion.close();
            return lista;
        } catch (Exception e) {
            System.out.println("Problema de conexion...");
        }
        return null;
    }
      
}

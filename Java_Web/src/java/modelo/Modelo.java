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
public class Modelo {
    private int modelo_id;
    private String modelo_nombre;
    private String modelo_marca;
    private Connection conexion;

    public Modelo() {
    }

    public Modelo(int modelo_id, String modelo_nombre, String modelo_marca) {
        this.modelo_id = modelo_id;
        this.modelo_nombre = modelo_nombre;
        this.modelo_marca = modelo_marca;
    }

    public int getModelo_id() {
        return modelo_id;
    }

    public void setModelo_id(int modelo_id) {
        this.modelo_id = modelo_id;
    }

    public String getModelo_nombre() {
        return modelo_nombre;
    }

    public void setModelo_nombre(String modelo_nombre) {
        this.modelo_nombre = modelo_nombre;
    }

    public String getModelo_marca() {
        return modelo_marca;
    }

    public void setModelo_marca(String modelo_marca) {
        this.modelo_marca = modelo_marca;
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
      
      
      
       public LinkedList<Modelo> listaModelo(){
        try {
            conecta();
            String query = "SELECT * FROM modelo; ";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Modelo> lista;
            lista = new LinkedList<Modelo>();
            while(resultado.next()){
                Modelo m = new Modelo(); 
                m.setModelo_id(Integer.parseInt(resultado.getString("modelo_id")));
                m.setModelo_nombre(resultado.getString("modelo_nombre"));
                m.setModelo_marca(resultado.getString("modelo_marca"));
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

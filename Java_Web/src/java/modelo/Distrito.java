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


public class Distrito {
    private int distrito_id;
    private String distrito_nombre;
    private String distrito_provincia;
    private Connection conexion;

    public Distrito(int distrito_id, String distrito_nombre, String distrito_provincia) {
        this.distrito_id = distrito_id;
        this.distrito_nombre = distrito_nombre;
        this.distrito_provincia = distrito_provincia;
    }

    public Distrito() {
    }

    public int getDistrito_id() {
        return distrito_id;
    }

    public void setDistrito_id(int distrito_id) {
        this.distrito_id = distrito_id;
    }

    public String getDistrito_nombre() {
        return distrito_nombre;
    }

    public void setDistrito_nombre(String distrito_nombre) {
        this.distrito_nombre = distrito_nombre;
    }

    public String getDistrito_provincia() {
        return distrito_provincia;
    }

    public void setDistrito_provincia(String distrito_provincia) {
        this.distrito_provincia = distrito_provincia;
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
      
      
       public LinkedList<Distrito> listaDsitrito(){
        try {
            conecta();
            String query = "SELECT * FROM distrito; ";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Distrito> lista;
            lista = new LinkedList<Distrito>();
            while(resultado.next()){
                Distrito m = new Distrito(); 
                m.setDistrito_id(Integer.parseInt(resultado.getString("distrito_id")));
                m.setDistrito_nombre(resultado.getString("distrito_nombre"));
                m.setDistrito_provincia(resultado.getString("distrito_provincia"));
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

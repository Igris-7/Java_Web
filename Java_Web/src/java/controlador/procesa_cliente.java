/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

/**
 *
 * @author Estudiante
 */
@WebServlet(name = "procesa_cliente", urlPatterns = {"/procesa_cliente"})
public class procesa_cliente extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             int cliente_id=Integer.parseInt(request.getParameter("cliente_id"));
            String cliente_nombre=request.getParameter("cliente_nombre");
            String cliente_direccion=request.getParameter("cliente_direccion");
              int distrito_id = Integer.parseInt(request.getParameter("distrito_id"));
            Cliente c=new Cliente();
            
            if(request.getParameter("agregar_cliente")!=null)
            {
                c.agregarCliente(cliente_id, cliente_nombre, cliente_direccion,distrito_id);
               request.getRequestDispatcher("view/cliente.jsp").forward(request, response);

            }

            else if(request.getParameter("editar_cliente")!=null)
            {
                c.editarCliente(cliente_id, cliente_nombre, cliente_id);
               request.getRequestDispatcher("view/cliente.jsp").forward(request, response);
            }
           else if(request.getParameter("eliminar_cliente")!=null)
            {
               c.eliminarCliente(cliente_id);
               request.getRequestDispatcher("view/cliente.jsp").forward(request, response);
            }
        }
    }

   
}

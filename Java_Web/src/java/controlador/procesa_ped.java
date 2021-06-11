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
import modelo.Pedido;

/**
 *
 * @author Estudiante
 */
@WebServlet(name = "procesa_ped", urlPatterns = {"/procesa_ped"})
public class procesa_ped extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          int pedido_id=Integer.parseInt(request.getParameter("pedido_id"));
         int cliente_id=Integer.parseInt(request.getParameter("cliente_id"));
         int producto_id=Integer.parseInt(request.getParameter("producto_id"));
         String pedido_cantidad=request.getParameter("pedido_cantidad");
         String pedido_fecha=request.getParameter("pedido_fecha");
         Pedido p=new Pedido();
         
         if(request.getParameter("agregar_pedido")!=null)
         {
             p.agregarPedido(pedido_id, cliente_id, producto_id, pedido_cantidad, pedido_fecha);
             request.getRequestDispatcher("view/pedido.jsp").forward(request, response);

         }
         if(request.getParameter("editar_pedido")!=null)
         {
             p.editarPedido(pedido_id, pedido_cantidad, pedido_id);
             request.getRequestDispatcher("view/pedido.jsp").forward(request, response);

         }
         if(request.getParameter("eliminar_pedido")!=null)
         {
             p.eliminarPedido(pedido_id);
             request.getRequestDispatcher("view/pedido.jsp").forward(request, response);

         }
         
         
         
        }
       
        
        
    }

   

}

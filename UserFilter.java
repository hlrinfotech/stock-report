/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Win7
 */
@WebServlet(urlPatterns = {"/UserFilter"})
public class UserFilter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String ccode=request.getParameter("ccode");
                    String username=DBService.getCustomerName(ccode);
                  String pass=DBService.getCustomerPass(ccode);
                    String cname=DBService.getCustomerNamelogin(ccode);
            try {
                 ArrayList< ArrayList> cst = DBService.getCustomerStatement(ccode);
                request.setAttribute("cst", cst);
                ArrayList< ArrayList> oust = DBService.getOutstanding(ccode);
                request.setAttribute("oust", oust);
                
                     ArrayList< ArrayList> ps = DBService.getPendingSalesOrder(ccode);
                request.setAttribute("ps", ps);
//                
                     ArrayList< ArrayList<String>> sbn = DBService.getStockofBranchName(ccode);
                request.setAttribute("sbn", sbn);
                   ArrayList< ArrayList<String>> sbh = DBService.getStockofBranchNameHz(ccode);
                request.setAttribute("sbh", sbh);
//                
                
                   ArrayList< ArrayList<String>> sot = DBService.getStockofTuticorinv();
                request.setAttribute("sot", sot);
                
                 ArrayList< ArrayList<String>> soth = DBService.getStockofTuticorinh();
                request.setAttribute("soth", soth);
                
                ArrayList< ArrayList> dwnl = DBService.getdownloads(ccode);
                request.setAttribute("dwnl", dwnl);
                request.setAttribute("un", cname);
                request.setAttribute("ccode", ccode);
                 ArrayList< ArrayList> viewUsers=DBService.viewUsers(username, pass);
                 request.setAttribute("viewcust", viewUsers);
                ArrayList  clst = DBService.getStockofBranchNameHorizontal();
                   request.setAttribute("clh", clst);
                    ArrayList  clsm = DBService.getStockofBranchtutVertical();
                   request.setAttribute("clv", clsm);
                int osz=sbn.size();
                if(osz>0)
                {
                     ArrayList rows=sbn.get(0);
                     String bn=rows.get(0).toString();
                  
                     request.setAttribute("bn", bn);
                }
                 RequestDispatcher dis = request.getRequestDispatcher("usermain.jsp");                
                dis.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(UserFilter.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserFilter.class.getName()).log(Level.SEVERE, null, ex);
            }
                
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserFilter</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserFilter at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

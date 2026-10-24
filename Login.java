/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author pro
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pwd");
            String remoteAddr = request.getRemoteAddr();

            if (uname.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("rajesh")) {
                RequestDispatcher dis = request.getRequestDispatcher("UserView");

                dis.forward(request, response);
            } else {
                boolean res = DBService.checkAdminLogin(uname, pass);
                try {
                    if (res) {

                        String ccode = DBService.getCustomerCode(uname, pass);
                        String username = DBService.getCustomerName(uname, pass);
                        if (username.equalsIgnoreCase("admin")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserView");
                            requestDispatcher.forward(request, response);
                        }
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
                        request.setAttribute("un", username);
                        request.setAttribute("un", username);
                        request.setAttribute("ccode", ccode);
                        ArrayList< ArrayList> viewUsers = DBService.viewUsers(uname, pass);
                        request.setAttribute("viewcust", viewUsers);
                        ArrayList clst = DBService.getStockofBranchNameHorizontal();
                        request.setAttribute("clh", clst);
                        ArrayList clsm = DBService.getStockofBranchtutVertical();
                        request.setAttribute("clv", clsm);
                        ArrayList<String> last12months = Last12MonthsList.getLast12Months();
                        request.setAttribute("lst12mo", last12months);
                        ArrayList< ArrayList> lasttw = ExtractPivot.lasttmo(ccode);
                        request.setAttribute("lasttw", lasttw);
                        int osz = sbn.size();
                        if (osz > 1) {
                            ArrayList rows = sbn.get(1);
                            String bn = rows.get(0).toString();

                            request.setAttribute("bn", bn);
                        }
                        if (remoteAddr.equals("0:0:0:0:0:0:0:1")) {
                            InetAddress localip = java.net.InetAddress.getLocalHost();
                            remoteAddr = localip.getHostAddress();

                            // remoteHost = localip.getHostName();
                        }
                        ArrayList<ArrayList> chatCust = DBService.getCustomerOverAll(ccode);
                        request.setAttribute("ovrallcuschat", chatCust);
                        ArrayList<ArrayList> chatCustsales = DBService.getCustomerSales(ccode);
                        request.setAttribute("overallCustsales", chatCustsales);
                        String crm = DBService.getCustomerchatCurrentMonth(ccode);
                        if (crm == null) {
                            crm = "0";
                        }
                        request.setAttribute("crm", crm);
                        String csm = DBService.getsaleschatCurrentMonth(ccode);
                        if (csm == null) {
                            csm = "0";
                        }
                        request.setAttribute("csm", csm);
                        ArrayList<ArrayList> chatCustins = DBService.getCustomerOverAllinstace(ccode);
                        request.setAttribute("ovrallcuschatins", chatCustins);
                        ArrayList<ArrayList> chatCustsalesins = DBService.getCustomerSalesInstant(ccode);
                        request.setAttribute("overallCustsalesins", chatCustsalesins);
                        String crmins = DBService.getCustomerchatCurrentMonthInstant(ccode);
                        if (crmins == null) {
                            crmins = "0";
                        }
                        request.setAttribute("crmins", crmins);
                        String csmins = DBService.getsaleschatCurrentMonthInstant(ccode);
                        if (csmins == null) {
                            csmins = "0";
                        }
                        request.setAttribute("csmins", csmins);
                        LocalDate today = LocalDate.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM-yy");
                        String curmonth = today.format(formatter);
                        request.setAttribute("curmonth", curmonth);
                        DBService.addCustomerLogs(uname, ccode, username, remoteAddr);
                        RequestDispatcher dis = request.getRequestDispatcher("usermain.jsp");
                        dis.forward(request, response);
                    } else {
                        RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
                        request.setAttribute("msg", "* Invalid Login Try Again!");
                        dis.forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserView.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(UserView.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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

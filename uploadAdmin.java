/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.eclipse.jdt.internal.compiler.classfmt.ClassFileConstants;

/**
 *
 * @author pro
 */
@WebServlet(urlPatterns = {"/uploadAdmin"})
public class uploadAdmin extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

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
            String username = null;
            String customerid = "";

            if (!ServletFileUpload.isMultipartContent(request)) {
                response.getWriter().println("Error: Form must has enctype=multipart/form-data");
                return;
            }
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            try {
                

                List<FileItem> formItems = upload.parseRequest(request);
                ArrayList uname= new ArrayList();
                // First, extract username
                for (FileItem item : formItems) {
                    if (item.isFormField() && "customers".equals(item.getFieldName())) {
                        username = item.getString();
                         uname.add(username);
                         System.out.println("==>"+username);
                       // break;
                    }
                }

                String s[] = {"Basic Price", "Schemes", "Circular", "FTS Scheme", "FTS Scheme2", "FTS Scheme3"};

              
                for (FileItem item : formItems) {
                    String fn = item.getFieldName().trim();
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
 
                        if (!fileName.isEmpty() ) {
                           
                           
                            String idx = fn.split("file")[1];
                            int id = Integer.parseInt(idx);
                            String filePath = uploadPath + File.separator + fileName;
                            item.write(new File(filePath));
                            if(uname.size()>0)
                            {
                           for(int k=0;k<uname.size();k++)
                           {
                               String cs[] = uname.get(k).toString().split("-");
                                customerid = cs[0];
                            String sql="INSERT INTO uploads (filename, customercode,opt,st) VALUES ('"+fileName+"', '"+customerid+"','"+s[id - 1]+"',0)";
                          //  System.out.println(""+sql);
                            DBService.addFiles(sql);
                           }
                            }
                            else
                            {
                                String sql="INSERT INTO uploads (filename, customercode,opt,st) VALUES ('"+fileName+"', '0','"+s[id - 1]+"',0)";
                          //  System.out.println(""+sql);
                            DBService.addFiles(sql);
                            }
                        // Save to database
//                            PreparedStatement stmt = conn.prepareStatement(
//                                    "INSERT INTO uploads (filename, customercode,opt,st) VALUES (?, ?,?,?)"
//                            );
//                            stmt.setString(1, fileName);
//                            stmt.setString(2, customerid);
//                            stmt.setString(3, s[id - 1]);
//                            stmt.setInt(4, 0);
//                            stmt.executeUpdate();

                        }
                    }
                }
                formItems = new LinkedList<>();
                response.sendRedirect("OptionsUploads");
//                RequestDispatcher dis = request.getRequestDispatcher("OptionsUploads");
//                dis.forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(uploadAdmin.class.getName()).log(Level.SEVERE, null, ex);
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadAdmin at " + request.getContextPath() + "</h1>");
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

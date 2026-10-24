<%-- 
    Document   : plant
    Created on : Jul 27, 2025, 10:11:43 AM
    Author     : Win7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
//String id = request.getParameter("id");
String custcn=request.getParameter("custcn");
            String cs[]=custcn.split("-");
            String id=cs[0];
            String customername=cs[1];
String name = "";

try {
   
    Connection con = DBService.getDBConnection();
    PreparedStatement ps = con.prepareStatement("SELECT VWERK  FROM `customerdetails` WHERE (`KUNNR` + 0  )  = ?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        name = rs.getString(1);
    }

    con.close();
} catch(Exception e) {
    e.printStackTrace();
}

// Return only the name as plain text
out.print(name);
%>


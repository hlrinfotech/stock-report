/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pro
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class DBService {

    public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/stockreport";    
        Class.forName("com.mysql.jdbc.Driver");    
   //Connection con = DriverManager.getConnection(url, "root", "root");
        return con;
    }
    
        public static Connection getDBConnection1() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/googlesheetdatas";

     //     String url = "jdbc:mysql://192.168.0.225:3306/training";
        //String url = "jdbc:mysq:3308/scrap";
        //String url = "jdbc:mysql://localhost:3306/edp_training1";
        Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection(url, "root", "Pavilion@123");
    //Connection con = DriverManager.getConnection(url, "root", "root");
        return con;
    }

    public static int addUsers(String userName, String password, String customerid, String customername, String hints, String plant) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO `user`(`Username`, `password`, `customerid`, `customername`, `hints`, `plant`)"
                    + " VALUES "
                    + "('" + userName + "','" + password + "','" + customerid + "','" + customername + "','" + hints + "','" + plant + "')";
            System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue addDept\n" + ex.getMessage());
        }

        return res;
    }
    
     public static int addFiles(String sql) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            
           // System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue addDept\n" + ex.getMessage());
        }

        return res;
    }

    public static ArrayList< ArrayList> viewUsers() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT * FROM `user`";
        System.out.println(sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }

    public static int deleteUser(String custid) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            String sql = "delete from user where customerid='" + custid + "'";
            System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue emd\n" + ex.getMessage());
        }

        return res;
    }

    public static int updateUsers(String userName, String password, String customerid, String customername, String hints, String plant) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            String sql = "update `user` set `Username`='" + userName + "', `password`='" + password + "', `customername`='" + customername + "', `hints`='" + hints + "', `plant`='" + plant + "' where  `customerid`='" + customerid + "'";

            System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue user\n" + ex.getMessage());
        }

        return res;
    }

    public static ArrayList< ArrayList> getcustomeCodeWithName() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT DISTINCT( CONCAT((`KUNNR` + 0 ),'-',NAME1)) as srchstr, (`KUNNR` + 0 ) as custcode FROM `customerdetails`";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }

    public static ArrayList< ArrayList> getCustomerStatement(String customerCode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select Date_format(`budat`,'%d-%m-%Y')as buat,`zuonr`,Date_format(`bldat`,'%d-%m-%Y') as bldat,`sgtxt`,`obal`,`debit`,`credit`,`cbal` from customerstatement where customercode='" + customerCode + "'";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                try {
                    if (rsq.getString(i).equals("0000-00-00") || rsq.getString(i).equals("00-00-0000") || rsq.getString(i).equals("0.00") || rsq.getString(i).equals("0")) {
                        data.add("");
                    } else {
                        data.add(rsq.getString(i));
                    }
                } catch (Exception ex) {
                    data.add("");
                }

            }

            nl.add(data);
        }

        return nl;
    }

    public static ArrayList< ArrayList> getOutstanding(String customerCode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select date_format(`invdate`,'%d-%m-%Y'),`vbeln`,`xblnr`,`dmbtr`,`sgtxt`,`ddays`,date_format(bldat,'%d-%m-%Y'),date_format(budat,'%d-%m-%Y') from pendingbills where (`customercode` + 0 )='" + customerCode + "'";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                try {
                    if (rsq.getString(i).equals("0000-00-00") ||  rsq.getString(i).equals("00-00-0000") || rsq.getString(i).equals("0.00") || rsq.getString(i).equals("0") ) {
                        data.add("");
                    } else {
                        data.add(rsq.getString(i));
                    }
                } catch (Exception ex) {
                    data.add("");
                }

            }

            nl.add(data);
        }

        return nl;
    }

    public static ArrayList< ArrayList> getPendingSalesOrder(String customerCode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select `erdat`,`vbeln`,`matnr`,`material desc`,`ordqty`,`pending qty`,`meins` from salesorder where customercode='" + customerCode + "'";
        System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                try {
                    if (rsq.getString(i).equals("0000-00-00") || rsq.getString(i).equals("0.00") ||rsq.getString(i).equals("0")) {
                        data.add("");
                    } else {
                        data.add(rsq.getString(i));
                    }
                } catch (Exception ex) {
                    data.add("");
                }

            }

            nl.add(data);
        }

        return nl;
    }
    
    public static ArrayList< ArrayList<String>> getStockofTuticorinv() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select name,salesgroupdesc7, salesgroupcode2,  SUM(qty) AS total_qty,Salesgroupdesc6  from stock where plant='M001' and qty >0 and Salesgroupdesc6='Vertical'  group by salesgroupcode2, salesgroupdesc7, Salesgroupdesc6";
        System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
      
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                
                try {
                    String salesgroupdesc7=rsq.getString(2);
                     String total_qty=rsq.getString(3).trim();
                    
                    if(salesgroupdesc7 !=null && salesgroupdesc7.isEmpty()==false)
                    {   
                        if(total_qty !=null &&  !(total_qty.isEmpty()) && total_qty.equalsIgnoreCase("")==false)
                        {    
                         
                             if (rsq.getString(i).equals("0000-00-00") ||  rsq.getString(i).equals("00-00-0000") || rsq.getString(i).equals("0.00") || rsq.getString(i).equals("0") ) {
                        data.add("");
                    } else {
                        data.add(rsq.getString(i));
                    }
                              //  data.add(rsq.getString(i));
                            
                        }
                    }
                } catch (Exception ex) {
                   
                }

            }
            if(data.size()==noCol)
            {
                //System.out.println(data.toString());
                nl.add(data);
                   
                  
            }
        }
        ArrayList  hv = DBService.getStockofBranchtutVertical();
              
                   List<String> headers = new  ArrayList<String> ();
                   headers.add("Branch");
                   headers.add("Model");

             for(int i=0;i<hv.size();i++)
             {
                 if(hv.get(i).toString().isEmpty()==false)
                 headers.add(hv.get(i).toString());
             }   
             headers.add("orientation");
           //  System.out.println(headers.toString());
 List<List<String>> listData = new ArrayList<>();
for (ArrayList<String> row : nl) {
    listData.add(new ArrayList<>(row)); // copy each inner list
}
   ArrayList<ArrayList<String>> res= MergeRowsListReturnExample.main(listData, headers);
        return res;
    }
    
    
    public static ArrayList< ArrayList<String>> getStockofTuticorinh() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select name,salesgroupdesc7, salesgroupcode2,  SUM(qty) AS total_qty,Salesgroupdesc6  from stock where plant='M001' and qty >0 and Salesgroupdesc6='Horizontal'  group by salesgroupcode2, salesgroupdesc7, Salesgroupdesc6";
        System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
      
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                
                try {
                    String salesgroupdesc7=rsq.getString(2);
                     String total_qty=rsq.getString(3).trim();
                    
                    if(salesgroupdesc7 !=null && salesgroupdesc7.isEmpty()==false)
                    {   
                        if(total_qty !=null &&  !(total_qty.isEmpty()) && total_qty.equalsIgnoreCase("")==false)
                        {    
                         
                            
                                 if (rsq.getString(i).equals("0000-00-00") ||  rsq.getString(i).equals("00-00-0000") || rsq.getString(i).equals("0.00") || rsq.getString(i).equals("0") ) {
                        data.add("");
                    } else {
                        data.add(rsq.getString(i));
                    }
                            
                        }
                    }
                } catch (Exception ex) {
                   
                }

            }
            if(data.size()==noCol)
            {
                //System.out.println(data.toString());
                nl.add(data);
                   
                  
            }
        }
        ArrayList  hv = DBService.getStockofBranchNameHorizontal();
              
                   List<String> headers = new  ArrayList<String> ();
                   headers.add("Branch");
                   headers.add("Model");

             for(int i=0;i<hv.size();i++)
             {
                 if(hv.get(i).toString().isEmpty()==false)
                 headers.add(hv.get(i).toString());
             }   
             headers.add("orientation");
           //  System.out.println(headers.toString());
 List<List<String>> listData = new ArrayList<>();
for (ArrayList<String> row : nl) {
    listData.add(new ArrayList<>(row)); // copy each inner list
}
   ArrayList<ArrayList<String>> res= MergeRowsListReturnExample.main(listData, headers);
        return res;
    }

    public static ArrayList< ArrayList> getStockofTuticorin() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();        
        String sql = "select `name`,salesgroupdesc7,salesgroupcode2 ,Salesgroupdesc6,sum(qty)  from stock where plant='M001' group by salesgroupcode2, salesgroupdesc7, Salesgroupdesc6";
         System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
  while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                
                try {
                    String salesgroupdesc7=rsq.getString(2);
                     String total_qty=rsq.getString(3).trim();
                    
                    if(salesgroupdesc7 !=null && salesgroupdesc7.isEmpty()==false)
                    {   
                        if(total_qty !=null &&  !(total_qty.isEmpty()) && total_qty.equalsIgnoreCase("")==false)
                        {    
                         
                            
                                data.add(rsq.getString(i));
                            
                        }
                    }
                } catch (Exception ex) {
                   
                }

            }
            if(data.size()==noCol)
                nl.add(data);
        }

        return nl;
    }
    
    

    public static ArrayList< ArrayList<String>> getStockofBranchName(String customercode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT name,salesgroupdesc7, salesgroupcode2,  SUM(qty) AS total_qty,Salesgroupdesc6 FROM stock INNER JOIN user ON stock.plant = user.plant WHERE user.customerid = '"+customercode+"' and qty >0 and Salesgroupdesc6='Vertical' GROUP BY salesgroupcode2, salesgroupdesc7, Salesgroupdesc6";
        System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
      
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                
                try {
                    String salesgroupdesc7=rsq.getString(2);
                     String total_qty=rsq.getString(3).trim();
                    
                    if(salesgroupdesc7 !=null && salesgroupdesc7.isEmpty()==false)
                    {   
                        if(total_qty !=null &&  !(total_qty.isEmpty()) && total_qty.equalsIgnoreCase("")==false)
                        {    
                         
                            
                                data.add(rsq.getString(i));
                            
                        }
                    }
                } catch (Exception ex) {
                   
                }

            }
            if(data.size()==noCol)
            {
                //System.out.println(data.toString());
                nl.add(data);
                   
                  
            }
        }
        ArrayList  hv = DBService.getStockofBranchtutVertical();
              
                   List<String> headers = new  ArrayList<String> ();
                   headers.add("Branch");
                   headers.add("Model");

             for(int i=0;i<hv.size();i++)
             {
                 if(hv.get(i).toString().isEmpty()==false)
                 headers.add(hv.get(i).toString());
             }   
             headers.add("orientation");
           //  System.out.println(headers.toString());
 List<List<String>> listData = new ArrayList<>();
for (ArrayList<String> row : nl) {
    listData.add(new ArrayList<>(row)); // copy each inner list
}
       ArrayList<ArrayList<String>> res= MergeRowsListReturnExample.main(listData, headers);
        return res;
    }
    
    public static ArrayList< ArrayList<String>> getStockofBranchNameHz(String customercode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT name,salesgroupdesc7, salesgroupcode2,  SUM(qty) AS total_qty,Salesgroupdesc6 FROM stock INNER JOIN user ON stock.plant = user.plant WHERE user.customerid = '"+customercode+"' and qty >0 and Salesgroupdesc6='Horizontal' GROUP BY salesgroupcode2, salesgroupdesc7, Salesgroupdesc6";
       // System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
      
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                
                try {
                    String salesgroupdesc7=rsq.getString(2);
                     String total_qty=rsq.getString(3).trim();
                    
                    if(salesgroupdesc7 !=null && salesgroupdesc7.isEmpty()==false)
                    {   
                        if(total_qty !=null &&  !(total_qty.isEmpty()) && total_qty.equalsIgnoreCase("")==false)
                        {    
                         
                            
                                data.add(rsq.getString(i));
                            
                        }
                    }
                } catch (Exception ex) {
                   
                }

            }
            if(data.size()==noCol)
            {
                //System.out.println(data.toString());
                nl.add(data);
                   
                  
            }
        }
        ArrayList  hv = DBService.getStockofBranchNameHorizontal();
              
                   List<String> headers = new  ArrayList<String> ();
                   headers.add("Branch");
                   headers.add("Model");

             for(int i=0;i<hv.size();i++)
             {
                 if(hv.get(i).toString().isEmpty()==false)
                 headers.add(hv.get(i).toString());
             }   
             headers.add("orientation");
           //  System.out.println(headers.toString());
 List<List<String>> listData = new ArrayList<>();
for (ArrayList<String> row : nl) {
    listData.add(new ArrayList<>(row)); // copy each inner list
}
       ArrayList<ArrayList<String>> res= MergeRowsListReturnExample.main(listData, headers);
        return res;
    }

    public static ArrayList< ArrayList> getdownloads(String customerCode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT `filename`,customercode,opt,`create_date` FROM `uploads` where st=0 and (customercode='"+customerCode+"' or customerCode='0') ";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                try {
                    if (rsq.getString(i).equals("0000-00-00") || rsq.getString(i).equals("0.00") || rsq.getString(i).equals("0")) {
                        data.add("");
                    } else {
                        data.add(rsq.getString(i));
                    }
                } catch (Exception ex) {
                    data.add("");
                }

            }

            nl.add(data);
        }

        return nl;
    }

    public static ArrayList< ArrayList> getOptions(String customerCode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT `filename`,`create_date` FROM `uploads`";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                try {
                    if (rsq.getString(i).equals("0000-00-00")) {
                        data.add("0000-00-00");
                    } else {
                        data.add(rsq.getString(i));
                    }
                } catch (Exception ex) {
                    data.add("0000-00-00");
                }

            }

            nl.add(data);
        }

        return nl;
    }

    
     public static ArrayList< ArrayList> getdownloads() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT u.`filename`,u.customercode,IFNULL(cd.NAME1,'') as cName,u.opt,u.`create_date`,u.upid FROM `uploads` u Left join customerdetails cd on u.customercode = (cd.`KUNNR` + 0 )  where st=0 group by u.upid";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                try {
                    if (rsq.getString(i).equals("0000-00-00")) {
                        data.add("0000-00-00");
                    } else {
                        data.add(rsq.getString(i));
                    }
                } catch (Exception ex) {
                    data.add("0000-00-00");
                }

            }

            nl.add(data);
        }

        return nl;
    }
     
     
     public static int deleteUploads(String upid) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            String sql = "update uploads set st=1  where upid='" + upid + "'";
            System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue emd\n" + ex.getMessage());
        }

        return res;
    }
     
       public static boolean  checkAdminLogin(String uname,String pwd){
          boolean res=false;    
         try {
                
                 Connection con1 = getDBConnection();
               Statement  stmt = con1.createStatement();
                 String sql = "SELECT * FROM `user` WHERE `Username`='"+uname+"' and `password`='"+pwd+"'";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                    String usrname= rs.getString("Username");
                    String password= rs.getString("password");
                    //  System.out.println(usrname+"--"+uname);
                    if(usrname.equals(uname) && password.equals(pwd))
                    {  
                        res=true;
                    }
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return res;
     }
       
        public static boolean  checkLoginhints(String uname,String hints){
          boolean res=false;    
         try {
                
                 Connection con1 = getDBConnection();
               Statement  stmt = con1.createStatement();
                 String sql = "SELECT * FROM `user` WHERE `Username`='"+uname+"' and `hints`='"+hints+"'";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                     
                     res=true;
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return res;
     }
       
           
                   public static String  getCustomerCode(String uname,String pwd){
          String dept="";   
         try {
                
                 Connection con1 = getDBConnection();
                Statement stmt = con1.createStatement();
                 String sql = "SELECT customerid FROM `user` where Username='"+uname+"' and password='"+pwd+"'";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                     
                     dept=rs.getString(1);
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return dept;
     }          
           
                   public static String  getCustomerName(String uname,String pwd){
          String dept="";   
         try {
                
                 Connection con1 = getDBConnection();
                Statement stmt = con1.createStatement();
                 String sql = "SELECT customername FROM `user` where Username='"+uname+"' and password='"+pwd+"'";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                     
                     dept=rs.getString(1);
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return dept;
     }   
                   
                   
                   
                   public static String  getCustomerNamelogin(String customerid){
          String dept="";   
         try {
                
                 Connection con1 = getDBConnection();
                Statement stmt = con1.createStatement();
                 String sql = "SELECT customername FROM `user` where customerid='"+customerid+"'";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                     
                     dept=rs.getString(1);
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return dept;
     }   
                   
                   public static ArrayList< ArrayList> getCustomerTypes() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT * FROM `customertype`";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }

          public static ArrayList viewUsersById(String id) throws SQLException, ClassNotFoundException {

         ArrayList nl = new ArrayList();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT * FROM `user` where customerid='"+id+"'";
        System.out.println(sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        
        int noCol = rsmd.getColumnCount();
         System.out.println(noCol);
        while (rsq.next()) {

           
for(int i=1;i<=noCol;i++)
                nl.add(rsq.getString(i));
         
            
        }

        return nl;
    }
          
          public static int updateUsers(String userName, String password,   String hints) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            String sql = "update `user` set `Username`='" + userName + "', `password`='" + password + "',  `hints`='" + hints + "' where  `hints`='" + hints + "'";

            System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue user\n" + ex.getMessage());
        }

        return res;
    }
          
            public static String  getCustomerName(String custcode){
          String dept="";   
         try {
                
                 Connection con1 = getDBConnection();
                Statement stmt = con1.createStatement();
                 String sql = "SELECT Username FROM `user` where customerid='"+custcode+"' ";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                     
                     dept=rs.getString(1);
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return dept;
     }   
            
             public static String  getCustomerPass(String custcode){
          String dept="";   
         try {
                
                 Connection con1 = getDBConnection();
                Statement stmt = con1.createStatement();
                 String sql = "SELECT password FROM `user` where customerid='"+custcode+"' ";
                 System.out.println(sql);
               ResultSet  rs = stmt.executeQuery(sql);
                 // System.out.print("===>"+ rs.getFetchSize());
                 
                 
                 while (rs.next()) {
                     
                     
                     dept=rs.getString(1);
                 }
                 
                 
                 
                 // con1.close();
               
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
             }
               return dept;
     }   
             
             
              public static int addCustomerLogs(String userName, String customercode, String customername, String ipaddress) {
        int res = 0;
        try {
            Connection con = getDBConnection();
            Statement stmt = con.createStatement();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date curdate=new Date();
            String entdatetime=sdf.format(curdate);
            String sql = "INSERT INTO `customerlog` (`customercode`, `customername`, `username`, `entdatetime`, `ipaddress`) "
                    + "VALUES ('"+customercode+"', '"+customername+"', '"+userName+"', '"+entdatetime+"', '"+ipaddress+"');";
            System.out.println("" + sql);
            stmt.executeUpdate(sql);

        } catch (Exception ex) {

            System.out.println("query issue addDept\n" + ex.getMessage());
        }

        return res;
    }
            
            public static ArrayList< ArrayList> viewUsers(String uname,String pwd) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT * FROM `user` where `Username`='"+uname+"' and `password`='"+pwd+"'";
        System.out.println(sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }
            
            
              public static ArrayList< ArrayList> getCustomerLogs(String frmdate,String todate) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT customercode,customername,username,max(`entdatetime`),ipaddress,COUNT(`customercode`) FROM `customerlog` where entdatetime >= '"+frmdate+"' and entdatetime < '"+todate+"'  GROUP by ipaddress,customercode";
                  System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }
              
              
              public static ArrayList< ArrayList> getCustomerLogs() throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT *,COUNT(`customercode`) FROM `customerlog` GROUP by ipaddress,customercode";
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();
            for (int i = 1; i <= noCol; i++) {

                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }
              
              
              public static ArrayList getStockofBranchNameHorizontal() throws SQLException, ClassNotFoundException {

        ArrayList nl = new ArrayList();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select distinct(salesgroupcode2)  from stock where Salesgroupdesc6='Horizontal'";
         System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);      
      
        while (rsq.next()) {

            
          
            

            nl.add(rsq.getString(1));
        }
 List res=(List) nl.stream().sorted(Comparator.comparingInt(DBService::extractNumber)).collect(Collectors.toList());
        return (ArrayList) res;
        
    }
              
              
                  public static ArrayList getStockofBranchtutVertical() throws SQLException, ClassNotFoundException {

        ArrayList<String> nl = new ArrayList();
        Connection con1 = getDBConnection();
        Statement stmt1 = con1.createStatement();
        String sql = "select distinct(salesgroupcode2)  from stock where Salesgroupdesc6='Vertical'";
         System.out.println(""+sql);
        ResultSet rsq = stmt1.executeQuery(sql);      
      
        while (rsq.next()) {

            nl.add(rsq.getString(1));
        }

 List res=nl.stream().sorted(Comparator.comparingInt(DBService::extractNumber)).collect(Collectors.toList());
        return (ArrayList) res;
    }

                  private static int extractNumber(String val)
                  {
                      String num=val.replaceAll("\\D+", "");
                      if(num.isEmpty())
                      {
                          return 0;
                      }
                      return Integer.parseInt(num);
                  }        
                  
                  
                  
                  
                   public static ArrayList< ArrayList> viewlast12Extract(String ccode) throws SQLException, ClassNotFoundException {

        ArrayList< ArrayList> nl = new ArrayList< ArrayList>();
        Connection con1 = getDBConnection1();
        Statement stmt1 = con1.createStatement();
        String sql = "SELECT   cn_for_schemes_received ,cn_for_replacement_received,cn_for_cd_received,remarks, DATE_FORMAT(STR_TO_DATE(date, '%d/%b/%Y'), '%b-%y') AS month_year from extracted where dealer_code='"+ccode+"'";
        System.out.println(sql);
        ResultSet rsq = stmt1.executeQuery(sql);
        java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
        int noCol = rsmd.getColumnCount();
        while (rsq.next()) {

            ArrayList data = new ArrayList();          
            for (int i = 1; i <= noCol; i++) {
                data.add(rsq.getString(i));
            }

            nl.add(data);
        }

        return nl;
    }
                   
                   
  public static ArrayList<ArrayList> getCustomerSales(String ccode) throws SQLException, ClassNotFoundException {
    ArrayList<ArrayList> nl = new ArrayList<>();
    Connection con1 = getDBConnection();
    Statement stmt1 = con1.createStatement();
    String sql = "SELECT \n   IFNULL(DATE_FORMAT(sbd.fkdat, '%b-%y'),'') AS Month,\n    IFNULL(SUM(sbd.fklmg),0) AS Qty\nFROM sales_billing_doc sbd inner join matmaster mt on (sbd.matnr + 0 )=(mt.materialcode + 0 ) where mt.extmatgroup='Storage' and \n (sbd.kunag + 0 )='" + ccode + "' AND sbd.fkdat BETWEEN \n      MAKEDATE(YEAR(CURDATE()) - (MONTH(CURDATE()) < 4), 1) + INTERVAL 3 MONTH\n  AND MAKEDATE(YEAR(CURDATE()) + (MONTH(CURDATE()) >= 4), 1) + INTERVAL 3 MONTH - INTERVAL 1 DAY\nGROUP BY YEAR(sbd.fkdat), MONTH(sbd.fkdat)\nORDER BY YEAR(sbd.fkdat), MONTH(sbd.fkdat)";
    System.out.println(sql);
    ResultSet rsq = stmt1.executeQuery(sql);
    java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
    int noCol = rsmd.getColumnCount();
    while (rsq.next()) {
      ArrayList<String> data = new ArrayList();
      data.add("'" + rsq.getString(1) + "'");
      data.add(rsq.getString(2));
      nl.add(data);
    } 
    if (nl.size() <= 0) {
      ArrayList<String> al = new ArrayList();
      al.add("''");
      al.add("0");
      nl.add(al);
    } 
    return nl;
  }
  
  public static String getCustomerchatCurrentMonth(String custcode) {
    String dept = "0";
    try {
      Connection con1 = getDBConnection();
      Statement stmt = con1.createStatement();
      String sql = "SELECT  IFNULL(sum(qty),0) As Qty FROM `customertarget`   where type='storage' and (`customercode` + 0 )='" + custcode + "' and MONTH(dateformonth) = MONTH(CURDATE()) and  YEAR(dateformonth) = YEAR(CURDATE())";
      System.out.println(sql);
      ResultSet rs = stmt.executeQuery(sql);
      while (rs.next())
        dept = rs.getString(1); 
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } catch (SQLException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } 
    return dept;
  }
  
  public static String getsaleschatCurrentMonth(String custcode) {
    String dept = "0";
    try {
      Connection con1 = getDBConnection();
      Statement stmt = con1.createStatement();
      String sql = "SELECT sum(sbc.fklmg) As Qty FROM `sales_billing_doc` sbc  INNER JOIN matmaster mt on (matnr + 0 )=(mt.materialcode + 0 ) where mt.extmatgroup='Storage'  and (sbc.kunag + 0 )='" + custcode + "' and MONTH(sbc.fkdat) = MONTH(CURDATE()) and  YEAR(sbc.fkdat) = YEAR(CURDATE())";
      ResultSet rs = stmt.executeQuery(sql);
      while (rs.next())
        dept = rs.getString(1); 
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } catch (SQLException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } 
    return dept;
  }
  
  public static ArrayList<ArrayList> getCustomerOverAllinstace(String ccode) throws SQLException, ClassNotFoundException {
    ArrayList<ArrayList> nl = new ArrayList<>();
    Connection con1 = getDBConnection();
    Statement stmt1 = con1.createStatement();
    String sql = "SELECT \n    DATE_FORMAT(`dateformonth`, '%b-%y') AS Month,\n    SUM(`qty`) AS Qty\nFROM customertarget\nWHERE type='INSTANT' and (`customercode` + 0 )='" + ccode + "' and dateformonth BETWEEN \n      MAKEDATE(YEAR(CURDATE()) - (MONTH(CURDATE()) < 4), 1) + INTERVAL 3 MONTH\n  AND MAKEDATE(YEAR(CURDATE()) + (MONTH(CURDATE()) >= 4), 1) + INTERVAL 3 MONTH - INTERVAL 1 DAY\nGROUP BY YEAR(dateformonth), MONTH(dateformonth)\nORDER BY YEAR(dateformonth), MONTH(dateformonth);";
    ResultSet rsq = stmt1.executeQuery(sql);
    java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
    int noCol = rsmd.getColumnCount();
    while (rsq.next()) {
      ArrayList<String> data = new ArrayList();
      data.add("'" + rsq.getString(1) + "'");
      data.add(rsq.getString(2));
      nl.add(data);
    } 
    if (nl.size() <= 0) {
      ArrayList<String> al = new ArrayList();
      al.add("''");
      al.add("0");
      nl.add(al);
    } 
    return nl;
  }
  
  public static ArrayList<ArrayList> getCustomerSalesInstant(String ccode) throws SQLException, ClassNotFoundException {
    ArrayList<ArrayList> nl = new ArrayList<>();
    Connection con1 = getDBConnection();
    Statement stmt1 = con1.createStatement();
    String sql = "SELECT \n    DATE_FORMAT(sbd.fkdat, '%b-%y') AS Month,\n    SUM(sbd.fklmg) AS Qty\nFROM sales_billing_doc sbd inner join matmaster mt on (sbd.matnr + 0 )=(mt.materialcode + 0 ) where mt.extmatgroup='INSTANT' and \n  (sbd.kunag + 0 )='" + ccode + "' AND sbd.fkdat BETWEEN \n      MAKEDATE(YEAR(CURDATE()) - (MONTH(CURDATE()) < 4), 1) + INTERVAL 3 MONTH\n  AND MAKEDATE(YEAR(CURDATE()) + (MONTH(CURDATE()) >= 4), 1) + INTERVAL 3 MONTH - INTERVAL 1 DAY\nGROUP BY YEAR(sbd.fkdat), MONTH(sbd.fkdat)\nORDER BY YEAR(sbd.fkdat), MONTH(sbd.fkdat)";
    ResultSet rsq = stmt1.executeQuery(sql);
    java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
    int noCol = rsmd.getColumnCount();
    while (rsq.next()) {
      ArrayList<String> data = new ArrayList();
      data.add("'" + rsq.getString(1) + "'");
      data.add(rsq.getString(2));
      nl.add(data);
    } 
    if (nl.size() <= 0) {
      ArrayList<String> al = new ArrayList();
      al.add("''");
      al.add("0");
      nl.add(al);
    } 
    return nl;
  }
  
  public static String getCustomerchatCurrentMonthInstant(String custcode) {
    String dept = "0";
    try {
      Connection con1 = getDBConnection();
      Statement stmt = con1.createStatement();
      String sql = "SELECT  IFNULL(sum(qty),0) As Qty FROM `customertarget`   where type='INSTANT' and (`customercode` + 0 )='" + custcode + "' and MONTH(dateformonth) = MONTH(CURDATE()) and YEAR(dateformonth) = YEAR(CURDATE())";
      System.out.println(sql);
      ResultSet rs = stmt.executeQuery(sql);
      while (rs.next())
        dept = rs.getString(1); 
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } catch (SQLException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } 
    return dept;
  }
  
  public static String getsaleschatCurrentMonthInstant(String custcode) {
    String dept = "0";
    try {
      Connection con1 = getDBConnection();
      Statement stmt = con1.createStatement();
      String sql = "SELECT IFNULL(sum(sbc.fklmg),0) As Qty FROM `sales_billing_doc` sbc  INNER JOIN matmaster mt on (matnr + 0 )=(mt.materialcode + 0 ) where mt.extmatgroup='INSTANT'  and (sbc.kunag + 0 )='" + custcode + "' and MONTH(sbc.fkdat) = MONTH(CURDATE()) and YEAR(sbc.fkdat) = YEAR(CURDATE())";
      System.out.println(sql);
      ResultSet rs = stmt.executeQuery(sql);
      while (rs.next())
        dept = rs.getString(1); 
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } catch (SQLException ex) {
      Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, (String)null, ex);
    } 
    return dept;
  }
  
    public static ArrayList<ArrayList> getCustomerOverAll(String ccode) throws SQLException, ClassNotFoundException {
    ArrayList<ArrayList> nl = new ArrayList<>();
    Connection con1 = getDBConnection();
    Statement stmt1 = con1.createStatement();
    String sql = "SELECT \n   IFNULL(DATE_FORMAT(`dateformonth`, '%b-%y'),'') AS Month,\n   IFNULL(SUM(`qty`),0) AS Qty\nFROM customertarget\nWHERE type='storage' and (`customercode` + 0 )='" + ccode + "' and dateformonth BETWEEN \n      MAKEDATE(YEAR(CURDATE()) - (MONTH(CURDATE()) < 4), 1) + INTERVAL 3 MONTH\n  AND MAKEDATE(YEAR(CURDATE()) + (MONTH(CURDATE()) >= 4), 1) + INTERVAL 3 MONTH - INTERVAL 1 DAY\nGROUP BY YEAR(dateformonth), MONTH(dateformonth)\nORDER BY YEAR(dateformonth), MONTH(dateformonth);";
    System.out.println(sql);
    ResultSet rsq = stmt1.executeQuery(sql);
    java.sql.ResultSetMetaData rsmd = rsq.getMetaData();
    int noCol = rsmd.getColumnCount();
    while (rsq.next()) {
      ArrayList<String> data = new ArrayList();
      data.add("'" + rsq.getString(1) + "'");
      data.add(rsq.getString(2));
      nl.add(data);
    } 
    if (nl.size() <= 0) {
      ArrayList<String> al = new ArrayList();
      al.add("''");
      al.add("0");
      nl.add(al);
    } 
    return nl;
  }
}

<%-- 
    Document   : users
    Created on : Jul 20, 2025, 8:24:16 PM
    Author     : pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.lang.Exception"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets1/img/venuslogo.png">
    <title></title>
    <link rel="stylesheet" type="text/css" href="assets1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/style.css">
    <!--[if lt IE 9]>
		<script src="assets1/js/html5shiv.min.js"></script>
		<script src="assets1/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
    <div class="main-wrapper">
  
        <jsp:include page="header.jsp" />
        <jsp:include page="sidebar.jsp" />
       
        <div class="page-wrapper">
            <div class="content">
                         <div class="row ">                                           
                    
                    <di                      <div class="col-sm-4 col-3">
                        <h5 class="page-title"> Search Cloumn Filter</h5>
                    </div>
                    <div class="row ">                                           
                    
                    <div class="col-md-12">
                        <div class="form-group form-focus">
                            <label class="focus-label">Search by All Cloumn</label>
                            <input type="text" name="docname" id="myInput" class="form-control floating">
                        </div>
                    </div>  
                        </div>
                        <div class="row "> 
                         <div class="col-sm-12">
                        <h5 class="page-title"> Datewise Filter</h5>
                         </div></div>
                        
                            <form method="post" action="CustomerlLogDat">
                   
                            <div class="row ">                                     
                                
                 <div class="col-md-4">
                        <div class="form-group form-focus">
                            <label class="focus-label">From Date</label>
                            <input type="date" name="fdate" class="form-control floating">
                        </div>
                    </div> 
                    
                        <div class="col-md-4">
                        <div class="form-group form-focus">
                            <label class="focus-label">To Date</label>
                            <input type="date" name="tdate"  class="form-control ">
                        </div>
                    </div> 
                                 <div class="col-md-4">
                        <div class="form-group ">
                           
                            <input type="submit" value="Search" class="form-control floating btn btn-success">
                        </div>
                    </div> 
                                
                            </div>
                                </form>  
                    
                </div>
                <div class="row">
                    <div class="col-sm-12 col-11 text-center">
                        <h4 class="page-title">&nbsp;Customer&nbsp;Logs</h4>
                    </div>
                   
                    
                </div>
                             
                <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("al");
        
%>
                  
                  <div class="row">
                  
                  
                  
                </div>
            
                
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                        
                                                                         
                                                                            <th>Customer Name with Code</th>
                                                                                <th>User Name</th>
                                                                            <th>Logged In</th>
                                                                           <th>IPaddress</th>
                                                                           <th>Count</th>
                                                                           
                                                                            
                                                                        </tr>
                                                                   
                                                                    </thead>
                                                                    
                                                                    
                                                                    <tbody>
                                                        <%
                                                        
                                                        for(int i=0;i<data.size();i++ )
                                                        {
                                                            ArrayList rows=data.get(i);
                                                            String custname=rows.get(1).toString()+"-"+rows.get(0).toString();
                                                             String uname=rows.get(2).toString();
                                                        String cdate=rows.get(3).toString();
                                                          String ip=rows.get(4).toString();
                                                            String cnt=rows.get(5).toString();
                                                            %>
                                                            <tr>
                                                              <td><%=(i+1)%></td>
                                                              <td><%=custname %></td>                                                                           
                                                                            <td><%=uname %></td>
                                                                            <td><%=cdate %></td>
                                                                            <td><%=ip %></td>
                                                                           <td><%=cnt %></td>
                                                                             </tr>
                                                                            
                                                            <%
                                                        }
                                                        %>
                                                             
                                                        
                                                                    </tbody>
                                                                   
                                                                
                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                  
                                        
                                        
                                        </table>
                                           
						</div>
					</div>
                </div>
           <%
    }catch(Exception Ex){
    
    
    }
           %>
            
            </div>
         
        </div>
		<div id="delete_staff" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
                            <form action="deleteGatepass" method="post">
				<div class="modal-content">
					<div class="modal-body text-center">
                                           
						<img src="assets1/img/sent.png" alt="" width="50" height="46">
						<h3>Are you sure want to delete this User?</h3>
                                                <input id="uid" name="dptid" type="hidden"/>
						<div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                                                    <button type="button" id="del" class="btn btn-danger" >Delete </button>						</div
                                           
					</div>
				</div>
                                 
			</div>
                     </form>
			
		</div>
    </div>
    <div class="sidebar-overlay" data-reff=""></div>
    

 <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets1/js/jquery-3.2.1.min.js"></script>
	<script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/js/jquery.dataTables.min.js"></script>
    <script src="assets1/js/dataTables.bootstrap4.min.js"></script>
    <script src="assets1/js/jquery.slimscroll.js"></script>
    <script src="assets1/js/app.js"></script>
        <script type="text/javascript">
            
                  function backscreen()
{
    window.history.back();
}



         $(document).ready(function() {
           
          $('#delete_staff').on('show.bs.modal', function (e) {
              var deleteid = $(e.relatedTarget).data('delete');
   var y=document.getElementById("uid");
  y.value=deleteid;
});
$("#del").click(function(){
     var y=document.getElementById("uid").value;
 // alert("The paragraph :"+y);
  
 
        window.location.href= "DeleteUser?cid="+y;
       
});




         });
         
         
         $(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


      </script>
</body>



</html>
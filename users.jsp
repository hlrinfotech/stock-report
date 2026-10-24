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
                <div class="row">
                     <div class="row">
                      <div class="col-sm-6 col-5 pt-2 text-center">
                          <a href="NewUser"><button id="bck" class="btn btn-rounded btn-success" >Add&nbsp;User(+)</button></a>
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-11 text-center">
                        <h4 class="page-title">&nbsp;Users&nbsp;List</h4>
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
                                                                            <th>User Name</th>
                                                                            <th>Password</th>
                                                                            <th>Customer Id</th>
                                                                            <th>Customer Name</th>
                                                                            <th>Hints</th>
                                                                           <th>Plant</th>
                                                                           <th>Edit</th>
                                                                           <th>Delete</th>
                                                                            
                                                                        </tr>
                                                                   
                                                                    </thead>
                                                                    
                                                                    
                                                                    <tbody>
                                                        <%
                                                        
                                                        for(int i=0;i<data.size();i++ )
                                                        {
                                                            ArrayList rows=data.get(i);
                                                        
                                                            %>
                                                            <tr>
                                                              <td><%=(i+1)%></td>
                                                              <td><%=rows.get(0).toString() %></td>                                                                           
                                                                            <td><%=rows.get(1).toString() %></td>
                                                                            <td><%=rows.get(2).toString() %></td>
                                                                            <td><%=rows.get(3).toString() %></td>
                                                                           <td><%=rows.get(4).toString() %></td>
                                                                           <td><%=rows.get(5).toString() %></td>
                                                                             <td><a href="Editusers?id=<%=rows.get(2).toString() %>"><input  id="bs" type="submit" value="Edit"></a></td>
                                                                           
                                                                          <td><a class="dropdown-item" href="#" data-toggle="modal" data-delete="<%=rows.get(2).toString() %>" data-target="#delete_staff"><i class="fa fa-trash-o m-r-5"></i> Delete</a></td>
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
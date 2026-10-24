<%-- 
    Document   : Adduser
    Created on : Jul 21, 2025, 6:55:45 AM
    Author     : pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">



    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets1/img/venuslogo.png">
        <title></title>
        <link rel="stylesheet" type="text/css" href="assets1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets1/js/html5shiv.min.js"></script>
                    <script src="assets1/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
        <div class="main-wrapper">

    
     <jsp:include page="sidebar.jsp" />
            <jsp:include page="header.jsp" />
            

            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-12  text-center">
                            <h4 class="page-title">Edit&nbsp;User</h4>
                        </div>
                    </div>
                    
                       
<%
 ArrayList data=(ArrayList)request.getAttribute("al");
  String uname=data.get(0).toString();
  String pwd=data.get(1).toString();
 String name=data.get(2).toString()+"-"+data.get(3).toString();
 String hints=data.get(4).toString();
 String plant=data.get(5).toString();
 
%>
                   <div class="row">
                       <div class="col-lg-8 offset-lg-2">
                           <form method="POST" action="UpdateUsers">
                               
                                 <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label>Customer (Code- Name)</label>
                                        <input class="form-control" type="text" value="<%=name%>"   name="custcn" required="" >
                                         
                                    </div>
                                </div>
                                            <div class="col-md-4">
									<div class="form-group">
										<label>Plant</label>
                                                                                <input class="form-control" type="text" value="<%=plant%>" id="plant" name="plant" required="" >
									</div>
                                </div>
                               
                            </div>
                            <div class="row">
                              <div class="col-md-12">
                                    <div class="form-group">
                                        
										<label>Hints</label>
                                                                                <input class="form-control"  type="text"  name="hints" value="<%=hints%>" required="" >
                                                                                
									</div>
                                </div>
                                
                            </div>
                          
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                         <label>User Name</label>
                                         <input class="form-control" type="text"  name="uname" value="<%=uname %>" required="" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="form-group">
                                            <input type="password" class="form-control" name="pwd" value="<%=pwd%>" required="" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                                
                          
                         
                            <div class="m-t-20 text-center">
                                <button class="btn btn-primary submit-btn">Update User</button>
                            </div>
                        </form>
                    </div>

                    </div>
                </div>

            </div>

            <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets1/js/jquery-3.2.1.min.js"></script>
	<script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/js/jquery.slimscroll.js"></script>
    <script src="assets1/js/select2.min.js"></script>
	<script src="assets1/js/moment.min.js"></script>
	<script src="assets1/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets1/js/app.js"></script>
	<script>
          
           $("#custcn").focusout(function(){  
  
  $.ajax({
        type: "get",
        url: "Plants",
        data: {name : $("#custcn").val()
                  
        },
        success:function(result){
          
          
            $("#plant").val( $.trim(result) );
        
         
        }
        
    });
  });
     </script>
         
            
    </body>



</html>
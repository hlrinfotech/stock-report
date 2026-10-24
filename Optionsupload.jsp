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
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
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
                            <h4 class="page-title">Options Upload</h4>
                        </div>
                    </div>
                    
                       

                   <div class="row">
                       <div class="col-lg-8 offset-lg-2">
                           <form method="post" action="uploadAdmin"  enctype="multipart/form-data">
                            
                             <div class="row">
                               
                                 <div class="col-md-12">
                                     
                                      <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Customer Types</label>
                                            <%
                                                ArrayList< ArrayList> ctypes = (ArrayList< ArrayList>) request.getAttribute("ct");
                                            %>
                                            <select class="form-control" id="changetype" onchange="getPlants1(this)" required="">
                                               <option >Select</option>                                                  <%
                                                    for (int i = 0; i < ctypes.size(); i++) {
                                                        ArrayList val = ctypes.get(i);
                                                        String ctypecode = val.get(0).toString();

                                                        String ctypename = val.get(1).toString();
                                                     
                                                %>
                                                <option value="<%=ctypecode%>"><%=ctypename%></option>  
                                                <%}
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Plant</label>

                                            <select class="form-control" id="plant" name="plant" required="" onchange="getCustomerDetails1(this)">
                                                <option>Select</option>
                                            </select>
                                        </div>
                                    </div>
                                             <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Checked&nbsp;All&nbsp;Customer</label>
                                            
                                            <input class="form-control" type="checkbox" onClick="isCheckedornot(this)"  id="allChecedUsr" name="allcheckeduser"  value="" > 
                                        </div>
                                            </div>
                                            
                                             <div class="col-md-3">
                                        <div class="form-group">
                                            <label>All&nbsp;Customer</label>
                                            
                                            <input class="form-control" type="checkbox" checked="checked" id="alusr" name="alluser"  value="" > 
                                        </div>
                                            </div>
                                </div>

                                    <div class="form-group row">
                                        <div class="col-md-12" id="chkgroup" style="display: grid;grid-template-columns: repeat(4,1fr);">
                                       
<!--                                            <label>Customer</label>-->
<!--                                            <input class="form-control" list="cust" type="text" id="search-box" name="username" value="" >-->
                                            
                                     
                                            </div>
                                        
                                 </div>
                             </div>
                            
                                
                            <div class="row">
                               
                                 <div class="col-md-12">
                                    <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Basic Price</label>
                                <div class="col-lg-7">
                                    <input class="form-control" type="file" name="file1">                                    
                                    <span class="form-text text-muted">Select Excel,PDF or image </span>
                                </div>
                              
                            </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Schemes</label>
                                <div class="col-lg-7">
                                    <input class="form-control" type="file" name="file2">
                                    <span class="form-text text-muted">Select Excel,PDF or image </span>
                                </div>
                               
                            </div>
                                </div>
                            </div>
                      
                               
                                <div class="row">
                               
                                 <div class="col-md-12">
                                    <div class="form-group row">
                                <label class="col-lg-3 col-form-label">Circular</label>
                                <div class="col-lg-7">
                                    <input class="form-control" type="file" name="file2">
                                    <span class="form-text text-muted">Select Excel,PDF or image </span>
                                </div>
                              
                            </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group row">
                                <label class="col-lg-3 col-form-label">FTS Scheme</label>
                                <div class="col-lg-7">
                                    <input class="form-control" type="file" name="file4">
                                    <span class="form-text text-muted">Select Excel,PDF or image </span>
                                </div>
                               
                            </div>
                                </div>
                            </div>
                               
                               
                                <div class="row">
                               
                                 <div class="col-md-12">
                                    <div class="form-group row">
                                <label class="col-lg-3 col-form-label">FTS Scheme2</label>
                                <div class="col-lg-7">
                                    <input class="form-control" type="file" name="file5">
                                    <span class="form-text text-muted">Select Excel,PDF or image </span>
                                </div>
                              
                            </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group row">
                                <label class="col-lg-3 col-form-label">FTS Scheme3</label>
                                <div class="col-lg-7">
                                    <input class="form-control" type="file" name="file6">
                                    <span class="form-text text-muted">Select Excel,PDF or image </span>
                                </div>
                               
                            </div>
                                </div>
                            </div>
                               
                         
                            <div class="m-t-20 text-center">
                                <button class="btn btn-primary submit-btn">Upload</button>
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
<!--            <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets1/js/jquery-3.2.1.min.js"></script>
	<script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/js/jquery.slimscroll.js"></script>
    <script src="assets1/js/select2.min.js"></script>-->
	
<!--    <script src="assets1/js/app.js"></script>-->

    <script>
          
          function testuser()
{
    $("#changetype").trigger('change');
}
   
      function getPlants1(selectObj)
                                                {
                                                    var selectedval = selectObj.value;

                                                    if (selectedval != '')
                                                    {

                                                        $.ajax({
                                                            type: "get",
                                                            url: "Plants",
                                                            data: {name: selectedval

                                                            },
                                                            success: function(result) {

                                                                var optionsArray = [];
                                                                optionsArray = JSON.parse(result);

                                                                const select = document.getElementById("plant");
                                                                        // Clear any existing options
                                                                        select.innerHTML = "";

                                                                $.each(optionsArray, function(key, item) {
                                                                    if (item != '')
                                                                    {
                                                                    const option = document.createElement("option");
                                                                            option.value = item;
                                                                    option.text = item;
                                                                    select.appendChild(option);
                                                                    }
                                                                });
$("#chkgroup").html('');
$("#plant").trigger('change');
                                                            }
                                                        });

                                                    }
                                                }




                                                function getCustomerDetails1(selectObj)
                                                {
                                                    var selectedval = selectObj.value;
                                                    $("#chkgroup").html('');
$("#custcn").val('');
                                                    if (selectedval != '')
                                                    {

                                                        $.ajax({
                                                            type: "get",
                                                            url: "CustDetails",
                                                            data: {
                                                                plant:selectedval,
                                                                ctype:$("#changetype").val()

                                                            },
                                                            success: function(result) {

                                                                var optionsArray = [];
                                                                optionsArray = JSON.parse(result);

                                                                const select = document.getElementById("chkgroup");
                                                                        // Clear any existing options
                                                                        select.innerHTML = "";

                                                                $.each(optionsArray, function(key, item) {
                                                                    if (item != '')
                                                                    {
                                                                         const dv = document.createElement("div");
                                                                          dv.className="checkbox";
                                                                    const option = document.createElement("input");
                                                                    option.type="checkbox"
                                                                    option.id="customer_"+key
                                                                    option.value = item;
                                                                    option.name="customers";        
                                                                    option.text = item;
                                                                     option.className="chck";
//                                                                    select.appendChild(option);
                                                                     const lbl = document.createElement("span");
                                                                     lbl.textContent=" "+item;
                                                                  
                                                                  select.appendChild(dv);
                                                                      dv.appendChild(option);
                                                                      dv.appendChild(lbl);
                                                                    }
                                                                });

                                                            }
                                                        });

                                                    }
                                                }
                                                
                                                
                                                 function isCheckedornot(checkedObj)
                                                 {                                                  
                                                      if(checkedObj.checked)
                                                         {
                                                             $(".chck").prop("checked",true);
                                                         }  
                                                         else
                                                         {
                                                               $(".chck").prop("checked",false);
                                                         }    
                                                 }
                                                     
                                                    
                                                
                                              

     </script>
         
            
    </body>



</html>
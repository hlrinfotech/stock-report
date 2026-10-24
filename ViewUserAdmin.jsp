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
                            <h4 class="page-title">View&nbsp;User</h4>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form method="POST" action="AdminUserFilter">

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Customer Types</label>
                                            <%
                                                ArrayList< ArrayList> ctypes = (ArrayList< ArrayList>) request.getAttribute("ct");
                                            %>
                                            <select class="form-control" id="changetype" onchange="getPlants2(this)" required="">
                                                <option value="select">Select</option> 
                                                <%
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
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Plant</label>

                                            <select class="form-control" id="plant" name="plant" required="" onchange="getCustomerDetails2(this)">

                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Customer (Code- Name)</label>
                                            <input class="form-control" type="text"  value="" id="custcn" list="custtypes" name="custcn" required="" >
                                          
                                            <datalist id="custtypes">
                                              
                                            </datalist>
                                        </div>
                                    </div>


                                </div>
                             

     



                                <div class="m-t-20 text-center">
                                    <button class="btn btn-primary submit-btn">View</button>
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

                                                function getPlants2(selectObj)
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

                                                            }
                                                        });

                                                    }
                                                }




                                                function getCustomerDetails2(selectObj)
                                                {
                                                    var selectedval = selectObj.value;
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

                                                                const select = document.getElementById("custtypes");
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

                                                            }
                                                        });

                                                    }
                                                }
                                              
            </script>


    </body>



</html>
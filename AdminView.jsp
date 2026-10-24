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
     <link rel="stylesheet" href="assets/css/templatemo-grad-school.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/style.css">
       <link rel="stylesheet" href="assets/css/owl.css">
       <link rel="stylesheet" href="assets/css/lightbox.css">
       <style type="text/css">
           
          .brdr {

  border: 1px solid #dee2e6 !important;
}
       </style>
    <!--[if lt IE 9]>
		<script src="assets1/js/html5shiv.min.js"></script>
		<script src="assets1/js/respond.min.js"></script>
	<![endif]-->
</head>

<body class="bdybg">
    <div class="main-wrapper">
  
        <jsp:include page="userheader.jsp" />
        
       
        <div class="page-wrapper1">
<!--             <video autoplay muted loop id="bg-video">
             <source src="assets1/video/1.mp4" type="video/mp4" />
      </video>-->
             <div class="video-overlay header-text">
            <div class="content-full">
                
            
                
                
    <div class="row">
                
                    <div class="col-md-12">
                        <div class="card-box">
                            <div class="row m-b-30">
                    <div class="col-12 m-b-30">
                                <%
                                     String un=(String)request.getAttribute("un");
                                     String ccode=(String)request.getAttribute("ccode");
                       
                         String usern="";
                        
                             usern=un+"["+ccode+"]";
                                                %>
                    </div>
                </div>
                            <h4 class="card-title ">Customer: <%=usern%></h4>
                            <ul class="nav nav-tabs nav-tabs-solid nav-justified">
                                                                 <%
                                     
                                   String bn="Stock of Name with Branch";    
                                     try{
                                        bn=request.getAttribute("bn").toString();
                                        if(bn !=null && bn.isEmpty()==false)
                                        {
                                            bn="Stock of "+bn;
                                        }
                                        else
                                        {
                                            bn="Stock of Name with Branch ";
                                        }
                                     }catch(Exception ex){}
                                   %>
                                   
                                                        <li class="nav-item"><a class="nav-link active" href="#basic-justified-tab1" data-toggle="tab">Chart View</a></li>
                                  <li class="nav-item"><a class="nav-link " href="#basic-justified-tab2" data-toggle="tab"><%=bn%></a></li>
                                   <li class="nav-item"><a class="nav-link" href="#basic-justified-tab3" data-toggle="tab">Stock of Tuticorin</a></li>
                                <li class="nav-item"><a class="nav-link " href="#basic-justified-tab4" data-toggle="tab">Customer Statement</a></li>
                                <li class="nav-item"><a class="nav-link" href="#basic-justified-tab5" data-toggle="tab">Outstanding Invoices</a></li>
                                 <li class="nav-item"><a class="nav-link" href="#basic-justified-tab6" data-toggle="tab">Pending Sales Order</a></li>
   <li class="nav-item"><a class="nav-link" href="#basic-justified-tab7" data-toggle="tab">Credit Note</a></li>
                                    
                                <%
                                ArrayList< ArrayList> dwnl=(ArrayList< ArrayList>)request.getAttribute("dwnl");
                                int sz=dwnl.size();
                                if(sz>0)
                                {
                                    %>
                                    
                                    <li class="nav-item dropdown">
                                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Options</a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                    <%
                                    for(int i=0;i<sz;i++)
                                    {
                                        ArrayList rw=dwnl.get(i);
                                        String url=rw.get(0).toString();
                                        String name=rw.get(2).toString();
                                %>
                                  
                                    
                                    
                                <a class="dropdown-item" href="uploads/<%=url%>" target="_blank"><%=name%></a>
                                        
                                    
                               
                                <%
                                    }
                                    %>
                                     </div>
                                 </li>
                                    <%
                                }
                                %>
                               
                            </ul>
                            <div class="tab-content">
                             
                                <div class="tab-pane show active" id="basic-justified-tab1">
                             
                                       
				<div class="row">
                                    <div class="col-12 col-md-12 col-lg-12 col-xl-12" style="display:flex">
                                            
                                        
                                          <div class="col-12 col-md-6 col-lg-6 col-xl-6 ">
						<div class="card">
							<div class="card-body">
								<div class="chart-title">
                                                                    <center><h4>SWH -Current Month</h4></center>
									<div class="float-right">
										<ul class="chat-user-total">
											<li><i class="fa fa-circle current-users"  aria-hidden="true"></i>Target</li>
											<li><i class="fa fa-circle old-users" style="color: #f2d08c" aria-hidden="true"></i> Sales</li>
                                                                                        
										</ul>
									</div>
								</div>	
								<canvas id="currentmontmyChart" ></canvas>
							</div>
						</div>
					</div> 
                                            
                                    <div class="col-12 col-md-6 col-lg-6 col-xl-6">
						<div class="card">
							<div class="card-body">
								<div class="chart-title">
                                                                    <center><h4>SWH - Overall performance</h4></center>
									<div class="float-right">
										<ul class="chat-user-total">
											<li><i class="fa fa-circle current-users"  aria-hidden="true"></i>Target</li>
											<li><i class="fa fa-circle old-users" style="color: #f2d08c" aria-hidden="true"></i>Sales</li>
										</ul>
									</div>
								</div>	
								<canvas id="bargraph"></canvas>
							</div>
						</div>
					</div> 
                                            
                                   
                                            
                                           
                                            
				
					</div>
                </div>
                                

                             
                                    
                                    	<div class="row">
                                    <div class="col-md-12" style="display:flex">
                                            
                                             <div class="col-md-6 ">
						<div class="card">
							<div class="card-body">
								<div class="chart-title">
                                                                    <center><h4>IWH - Current Month</h4></center>
								<div class="float-right">
										<ul class="chat-user-total">
											<li><i class="fa fa-circle current-users"  aria-hidden="true"></i>Target</li>
											<li><i class="fa fa-circle old-users" style="color: #f2d08c" aria-hidden="true"></i>Sales</li>
										</ul>
									</div>	
								</div>	
								<canvas id="currentmontmyChart1" ></canvas>
							</div>
						</div>
					</div>    
                                    <div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="chart-title">
                                                                    <center><h4>IWH - Overall performance</h4></center>
									<div class="float-right">
										<ul class="chat-user-total">
											<li><i class="fa fa-circle current-users"  aria-hidden="true"></i>Target</li>
											<li><i class="fa fa-circle old-users" style="color: #f2d08c" aria-hidden="true"></i>Sales</li>
										</ul>
									</div>
								</div>	
								<canvas id="bargraph1"></canvas>
							</div>
						</div>
					</div> 
                                            
                                   
                                            
                                         
                                            
				
					</div>
                </div>
                                    
                             
                                </div>
                                
                                
                                <div class="tab-pane " id="basic-justified-tab4">
                             
                                       <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("cst");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable1" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0 ">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                            <th> Posting Date</th>
                                                                            <th> Assignment Number</th>
                                                                            <th> Document Date</th>
                                                                            <th>Remarks</th>
                                                                            <th class="text-right"> Opening Balance</th>
                                                                           <th class="text-right">Debit</th>
                                                                           <th class="text-right">Credit</th>
                                                                           <th class="text-right">Closing Balance</th>
                                                                            
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
                                                                            <%
                                                                            for(int j=0;j<rows.size();j++)
                                                                            {  
                                                                                String dataval=rows.get(j).toString();
                                                                                if(j>3){
                                                                            %>
                                                                            <td class="text-right"><%=dataval%></td>
                                                                            <%
                                                                                }
                                                                                else 
                                                                                {%>
                                                                                    <td class="text-left"><%=dataval%></td>
                                                                                <%}
                                                                            }
                                                                            %>
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
                             
    }catch(Exception ex){}
                             %>
                             
                                      
           <div class="row">
                  <div class="col-md-12">
                                                <div class="col-md-2" style="text-align:right">
                                                 <button type="button"  class="btn btn-primary dwnldBtn">Excel</button>
                                                  <button type="button"  class="btn btn-primary dwnldpdf">Pdf</button>
                                                </div>                                               
                                            </div>                    
                </div>  
                             
                             
                                </div>
                                
                             
                             <div class="tab-pane" id="basic-justified-tab5">
                                   <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("oust");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable2" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                            <th> Invoice Date</th>
                                                                            <th> Invoice Number</th>
                                                                            <th> Reference Document Number</th>
                                                                            <th class="text-right">Value</th>
                                                                            <th>Remarks</th>
                                                                            <th class="text-right">Credit Days</th>
                                                                           <th>Document Date</th>
                                                                           <th>Posting Date</th>
                                                                        
                                                                            
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
                                                                            <%
                                                                            for(int j=0;j<rows.size();j++)
                                                                            {  
                                                                                String dataval=rows.get(j).toString();
                                                                                if(j==3 || j==5)
                                                                                {
                                                                            %>
                                                                               <td class="text-right"><%=dataval%></td>
                                                                            <%
                                                                                }
                                                                                else
                                                                                {%>
                                                                                <td ><%=dataval%></td>
                                                                               <% }
                                                                            }
                                                                            %>
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
                             
    }catch(Exception ex){}
                             %> 
                             
                             <div class="row">
                  <div class="col-md-12">
                                                <div class="col-md-2" style="text-align:right">
                                                 <button type="button"  class="btn btn-primary dwnldBtn">Excel</button>
                                                  <button type="button"  class="btn btn-primary dwnldpdf">Pdf</button>
                                                </div>                                               
                                            </div>                    
                </div>  
                                </div>
                                <div class="tab-pane" id="basic-justified-tab6">
                                   <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("ps");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable3" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                            <th> Date</th>
                                                                            <th> Sales order Number</th>
                                                                            <th> Material Code</th>
                                                                            <th>Material Description</th>
                                                                            <th>Order Quantity</th>
                                                                           <th> Pending Order Quantity</th>
                                                                          <th> UOM</th>
                                                                            
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
                                                                            <%
                                                                            for(int j=0;j<rows.size();j++)
                                                                            {  
                                                                                String dataval=rows.get(j).toString();
                                                                                if(j==4 || j==5)
                                                                                {   
                                                                            %>
                                                                            <td class="text-right"><%=dataval%></td>
                                                                            <%
                                                                                }
                                                                                else
                                                                                {%>
                                                                                <td><%=dataval%></td>
                                                                                <%}    
                                                                            }
                                                                            %>
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
                             
    }catch(Exception ex){}
                             %> 
                             <div class="row">
                  <div class="col-md-12">
                                                <div class="col-md-2" style="text-align:right">
                                                  <button type="button"  class="btn btn-primary dwnldBtn">Excel</button>
                                                  <button type="button"  class="btn btn-primary dwnldpdf">Pdf</button>
                                                </div>                                               
                                            </div>                    
                </div>  
                                </div>
                                <div class="tab-pane " id="basic-justified-tab2">
                                  <%
    try{
      
  ArrayList< ArrayList<String>> data=(ArrayList< ArrayList<String>>)request.getAttribute("sbn");
  ArrayList< ArrayList<String>> datah=(ArrayList< ArrayList<String>>)request.getAttribute("sbh");

        
%>
				<div class="row">
					<div class="col-md-6">
                                            <center><h4>Vertical</h4></center>
						<div class="table-responsive">

                                                     
         				<table id="myTable7" style=" white-space: nowrap;" class="table table-border table-striped custom-table  mb-0 ">
                                                                   
                                                                    
                                                                   <%
                                                                      for(int i=0;i<data.size();i++)
                                                                      {
                                                                          ArrayList rw=data.get(i);
                                                                          if(i==0)
                                                                          {
                                                                             %>
                                                                             <thead>
                                            <%
                                                                               for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              %>
                                                                              <th class="brdr"><%=v%></th>   
                                                                         <% 
                                                                          }
                                                                               %>
                                        </thead>
                                                                          <%}   
                                                                          else
                                                                          {   
                                                                          %> 
                                                                    <tbody>
                                                                      
                                                                          <tr>
                                                                          <%
                                                                          for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              String cl=rw.get(1).toString().trim();
                                                                              if(cl.isEmpty()==false)
                                                                              {   
                                                                              %>
                                                                              <td class="brdr"><%=v%></td>   
                                                                         <% 
                                                                          }
                                                                          }
                                                                          %>
                                                                             </tr>     
                                                                       <%   }   
                                                                          %>
                                     
                                                                   
                                                                    </tbody>
                                                                    
                                                                     <%
                                                                      }
                                                                      %>
                                                                
                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                  
                                        
                                        
                                        </table>
                                           
						</div>
					</div>
                
                                
                                
                                
                                
                                	<div class="col-md-6">
                                            <center><h4>Horizontal</h4></center>
						<div class="table-responsive">

                                                     
         				<table id="myTable7" style=" white-space: nowrap;" class="table table-border table-striped custom-table  mb-0 ">
                                                                   
                                                                    
                                                                   <%
                                                                      for(int i=0;i<datah.size();i++)
                                                                      {
                                                                          ArrayList rw=datah.get(i);
                                                                          if(i==0)
                                                                          {
                                                                             %>
                                                                             <thead>
                                            <%
                                                                               for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              %>
                                                                              <th class="brdr"><%=v%></th>   
                                                                         <% 
                                                                          }
                                                                               %>
                                        </thead>
                                                                          <%}   
                                                                          else
                                                                          {   
                                                                          %> 
                                                                    <tbody>
                                                                      
                                                                          <tr>
                                                                          <%
                                                                          for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              String cl=rw.get(1).toString().trim();
                                                                              if(cl.isEmpty()==false)
                                                                              {   
                                                                              %>
                                                                              <td class="brdr"><%=v%></td>   
                                                                         <% 
                                                                          }
                                                                          }
                                                                          %>
                                                                             </tr>     
                                                                       <%   }   
                                                                          %>
                                     
                                                                   
                                                                    </tbody>
                                                                    
                                                                     <%
                                                                      }
                                                                      %>
                                                                
                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                  
                                        
                                        
                                        </table>
                                           
						</div>
					</div>
                                
                                
                                
                                </div>
                                
                             <%
                             
    }catch(Exception ex){}
                             %> 
                                </div>
                                
                                 <div class="tab-pane" id="basic-justified-tab3">
                                  <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("sot");
  ArrayList< ArrayList> datah=(ArrayList< ArrayList>)request.getAttribute("soth");
 
        
%>
				<div class="row">
					<div class="col-md-6">
                                            <center><h4>Vertical</h4></center>
						<div class="table-responsive">

                                                     
         				                   
         				<table id="myTable7" style=" white-space: nowrap;" class="table table-border table-striped custom-table  mb-0 ">
                                                                   
                                                                    
                                                                   <%
                                                                      for(int i=0;i<data.size();i++)
                                                                      {
                                                                          ArrayList rw=data.get(i);
                                                                          if(i==0)
                                                                          {
                                                                             %>
                                                                             <thead>
                                            <%
                                                                               for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              %>
                                                                              <th class="brdr"><%=v%></th>   
                                                                         <% 
                                                                          }
                                                                               %>
                                        </thead>
                                                                          <%}   
                                                                          else
                                                                          {   
                                                                          %> 
                                                                    <tbody>
                                                                      
                                                                          <tr>
                                                                          <%
                                                                          for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              String cl=rw.get(1).toString().trim();
                                                                              if(cl.isEmpty()==false)
                                                                              {   
                                                                              %>
                                                                              <td class="brdr"><%=v%></td>   
                                                                         <% 
                                                                          }
                                                                          }
                                                                          %>
                                                                             </tr>     
                                                                       <%   }   
                                                                          %>
                                     
                                                                   
                                                                    </tbody>
                                                                    
                                                                     <%
                                                                      }
                                                                      %>
                                                                
                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                  
                                        
                                        
                                        </table>
                                           
						</div>
					</div>
                
                                
                                
                                
                                
                                	<div class="col-md-6">
                                            <center><h4>Horizontal</h4></center>
						<div class="table-responsive">

                                                     
         					<table id="myTable7" style=" white-space: nowrap;" class="table table-border table-striped custom-table  mb-0 ">
                                                                   
                                                                    
                                                                   <%
                                                                      for(int i=0;i<datah.size();i++)
                                                                      {
                                                                          ArrayList rw=datah.get(i);
                                                                          if(i==0)
                                                                          {
                                                                             %>
                                                                             <thead>
                                            <%
                                                                               for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              %>
                                                                              <th class="brdr"><%=v%></th>   
                                                                         <% 
                                                                          }
                                                                               %>
                                        </thead>
                                                                          <%}   
                                                                          else
                                                                          {   
                                                                          %> 
                                                                    <tbody>
                                                                      
                                                                          <tr>
                                                                          <%
                                                                          for(int j=1;j<rw.size()-1;j++)
                                                                          {
                                                                              String v=rw.get(j).toString();
                                                                              String cl=rw.get(1).toString().trim();
                                                                              if(cl.isEmpty()==false)
                                                                              {   
                                                                              %>
                                                                              <td class="brdr"><%=v%></td>   
                                                                         <% 
                                                                          }
                                                                          }
                                                                          %>
                                                                             </tr>     
                                                                       <%   }   
                                                                          %>
                                     
                                                                   
                                                                    </tbody>
                                                                    
                                                                     <%
                                                                      }
                                                                      %>
                                                                
                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                  
                                        
                                        
                                        </table>
                                           
						</div>
					</div>
                                
                                
                                
                                </div>
                                
                             <%
                             
    }catch(Exception ex){}
                             %> 
                                </div>
                                
                                
                                <div class="tab-pane" id="basic-justified-tab7">
   <div class="table-responsive">
                                            <table id="myTable2" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                               
                                                  
                                                     <%
                                                     try
                                                     {    
                                                    
                                                        ArrayList< ArrayList> lasttw=(  ArrayList< ArrayList>)request.getAttribute("lasttw");
                                                        
                                                         ArrayList heado=lasttw.get(0);
                                                     %>
                                                       
                                                     


                                                   <thead>
                                                      <tr>
                                                        <%
                                                         for(int j=0;j<heado.size();j++)
                                                          {  
                                                        %>
                                                        <th>
                                                            <%=heado.get(j).toString() %>
                                                        </th>
                                                        
                                                        <%
                                                          }
                                                        %>
                                                    </tr>
                                                
                                                </thead>

                                               
                                                <tbody>
                                                    
                                                    <%
                                                     for(int i=1;i<lasttw.size();i++)
                                                     {
                                                         
                                                       ArrayList data=lasttw.get(i);
                                                    %>
                                                    
                                               
                                                    
                                            
                                                    <tr>
                                                        <%
                                                         for(int j=0;j<data.size();j++)
                                                          {  
                                                        %>
                                                        <td>
                                                            <%=data.get(j).toString() %>
                                                        </td>
                                                        
                                                        <%
                                                          }
                                                        %>
                                                    </tr>
                                                    <%
                                                     }
                                                    %>
                                                </tbody>
                                                
                                                <%
                                                }catch(Exception ex)
                                                {
                                                    
                                                }
                                                %>
                                            </table>
   </div>


                                        </div>
                                
<!--                                <div class="tab-pane" id="basic-justified-tab6">
                                    Tab content 4
                                </div>
                                
                                 <div class="tab-pane" id="basic-justified-tab7">
                                    Tab content 3
                                </div>-->
                           
                            </div>
                        </div>
                    </div>
                </div>
            
            
       
            </div>
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
     <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
     <script src="assets1/js/jquery.table2excel.min.js"></script>
       <script src="assets1/js/Chart.bundle.js"></script>
     
     <script src="assets/js/dwnldpdf.js"></script>
     <script src="assets/js/jspdf.plugin.autotable.min.js"></script>
      
        <script type="text/javascript">
            
                  function backscreen()
{
    window.history.back();
}



         
         
         $(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

       jQuery(document).ready(function () {
			jQuery('.dwnldBtn').on('click', function () {
                           if(jQuery("#myTable1").is(':visible') )
                           {   
				jQuery("#myTable1").table2excel({
					filename: "Customerstmt.xls"
				});
                            }
                               if(jQuery("#myTable2").is(':visible') )
                           {   
				jQuery("#myTable2").table2excel({
					filename: "OustandingInv.xls"
				});
                            }
                            
                                        if(jQuery("#myTable3").is(':visible') )
                           {   
				jQuery("#myTable3").table2excel({
					filename: "PendingSales.xls"
				});
                            }
                            
                                        if(jQuery("#myTable7").is(':visible') )
                           {   
				jQuery("#myTable7").table2excel({
					filename: "SOBNV.xls"
				});
                                jQuery("#myTable8").table2excel({
					filename: "SOBNHZ.xls"
				});
                            }
                            
                             if(jQuery("#myTable5").is(':visible') )
                           {   
				jQuery("#myTable5").table2excel({
					filename: "SOT_ver.xls"
				});
                                
                                jQuery("#myTable6").table2excel({
					filename: "SOT_hoz.xls"
				});
                            }
                            
                            
			});
		});

 $(".dwnldpdf").click(function () {
      const { jsPDF } = window.jspdf;
      const doc = new jsPDF();


if(jQuery("#myTable1").is(':visible') )
                           {   
			
                                         doc.text("Customer Statement ", 14, 10);
                                          doc.autoTable({
        html: "#myTable1",   // get table by id
        startY: 20,
        theme: "grid",       // style: grid, strip, plain
        styles:{
            fontSize:7.5
        }
      });

      doc.save("Customerstmt.pdf");
				//});
                            }
                               if(jQuery("#myTable2").is(':visible') )
                           {   
				
					
                                            doc.text("Oustanding Invoices ", 14, 10);
                                          doc.autoTable({
        html: "#myTable2",   // get table by id
        startY: 20,
        theme: "grid",       // style: grid, strip, plain
         styles:{
            fontSize:7.5
        }
      });

      doc.save("OustandingInv.pdf");
				
                            }
                            
                                        if(jQuery("#myTable3").is(':visible') )
                           {   
				
					
                                            doc.text("Pending Sales Order ", 14, 10);
                                          doc.autoTable({
        html: "#myTable3",   // get table by id
        startY: 20,
        theme: "grid",       // style: grid, strip, plain
         styles:{
            fontSize:7.5
        }
      });

      doc.save("PendingSales.pdf");
				
                            }
                            
                         
    });
    
    // charts
    
    $(document).ready(function() {
	
	// Bar Chart
<%    
                                    ArrayList< ArrayList> overallCustomer=(ArrayList< ArrayList>)request.getAttribute("ovrallcuschat");
                                    ArrayList< ArrayList> overallallSales=(ArrayList< ArrayList>)request.getAttribute("overallCustsales");
                                    
                               
%>
        




       function safeParse(str) {
  if (!str || str.trim() === "") return [];   // if empty string → return []
  str = str.replace(/'/g, '"');               // fix quotes
  return JSON.parse(str);
}


       function safeParse(str) {
  if (!str || str.trim() === "") return [];   // if empty string → return []
  str = str.replace(/'/g, '"');               // fix quotes
  return JSON.parse(str);
}
// --- Raw data as STRING (from JSP/Servlet) ---
    var dataset1Str = "<%=overallCustomer%>";
    var dataset2Str ="<%=overallallSales%>";
debugger;

   let dataset1 = safeParse(dataset1Str);
let dataset2 = safeParse(dataset2Str);

    // --- Collect all unique labels ---
    var allLabels = [...new Set([
      ...dataset1.map(d => d[0]),
      ...dataset2.map(d => d[0])
    ])];

    // --- Helper to align data with labels ---
    function mapToLabels(dataset, labels) {
      var map = Object.fromEntries(dataset); // {"Apr-25":100, "May-25":255, ...}
      return labels.map(label => map[label] || 0);
    }

    debugger;
    sortMonthwise(allLabels);
    // --- Chart.js dataset format ---
    var barChartData = {
      labels: allLabels,
      datasets: [
        {
          label: ['Target'],
          backgroundColor: 'rgba(0, 158, 251, 0.5)',
          borderColor: 'rgba(0, 158, 251, 1)',
          borderWidth: 1,          
          data: mapToLabels(dataset1, allLabels)
        },
        {
          label: ['Sales'],
          backgroundColor: 'rgba(255, 188, 53, 0.5)',
          borderColor: 'rgba(255, 188, 53, 1)',
          borderWidth: 1,
          data: mapToLabels(dataset2, allLabels)
        }
      ]
    };
       
       
       

	var ctx = document.getElementById('bargraph').getContext('2d');
	window.myBar = new Chart(ctx, {
		type: 'bar',
		data: barChartData,
		options: {
                    
			responsive: true,
			legend: {
				display: false,
			},
                        scales: {
				  xAxes: [{
                barThickness: 20,     // Fixed bar width in pixels
                // OR maxBarThickness: 40  // Max bar width (if space allows)
            }],
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
		}
	});

	// Line Chart
<%

     String crm=request.getAttribute("crm").toString();
                                    String csm=request.getAttribute("csm").toString();
                                                                      String cm=request.getAttribute("curmonth").toString();
%>
     
var crm="<%=crm%>";
var csm="<%=csm%>";
var cm="<%=cm%>";
var ctx1 = document.getElementById('currentmontmyChart').getContext('2d');
    	
var monthswhbarChartData = {
		labels: [''],
		datasets: [{
			label:  ['Target'],
			backgroundColor: 'rgba(0, 158, 251, 0.5)',
			borderColor: 'rgba(0, 158, 251, 1)',
			borderWidth: 1,
                        barThickness:20,
			data: [crm]
		}, {
			label:  ['Sales'],
			backgroundColor: 'rgba(255, 188, 53, 0.5)',
			borderColor: 'rgba(255, 188, 53, 1)',
			borderWidth: 1,
                        barThickness:20,
			data: [csm]
		}]
	};
   	
window.myBar4 = new Chart(ctx1, {
		type: 'bar',
		data: monthswhbarChartData,
                barThickness:20,
		options: {
			responsive: true,
			legend: {
				display: false,
			},
                        scales: {
				  xAxes: [{
                barThickness: 20,     // Fixed bar width in pixels
                // OR maxBarThickness: 40  // Max bar width (if space allows)
            }],
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
		}
	});


  
  
  
//  instant
  
  <%    
                                    ArrayList< ArrayList> overallCustomerins=(ArrayList< ArrayList>)request.getAttribute("ovrallcuschatins");
                                    ArrayList< ArrayList> overallallSalesins=(ArrayList< ArrayList>)request.getAttribute("overallCustsalesins");
                                   
                                    
                               
%>
        
        
        
        var dataset1Str1 = "<%=overallCustomerins%>";
    var dataset2Str1 ="<%=overallallSalesins%>";

 let dataset11 = safeParse(dataset1Str1);
let dataset21 = safeParse(dataset2Str1);

    // --- Collect all unique labels ---
    var allLabels1 = [...new Set([
      ...dataset11.map(d => d[0]),
      ...dataset21.map(d => d[0])
    ])];

sortMonthwise(allLabels1);

var barChartData1 = {
      labels: allLabels1,
      datasets: [
        {
          label: ['Target'],
          backgroundColor: 'rgba(0, 158, 251, 0.5)',
          borderColor: 'rgba(0, 158, 251, 1)',
          borderWidth: 1,          
          data: mapToLabels(dataset11, allLabels1)
        },
        {
          label: ['Sales'],
          backgroundColor: 'rgba(255, 188, 53, 0.5)',
          borderColor: 'rgba(255, 188, 53, 1)',
          borderWidth: 1,
          data: mapToLabels(dataset21, allLabels1)
        }
      ]
    };

var ctx1 = document.getElementById('bargraph1').getContext('2d');
	window.myBar1 = new Chart(ctx1, {
		type: 'bar',
		data: barChartData1,
		options: {
                    
			responsive: true,
			legend: {
				display: false,
			},
                        scales: {
				  xAxes: [{
                barThickness: 20,     // Fixed bar width in pixels
                // OR maxBarThickness: 40  // Max bar width (if space allows)
            }],
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
		}
	});




<%

     String crmins=request.getAttribute("crmins").toString();
                                    String csmins=request.getAttribute("csmins").toString();

%>
 
var crm1="<%=crmins%>";
var csm1="<%=csmins%>";

var ctx2 = document.getElementById('currentmontmyChart1').getContext('2d');
  	
var monthinshbarChartData = {
		labels: [''],
		datasets: [{
			label: ['Target'],
			backgroundColor: 'rgba(0, 158, 251, 0.5)',
			borderColor: 'rgba(0, 158, 251, 1)',
			borderWidth: 1,
			data: [crm1]
		}, {
			label: ['Sales'],
			backgroundColor: 'rgba(255, 188, 53, 0.5)',
			borderColor: 'rgba(255, 188, 53, 1)',
			borderWidth: 1,
			data: [csm1]
		}]
	};
   	
window.myBar4 = new Chart(ctx2, {
		type: 'bar',
		data: monthinshbarChartData,
		options: {
			responsive: true,
			legend: {
				display: false,
			},
                        scales: {
				  xAxes: [{
                barThickness: 20,     // Fixed bar width in pixels
                // OR maxBarThickness: 40  // Max bar width (if space allows)
            }],
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
		}
	});

function sortMonthwise(months)
{
var monthMap = {
        Jan: 0, Feb: 1, Mar: 2, Apr: 3, May: 4, Jun: 5,
        Jul: 6, Aug: 7, Sep: 8, Oct: 9, Nov: 10, Dec: 11
      };   
      
        months.sort((a, b) => {
        let [ma, ya] = a.split("-");
        let [mb, yb] = b.split("-");
        ya = parseInt("20" + ya, 10); // convert 25 -> 2025
        yb = parseInt("20" + yb, 10);

        if (ya === yb) {
          return monthMap[ma] - monthMap[mb];
        }
        return ya - yb;
      });
}


 
});





//instant



 
        

    
    
      </script>
</body>



</html>
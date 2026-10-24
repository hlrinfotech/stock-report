<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Venus</title>
    
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-grad-school.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets1/css/style.css">
  </head>

<body>

   
  <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
      <a href="#"><em>venus</em> </a>
    </div>
    <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
    <nav id="menu" class="main-nav" role="navigation">
     <ul class="main-menu">
<!--        <li><a href="#section1">Home</a></li>
        <li class="has-submenu"><a href="#section2">About Us</a>
          <ul class="sub-menu">
            <li><a href="#section2">Who we are?</a></li>
            <li><a href="#section3">What we do?</a></li>
            <li><a href="#section3">How it works?</a></li>
            <li><a href="https://templatemo.com/about" rel="sponsored" class="external">External URL</a></li>
          </ul>
        </li>
        <li><a href="#section4">Courses</a></li>
         <li><a href="#section5">Video</a></li> 
        <li><a href="#section6">Contact</a></li>-->
<li><a href="index.jsp" class="external">Logout</a></li>
      </ul>
    </nav>
  </header>




  
  <section class="section why-us" data-section="section2">
         <video autoplay muted loop id="bg-video">
             <source src="assets/video/tabvideo/1.mp4" type="video/mp4" />
      </video>
       <div class="video-overlay header-text">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Reports</h2>
          </div>
        </div>
        <div class="col-md-12">
          <div id='tabs'>
            <ul>
              <li><a href='#tabs-1'>Customer Statement</a></li>
              <li><a href='#tabs-2'>Outstanding Invoices</a></li>
              <li><a href='#tabs-3'>Pending Sales Order</a></li>             
              <li><a href='#tabs-4'>Stock of Branch Name</a></li>
               <li><a href='#tabs-5'>Stock of Tuticorin</a></li>
             
            </ul>
            <section class='tabs-content'>
              <article id='tabs-1'>
             
                             <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("cst");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                            <th> Posting Date</th>
                                                                            <th> Assignment Number</th>
                                                                            <th> Document Date</th>
                                                                            <th>Remarks</th>
                                                                            <th> Opening Balance</th>
                                                                           <th>Debit</th>
                                                                           <th>Credit</th>
                                                                           <th>Closing Balance</th>
                                                                            
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
                                                                            %>
                                                                               <td><%=dataval%></td>
                                                                            <%
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
              </article>
             
              
              
              <article id='tabs-2'>
           <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("oust");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                            <th> Invoice Date</th>
                                                                            <th> Invoice Number</th>
                                                                            <th> Reference Document Number</th>
                                                                            <th>Value</th>
                                                                            <th>Remarks</th>
                                                                           <th>Credit Days</th>
                                                                        
                                                                            
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
                                                                            %>
                                                                               <td><%=dataval%></td>
                                                                            <%
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
              </article>
            
              
              <article id='tabs-3'>
                  <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("ps");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
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
                                                                            %>
                                                                               <td><%=dataval%></td>
                                                                            <%
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
              </article>
              
              
              
                            <article id='tabs-4'>
                 <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("sbn");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>S.No</th>
                                                                            <th> matericalcode</th>
                                                                            <th> description</th>
                                                                            <th> uom</th>
                                                                            <th>qty</th>
                                                                        
                                                                        
                                                                            
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
                                                                            %>
                                                                               <td><%=dataval%></td>
                                                                            <%
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
              </article>
              
              
                            <article id='tabs-5'>
                 <%
    try{
      
  ArrayList< ArrayList> data=(ArrayList< ArrayList>)request.getAttribute("sot");
        
%>
				<div class="row">
					<div class="col-md-12">
                                          
						<div class="table-responsive">

                                                     
         				<table id="myTable" style=" white-space: nowrap;" class="table table-border table-striped custom-table datatable mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                                <th>S.No</th>
                                                                            <th> matericalcode</th>
                                                                            <th> description</th>
                                                                            <th> uom</th>
                                                                            <th>qty</th>
                                                                        
                                                                            
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
                                                                            %>
                                                                               <td><%=dataval%></td>
                                                                            <%
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
              </article>
              
     
           
              
           
          </div>
        </div>
      </div>
    </div></div>
  </section>

 

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
    
        <script src="assets1/js/jquery-3.2.1.min.js"></script>
	<script src="assets1/js/popper.min.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>
    <script src="assets1/js/jquery.dataTables.min.js"></script>
    <script src="assets1/js/dataTables.bootstrap4.min.js"></script>
    <script src="assets1/js/jquery.slimscroll.js"></script>
    <script src="assets1/js/app.js"></script>
    
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
          if($(e.target).hasClass('external')) {
            return;
          }
          e.preventDefault();
          $('#menu').removeClass('active');
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>
</html>
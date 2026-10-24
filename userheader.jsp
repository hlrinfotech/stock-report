  <%@page import="java.util.ArrayList"%>
<div class="header">
			<div class="header-left">
                            <a href="index.jsp" class="logo">
                                    <img src="assets1/img/venuslogo.png" width="50" height="25" alt=""> 
<!--                                    <span>Venus</span>-->
				</a>
			</div>
			<a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
            <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
            <ul class="nav user-menu float-right">
               
               
                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img">
							<img class="rounded-circle" src="assets1/img/user.jpg" width="24" alt="Admin">
							<span class="status online"></span>
						</span>
                        <%
                         String un=(String)request.getAttribute("un");
                        %>
						<span><%=un.toUpperCase() %></span>
                    </a>
					<div class="dropdown-menu">
						
                                            <%
                        ArrayList< ArrayList> vw=(ArrayList< ArrayList>)request.getAttribute("viewcust");
                        
                        for(int i=0;i<vw.size();i++)
                        {
                            ArrayList data=vw.get(i);
                            String cuscode=data.get(2).toString();
                            String cusname=data.get(3).toString();
                            String user=cusname+"("+cuscode+")";
                            %>
                               <a class="dropdown-item" href="UserFilter?ccode=<%=cuscode%>"><img class="rounded-circle" src="assets1/img/user.jpg" width="24" alt="Admin">&nbsp;&nbsp;<%=user%></a>
                        <%}
                        %>
                                            <a class="dropdown-item" href="forgetpassword.jsp">Change&nbsp;Password</a>
						
                                                <a class="dropdown-item" href="index.jsp">Logout</a>
					</div>
                </li>
            </ul>
            <div class="dropdown mobile-user-menu float-right">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                <div class="dropdown-menu dropdown-menu-right">
                   <a class="dropdown-item" href="#">My Profile</a>
						<a class="dropdown-item" href="#">Change&nbsp;Password</a>
						
                                                <a class="dropdown-item" href="index.jsp">Logout</a>
                </div>
            </div>
        </div>
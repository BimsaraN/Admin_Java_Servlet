<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="DBUtil.DBConnection" %>


<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/adminstyle.css">
<link rel="stylesheet" href="./css/adminstyle2.css">
<link rel="stylesheet" href="./css/adminstyle3.css">
<link rel="stylesheet" href="./css/headerfooter.css">
<script type="text/javascript" src="./js/admin.js"></script>
<title>Admin Panel</title>
</head>

<body>
    <!-- header -->
    <div class="header">
        <a href="Home.jsp"><img class="logo" src="./img/theLogo.png" alt=""> </a>
    </div>
    <form>
        <a href="LogoutServlet"><img class="profile" src="img/logout.svg" alt="logout" style="width: 30px; margin-left: 1400px; margin-top: -800px; "></a>
    </form>
    
    <div id="mySidenav" class="sidenav">
        <a href="#">About Us</a>
        <a href="package.jsp">Packages</a>
        <a href="ThingstoDo.jsp">Things To Do</a>
        <a href="ContactUs.jsp">Contact Us</a>
    </div>

    <!-- controal form -->

    <div class="user_handle">
        <div class="photo" style="background-image: url(./img/adminback.jpg);
    										background-size: cover;">

        </div>

        <div class="button-set">
            <form action="#">

                <li><input type="button" value="User  Manage" onclick="openUtable()"></li>
                <li><input type="button" value="Reservation Manage" onclick="openRestable()"></li>
                <li><input type="button" value="Package Manage" onclick="openPckgtable()"></li>

            </form>
        </div>
        
        <!-- Usera data Manage  -->
        
        <div class="table_container" id="table_container">
            <a href="javascript:void(0)" class="closebtn" onclick="closeUtable()">&times;</a>
            <table>
    		<% 
		 	Connection con = null;
		 	Statement st = null;
		 	ResultSet rs = null;
		 
				try{
					String sql = "select * from userdata where type='user'";
					con = DBConnection.getConnection();
		            st = con.createStatement();
		            
		            rs = st.executeQuery(sql);
		            if(rs.next()){
		            	System.out.println("done!!");
		            }
		           
				} catch (Exception e) {
					
		            System.out.println("fetching error!! " + e);
		        }
			%>
                <thead>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Action</th><br>
                </thead>

                <!-- getting first row from table -->
                <tr>
                    <td>
                        <%=rs.getString(1)%>
                    </td>
                    <td>
                        <%=rs.getString(2)%>
                    </td>
                    <td>
                        <%=rs.getString(3)%>
                    </td>
                    <td>
                        <%=rs.getString(4)%>
                    </td>
                    <td>
                        <%		//create session to handle delete part
                           		HttpSession Uusession = request.getSession();
                           		Uusession.setAttribute("uemail", rs.getString(3));
                        %>
                            <li>
                                <input type="button" name="edit" value="Edit" id="uedit" onclick="openUeditform1()">
                            </li>
                        <form action="udataD" method="post">
                            <li>
                                <input type="hidden" value="${uemail }" name="email">
                                <input type="submit" name="del" value="delete" id="udel">
                            </li>
                        </form>
                    </td>
                 </tr>   
                    <div class="ueditAdminup" id="ueditAdminup">
                        <div class="edithero">
                             <span> &ensp; User Data Edit</span><br>
                            <label><span>Cannot Edit User Email</span></label><br>
                            
                        </div>
                        
                        <form action="ueditA" method="post">
                        <ul>
                            <li>
                                <label>First Name :</label>
                                <input type="text" value="<%=rs.getString(1)%>" name="fname">
                            </li>
                            <li>
                                <label>Last Name :</label>
                                <input type="text" value="<%=rs.getString(2)%>" name="lname">
                                <input type="hidden" value="<%=rs.getString(3)%>" name="email">
                            </li>
                            <li>
                                <label>Contact No. : </label>
                                <input type="text" value="<%=rs.getString(4)%>" name="mobile">
                            </li>
                            <li>
                                <label>Password :</label>
                                <input type="text"  value="<%=rs.getString(5)%>"  name="pass">
                            </li>
                            <li>
                                <input type="submit" value="Update" id="updateA" onclick="closeUeditform1()">
                            </li>
                        </ul>
                        </form>
                        
                    </div>
               <% while(rs.next()){ %>

                <tr>
                    <td>
                        <%=rs.getString(1)%>
                    </td>
                    <td>
                        <%=rs.getString(2)%>
                    </td>
                    <td>
                        <%=rs.getString(3)%>
                    </td>
                    <td>
                        <%=rs.getString(4)%>
                    </td>
                    <td>
							<%	//create session to handle delete part
                           		HttpSession Uu2session = request.getSession();
                           		Uu2session.setAttribute("u2email", rs.getString(3));
                        		//String email = rs.getString(3);
                        		//System.out.println("email:"+email);
                        	%>
                
                            <li>
                                <input type="button" name="edit" value="Edit" id="uedit" onclick="openUeditform()">
                            </li>
                        
                        <form action="udataD" method="post">
                            <li>
                                <input type="hidden" value="${u2email }" name="email" >
                                <input type="submit" name="del" value="delete" id="udel">
                            </li>
                        </form>
                    </td>
                   <!--  <div class="ueditAdmin" id="ueditAdmin">
                        <div class="edithero">
                             <span> &ensp; User Data Edit</span><br>
                            <label><span>Cannot Edit User Email</span></label><br>
                            
                        </div>
                        <form action="ueditA" method="post">
                        <ul>
                            <li>
                                <label>First Name :</label>
                                <input type="text" value="<%=rs.getString(1)%>" name="fname">
                            </li>
                            <li>
                                <label>Last Name :</label>
                                <input type="text" value="<%=rs.getString(2)%>" name="lname">
                                <input type="hidden" value="<%=rs.getString(3)%>" name="email">
                            </li>
                            <li>
                                <label>Contact No. : </label>
                                <input type="text" value="<%=rs.getString(4)%>" name="mobile">
                            </li>
                            <li>
                                <label>Password :</label>
                                <input type="text"  value="<%=rs.getString(5)%>"  name="pass">
                            </li>
                            <li>
                                <input type="submit" value="Update" id="updateA" onclick="closeUeditform1()">
                            </li>
                        </ul>
                        </form>
                        
                    </div>-->
                </tr>
                <%} %>
            </table>
            
        </div>
        
        <!-- Reservation Data Manage -->
        
        <div class="table_container1" id="table_container1">
            <a href="javascript:void(0)" class="closebtn" onclick="closeRestable()">&times;</a>
            <table>
            <% 
		 	Connection conn = null;
		 	Statement sts = null;
		 	ResultSet rss = null;
		 
				try{
					String sql2 = "select * from resdata";
					conn = DBConnection.getConnection();
		            sts = conn.createStatement();
		            
		            rss = sts.executeQuery(sql2);
		            if(rss.next()){
		            	System.out.println("done2!!");
		            }
		           
				} catch (Exception e) {
					
		            System.out.println("fetching error!! " + e);
		        }
			%>
                <thead>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>Arrival Date</th>
                    <th>PickUp Date</th>
                    <th>No of Peoples</th>
                    <th>Package</th>
                    <th>Additional Note</th>
                    <th>Reservation Status</th>
                    <th>Mobile Number</th>
                    <th>Action</th><br>
                </thead>

                <!-- getting first row from table -->
                <tr>
                    <td>
                        <%=rss.getString(1)+rss.getString(2)%>
                    </td>
                    <td>
                        <%=rss.getString(3)%>
                    </td>
                    <td>
                         <%=rss.getString(4)%>
                    </td>
                    <td>
                         <%=rss.getString(5)%>
                    </td>
                    <td>
                         <%=rss.getString(6)%>
                    </td>
                    <td>
                         <%=rss.getString(7)%>
                    </td>
                    <td>
                         <%=rss.getString(8)%>
                    </td>
                    <td>
                         <%=rss.getString(9)%>
                    </td>
                    <td>
                        <%=rss.getString(10)%>
                    </td>
                    <td>
                         <%=rss.getString(11)%>
                    </td>
                   		 <%		//create session to handle delete part
                           		HttpSession ARsession = request.getSession();
                           		ARsession.setAttribute("Remail", rss.getString(3));
                        	//String email = rs.getString(3);
                        	//System.out.println("email:"+email);
                        %>

                    <td>
                        <form action="Adminresedit.jsp" method="post">
                            <li>
                            	<input type="hidden" value="${Remail }" name="email">
                                <input type="submit" value="Edit" id="uedit">
                            </li>

                        </form>
                        <form action="ResD" method="post">
                            <li>
                                <input type="hidden" value="${Remail }" name="email">
                                <input type="submit" name="del" value="delete" id="udel">
                            </li>
                        </form>
                    </td>
                    
                </tr>
                
                <% while(rss.next()){ %>
                <tr>
                    <td>
                        <%=rss.getString(1)+rss.getString(2)%>
                    </td>
                    <td>
                        <%=rss.getString(3)%>
                    </td>
                    <td>
                         <%=rss.getString(4)%>
                    </td>
                    <td>
                         <%=rss.getString(5)%>
                    </td>
                    <td>
                         <%=rss.getString(6)%>
                    </td>
                    <td>
                         <%=rss.getString(7)%>
                    </td>
                    <td>
                         <%=rss.getString(8)%>
                    </td>
                    <td>
                         <%=rss.getString(9)%>
                    </td>
                    <td>
                        <%=rss.getString(10)%>
                    </td>
                    <td>
                         <%=rss.getString(11)%>
                    </td>
						<%		//create session to handle delete part
                           		HttpSession AR2session = request.getSession();
                           		AR2session.setAttribute("R2email", rss.getString(3));
                        %>
                    <td>
                        <form action="Adminresedit.jsp">
                            <li>
                                <input type="hidden" value="${R2email }" name="email">
                                <input type="submit" value="Edit" id="uedit">
                            </li>

                        </form>
                        <form action="ResD" method="post">
                            <li>
                                <input type="hidden" value="${R2email }" name="email">
                                <input type="submit" name="del" value="delete" id="udel">
                            </li>
                        </form>
                    </td>
                </tr>
                <%} %>
            </table>

        </div>
        
        
        <!-- Package Data -->


        <div class="table_container2" id="table_container2">
            <a href="javascript:void(0)" class="closebtn" onclick="closePckgtable()">&times;</a>
            <table>
            
            <!-- Get Package Data -->
            <% 
		 	Connection conp = null;
		 	Statement stp = null;
		 	ResultSet rsp = null;
		 
				try{
					String sql3 = "select * from packagedata";
					conp = DBConnection.getConnection();
		            stp = conp.createStatement();
		            
		            rsp = sts.executeQuery(sql3);
		            
		            if(rsp.next()){
		            	System.out.println("done4!!");
		            }
		           
				} catch (Exception e) {
					
		            System.out.println("fetching error!! " + e);
		        }
			%>
                <thead>
                    <th>Pckage No.</th>
                    <th>Package Name</th>
                    <th>Duration </th>
                    <th>Pickup_location</th>
                    <th>Destionation(s)</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Action</th><br>
                </thead>

                <!-- getting first row from table -->
                <tr>
                    <td>
                        <%=rsp.getString(1)%>
                    </td>
                    <td>
                         <%=rsp.getString(2)%>
                    </td>
                    <td>
                         <%=rsp.getString(3)%>
                    </td>
                    <td>
                         <%=rsp.getString(4)%>
                    </td>
                    <td>
                         <%=rsp.getString(5)%>
                    </td>
                    <td>
                         <%=rsp.getString(6)%>
                    </td>
                    <td>
                         <%=rsp.getString(7)%>
                    </td>

                   		 <%		//create session to handle delete part
                           		HttpSession APsession = request.getSession();
                           		APsession.setAttribute("pckgno", rsp.getString(1));
                        %>

                    <td>
                        <form action="AdminPackageEdit.jsp" method="post">
                            <li>
                            	<input type="hidden" value="${pckgno }" name="pckgNo">
                                <input type="submit" value="Edit" id="pedit">
                            </li>

                        </form>
                        
                        <form action="PckgDel" method="post">
                            <li>
                                <input type="hidden" value="${pckgno }" name="pckgNo">
                                <input type="submit" name="del" value="Delete" id="pdel">
                            </li>
                        </form>
                    </td>
                    
                </tr>
                
                <% while(rsp.next()){ %>
                <tr>
                     <td>
                        <%=rsp.getString(1)%>
                    </td>
                    <td>
                         <%=rsp.getString(2)%>
                    </td>
                    <td>
                         <%=rsp.getString(3)%>
                    </td>
                    <td>
                         <%=rsp.getString(4)%>
                    </td>
                    <td>
                         <%=rsp.getString(5)%>
                    </td>
                    <td>
                         <%=rsp.getString(6)%>
                    </td>
                    <td>
                         <%=rsp.getString(7)%>
                    </td>

                   		<%		//create session to handle delete part
                           		HttpSession AP2session = request.getSession();
                           		AP2session.setAttribute("pckgno2", rsp.getString(1));
                        %>

                    <td>
                        <form action="AdminPackageEdit.jsp" method="post">
                            <li>
                            	<input type="hidden" value="${pckgno2 }" name="pckgNo">
                                <input type="submit" value="Edit" id="pedit">
                            </li>

                        </form>
                        <form action="PckgDel" method="post">
                            <li>
                                <input type="hidden" value="${pckgno2 }" name="pckgNo">
                                <input type="submit" name="del" value="delete" id="pdel">
                            </li>
                        </form>
                    </td>
                </tr>
              <%} %> 
            </table>
        </div>
        

    </div>

    <!-- Footer -->
    <footer>
        <div class="foot">
            <div class="column">
                <h1 class="col1">Sri Lanka at a Glance</h1>
                <br />
                <p class="col1">Sri Lanka, formerly known as Ceylon and officially the Democratic Socialist Republic of
                    Sri Lanka, is an island country in South Asia.
                    It lies in the Indian Ocean, southwest of the Bay of Bengal, and southeast of the Arabian Sea;
                    it is separated from the Indian subcontinent by the Gulf of Mannar and the Palk Strait.
                </p>
                <br />
            </div>
            <div class="column"><a href="https://www.tripadvisor.com/"><img class="tripA" src="img/TA.png"
                        alt="sliit.lk"></a></div>
            <div class="column" id="third">
                <address>No: 170/8,<br /> “Saru Uyana”,<br />New Kandy Road,<br />Malabe,<br /> Sri Lanka.<br />
                </address><br />
                <br />
                <p>Tel: +94 11 754 8561<br />Mobile: +94 71 823 5478<br />OR<br /></p>
                <a href="mailto:email@example.com">
                    <h3>E-mail us</h3>
                </a>
            </div>
        </div>
        
        
    </footer>

</body>

</html>
</html>
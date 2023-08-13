<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %> 
    <%@ page import="DBUtil.DBConnection" %>

<html>

<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="./css/adminresedit.css">
    <link rel="stylesheet" href="./css/headerfooter.css">
    <title>User Reservation Edit</title>
</head>

<body>
    <!-- header -->
    <div class="header">
        <a href=""><img class="logo" src="./img/theLogo.png" alt=""> </a>
    </div>
    <div id="mySidenav" class="sidenav">
        <a href="#">About Us</a>
        <a href="#">Packages</a>
        <a href="#">Destionation</a>
        <a href="#">Contact Us</a>
    </div>
    			                       
           <% 
                 Connection con = null;
     			 PreparedStatement st = null;
                 ResultSet rs = null;

             
                    try{
                        String sql = "select * from resdata where email=?";
                        con = DBConnection.getConnection();
                        st = con.prepareStatement(sql);
                        
                        String  mail = request.getParameter("email");
                            
                        st.setString(1, mail);
                        
                        rs = st.executeQuery();
                        if(rs.next()){
                            System.out.println("done3!!");
                        }
                       
                    } catch (Exception e) {
                        
                        System.out.println("fetching error!! " + e);
                    }
            %>

    <!-- controal form -->

    <div class="user_handle2">
        <div class="photo" style="background-image: url(#);
                                                background-size: cover;">
        </div>

        <div class="Ares_edit">
            <form action="AresEdit" method="post">
                <ul>
                    <li>
                        <label>First Name :</label>
                        <input type="text" value="<%=rs.getString(1)%>" name="fname">
                    </li>
                    <li>
                        <label>Last Name :</label>
                        <input type="text" value="<%=rs.getString(2)%>" name="lname">
                    </li>
                    <li>
                        <label>Contact No. : </label>
                        <input type="text" value="<%=rs.getString(11)%>" name="mobile">
                    </li>
                    <li>
                        <label>Country : </label>
                        <input type="text" value="<%=rs.getString(4)%>" name="country">
                    </li>
                    <li>
                        <label>Arrival Time : </label>
                        <input type="text" value="<%=rs.getString(5)%>" name="adate">
                    </li>
                    <li>
                        <label>PickUp Date :</label>
                        <input type="text" value="<%=rs.getString(6)%>" name="pdate">
                    </li>
                    <li>
                        <label>No of People :</label>
                        <input type="text" value="<%=rs.getString(7)%>" name="people">
                    </li>
                    <li>
                        <label>Package :</label>
                        <input type="text" value="<%=rs.getString(8)%>" name="pckg">
                    </li>
                    <li>
                        <label>Additional Note :</label>
                        <input type="text" value="<%=rs.getString(9)%>" name="note">
                    </li>
                    <li>
                        <label>Status :</label>
                        <input type="text" value="<%=rs.getString(10)%>" name="status">
                    </li>
                    <li>
                    	<input type="hidden" value="<%=rs.getString(3)%>" name="email">
                        <input type="submit" value="Update" id="updateA">
                    </li>
                </ul>
            </form>
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
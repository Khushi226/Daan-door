<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="org.postgresql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<% 


String type="" ; 
ResultSet rs = null ;
String sql="";
try { 
Class.forName("org.postgresql.Driver");			// load the driver

String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=ntplupl";			// connection url
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement() ; 

type = request.getParameter("type") ; 


if (type.equals("oldage") ) {
 sql = "select name,address,landmark,district,state,pincode,mobile,email, donation,donation_other,doa,avail_from,avail_to from oldage order by doa,avail_from " ; 
}else if (type.equals("orphanage") ) {
 sql = "select name,address,landmark,district,state,pincode,mobile,email, donation,donation_other,doa,avail_from,avail_to from orphanage order by doa,avail_from " ; 
}else if (type.equals("animal") ) {
 sql = "select name,address,landmark,district,state,pincode,mobile,email, donation,donation_other,doa,avail_from,avail_to from animal order by doa,avail_from " ; 
}else if (type.equals("volunteer") ) {
 sql = "select name,address,district,state,pincode,mobile,email,educational_background,occupation,volunteering_area,volunteering_activities,"+ 
"doa,avail_from,avail_to  from volunteer order by doa,avail_from " ; 
}else {
 sql = "select name,address,landmark,district,state,pincode,mobile,email, donation,donation_other,doa,avail_from,avail_to from rural order by doa,avail_from " ; 
}
System.out.println(sql) ; 
 rs = stmt.executeQuery(sql) ; 


 }
catch(Exception e) { 
e.printStackTrace() ; 
}

%>


<html><head><title>दान@DOOR</title></head><body>
<center><h2>List of Donor to Visit for Collection : <%=type %> </h2>
<table border="1">
<tr>
<% 
if (type.equals("volunteer") ) { %>
<th> Donor Name
<th> Address
<th> District
<th> State
<th> Mobile
<th> Education
<th> Occupation
<th> Volunteering Area
<th> Volunteering Activities
<th> Available on
<th> Time
<% } else { %> 

<th> Donor Name
<th> Address
<th>LandMark
<th> District
<th> State
<th> Mobile
<th> Donation
<th> Available on
<th> Time

<% }

if ( rs  != null ) { 
	while(rs.next() ) { 
if (type.equals("volunteer") ) { 
%> 
	<tr>
	<td>  <%=rs.getString(1) %>  </td>
	<td>  <%=rs.getString(2) %>  </td>
	<td>  <%=rs.getString(3) %>  </td>
	<td>  <%=rs.getString(4) %>  </td>
	<td>  <%=rs.getString(6) %>  </td>
	<td>  <%=rs.getString(8) %>  </td>
	<td>  <%=rs.getString(9) %>  </td>
	<td>  <%=rs.getString(10) %>  </td>
	<td>  <%=rs.getString(11) %>  </td>
	<td>  <%=rs.getString(12) %>  </td>
	<td>  <%=rs.getString(13) %> -<%=rs.getString(14) %> </td>

<% } else { %> 
	<tr>
	<td>  <%=rs.getString(1) %>  </td>
	<td>  <%=rs.getString(2) %>  </td>
	<td>  <%=rs.getString(3) %>  </td>
	<td>  <%=rs.getString(4) %>  </td>
	<td>  <%=rs.getString(5) %>  </td>
	<td>  <%=rs.getString(7) %>  </td>
	<td>  <%=rs.getString(9) %>  </td>
	<td>  <%=rs.getString(11) %>  </td>
	<td>  <%=rs.getString(12) %> -<%=rs.getString(13) %> </td>

	</tr>
<%  }	} 
    }
	else { 
		out.println("No Row Found") ;
	}
%>
</table>
 </center>
</body></html>
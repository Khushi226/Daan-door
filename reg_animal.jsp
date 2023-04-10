<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.postgresql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>

<% 

/*
CREATE TABLE Persons
(
 name character varying(100),
  address character varying(200),
  landmark character varying(100),
  district character varying(50),
  state character varying(50),
  pincode numeric(6,0),
  mobile character varying(10),
  email character varying(100),
  donation character varying(100),
  donation_other character varying(100),
  doa date,
  avail_from character varying(10),
  avail_to character varying(10) 
 
)
*/ 

try { 
Class.forName("org.postgresql.Driver");			// load the driver

String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=ntplupl";			// connection url
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement() ; 

String pName = request.getParameter("name") ; 
String address= request.getParameter("address") ;
String landmark= request.getParameter("landmark") ;
String district= request.getParameter("district") ;
String state= request.getParameter("state") ;
String pin= request.getParameter("pincode") ; 
String mobile= request.getParameter("num") ; 
String eMail= request.getParameter("email") ; 
String donation= request.getParameter("ocp") ; 
String donation_other= request.getParameter("donate") ; 
String doa= request.getParameter("doa") ; 
String avail_f= request.getParameter("f_time") ; 
String avail_t= request.getParameter("t_time") ; 


String sql = "insert into animal (name,address,landmark,district,state,pincode,mobile,email, " +
"donation,donation_other,doa,avail_from,avail_to) " + 
"values ( '" + pName + "', '" + address + "' , '" + landmark+"','"+district+"','"+ state + "','" +pin+"', '" +mobile+"','"+ eMail+"','"+
donation+"','"+donation_other+"','"+doa+"','"+avail_f+"','"+avail_t+"' ) " ; 

System.out.println(sql) ; 
stmt.executeUpdate(sql) ; 


 }
catch(Exception e) { 
e.printStackTrace() ; 
}

%>


<html><head><title>Registration</title></head><body><h1>Registration Status</h1>

<p><b>Record Saved Successfully</b> <%=request.getParameter("name")%> 
 
</p></body></html>
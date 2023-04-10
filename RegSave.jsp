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
 name varchar(100) , 
 dob  date , 
 age  numeric(2,0),
 gender char(1),
 P_mobile  varchar(10) ,
 S_mobile  varchar(10) ,
 p_email  varchar(100) ,
 p_address varchar(200) , 
 c_address varchar(200) , 
 c_pincode  numeric(6,0), 
 uid  varchar(12) , 
 occupation varchar(100) ,  
 h_name varchar(100) , 
 h_address  varchar(100) , 
 h_pincode	 varchar(6) , 
 res_avail_from varchar(10),
 res_avail_to varchar(10),
 hos_avail_from varchar(10),
 hos_avail_to varchar(10) 
 
)
*/ 

try { 
Class.forName("org.postgresql.Driver");			// load the driver

String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=ntplupl";			// connection url
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement() ; 

String pName = request.getParameter("name") ; 
String dob= request.getParameter("dob") ; 
String age= request.getParameter("age") ;
String gender= request.getParameter("gender") ;

String p_mobile= request.getParameter("num") ; 
String s_mobile= request.getParameter("num2") ;
String eMail= request.getParameter("email") ; 
String p_address= request.getParameter("p_address") ; 
String c_address= request.getParameter("c_address") ;
String c_pin= request.getParameter("c_pincode") ; 
String aadhaar= request.getParameter("uid") ; 
String occupation= request.getParameter("ocp") ; 
String h_name= request.getParameter("hospital_name") ; 
String h_address= request.getParameter("h_address") ; 
String h_pin= request.getParameter("h_pincode") ; 
String r_avail_f= request.getParameter("rf_time") ; 
String r_avail_t= request.getParameter("rt_time") ; 
String h_avail_f= request.getParameter("hf_time") ; 
String h_avail_t= request.getParameter("ht_time") ; 



String sql = "insert into persons (name,dob,age,gender,p_mobile,s_mobile,p_email,p_address,c_address,c_pincode, " +
"uid,occupation,h_name,h_address,h_pincode,res_avail_from,res_avail_to,hos_avail_from,hos_avail_to) " + 
"values ( '" + pName + "', '" + dob + "' , '" + age+"','"+gender+"','"+ p_mobile + "', '" +s_mobile+"','"+ eMail+"','"+p_address+"','"+c_address+"','"+c_pin+"','" +
aadhaar+"','"+occupation+"','"+h_name+"','"+h_address+"','"+h_pin+"','"+r_avail_f+"','"+r_avail_t+"','"+h_avail_f+"','"+h_avail_t+"' ) " ; 

System.out.println(sql) ; 
stmt.executeUpdate(sql) ; 
out.println("<html><head><title>Registration</title></head><body><h1>Registration Status</h1>");

out.println("<p><b>Record Saved Successfully</b>"+request.getParameter("name")) ; 
out.println("</p></body></html>") ;

 }
catch(Exception e) { 
e.printStackTrace() ; 
}

%>


<html><head><title>Registration</title></head><body><h1>Registration Status</h1>

<p><b>Record Saved Successfully</b> <%=request.getParameter("name")%> 
 
</p></body></html>




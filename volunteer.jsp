<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
String dob = request.getParameter("dob") ;
String address= request.getParameter("address") ;
String district= request.getParameter("district") ;
String state= request.getParameter("state") ;
String pin= request.getParameter("pincode") ; 
String mobile= request.getParameter("num") ; 
String eMail= request.getParameter("email") ; 
String edu_bg= request.getParameter("edu") ; 
String occupation= request.getParameter("ocp") ; 
String v_area= request.getParameter("area") ; 
String v_activities= request.getParameter("v_activities") ; 
String doa= request.getParameter("avail_days") ; 
String avail_f= request.getParameter("f_time") ; 
String avail_t= request.getParameter("t_time") ; 


String sql = "insert into volunteer (name,dob,address,district,state,pincode,mobile,email,educational_background, " +
"occupation,volunteering_area,volunteering_activities,doa,avail_from,avail_to) " + 
"values ( '" + pName + "','"+dob+"', '" + address + "' , '"+district+"','"+ state + "','" +pin+"', '" +mobile+"','"+ eMail+"','"+edu_bg+"','"+
occupation+"','"+v_area+"','"+v_activities+"','"+doa+"','"+avail_f+"','"+avail_t+"' ) " ; 

System.out.println(sql) ; 
stmt.executeUpdate(sql) ; 

 }

catch(Exception e)
 { 
e.printStackTrace() ; 
}

%>


<html><head><title>Registration</title></head><body><h1>Registration Status</h1>

<p><b>Record Saved Successfully</b>
<%=request.getParameter("name")%> 
 
</p></body></html>
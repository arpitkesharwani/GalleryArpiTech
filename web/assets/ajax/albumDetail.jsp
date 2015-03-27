<%-- 
    Document   : pro1
    Created on : Feb 21, 2015, 6:51:57 PM
    Author     : Arpit Kesharwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<s:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/gallery" user="root" password="root"/>
<% String albumName=request.getParameter("albumName");
   String albumDate=request.getParameter("albumDate");
   String albumCover=request.getParameter("albumCover");
   String albumDetails=request.getParameter("albumDetail");
%>




<!DOCTYPE html>
<div class="cbp-l-inline" style="background: url(assets/img/10.png) repeat;">
    <div class="cbp-l-inline-left">
        <img src="<%= albumCover%>" alt="Dashboard" class="cbp-l-project-img">
    </div>

    <div class="cbp-l-inline-right">
        <div class="cbp-l-inline-title"><%= albumName%></div>
        <div class="cbp-l-inline-subtitle"><%= albumDate%></div>
        <div class="cbp-l-inline-desc"><%=albumDetails%></div>
        <a href="PaginationServlet?albumName=<%= albumName%>&albumDate=<%= albumDate%>&albumDetails=<%= albumDetails%>" target="_blank" class="cbp-l-inline-view">VIEW ALBUM</a>
    </div>
</div>

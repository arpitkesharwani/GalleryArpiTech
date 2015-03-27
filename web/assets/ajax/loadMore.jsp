<%-- 
    Document   : locadMore
    Created on : Feb 22, 2015, 5:02:22 PM
    Author     : Arpit Kesharwani
--%>
<% 
    String lastAlbumDate = request.getParameter("lastAlbumDate");
    HttpSession s=request.getSession(true);     
    s.setAttribute("lastAlbumDate",lastAlbumDate);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<s:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/gallery" user="root" password="root"/>
<s:query var="u" sql="SELECT * FROM album WHERE albumDate <'${sessionScope.lastAlbumDate}' ORDER BY albumDate DESC LIMIT 12"/>

<!DOCTYPE html>

<div class="cbp-loadMore-block1">
    <c:forEach items="${u.rows}" var="e" > 
        <li class="cbp-item print motion">
            <a href="assets/ajax/albumDetail.jsp?albumName=${e.albumName}&albumCover=${e.albumCover}&albumDate=${e.albumDate}" class="cbp-caption cbp-singlePageInline" data-title="World Clock Widget<br>by Paul Flavius Nechita">
                <div class="cbp-caption-defaultWrap">
                    <img src="${e.albumCover}" alt="" width="100%">
                </div>
                <div class="cbp-caption-activeWrap">
                    <div class="cbp-l-caption-alignLeft">
                        <div class="cbp-l-caption-body">
                            <div class="cbp-l-caption-title">${e.albumName} </div>
                            <div class="cbp-l-caption-desc">${e.albumDate}</div>
                        </div>
                    </div>
                </div>
            </a>
        </li>
    </c:forEach>    
</div>


<div class="cbp-loadMore-block2">
 

</div>
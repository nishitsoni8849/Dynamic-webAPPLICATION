<%@page import="com.dao.ProductDao"%>
<%@ include file="seller_header.jsp" %>
<%
	ProductDao.deleteProduct(Integer.parseInt(request.getParameter("pid")), u.getUid());
	response.sendRedirect("seller_view_product.jsp");
%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%
	int uid=Integer.parseInt(request.getParameter("uid"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	CartDao.RemoveFromCart(uid, pid);
	List<Cart> list=CartDao.getCartByUid(uid);
	session.setAttribute("cart_count",list.size());
	response.sendRedirect("cart.jsp");
%>
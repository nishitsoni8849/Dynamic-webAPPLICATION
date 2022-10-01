<%@page import="com.bean.Wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.WishlistDao"%>
<%
	int uid=Integer.parseInt(request.getParameter("uid"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	WishlistDao.RemoveFromWishlist(uid, pid);
	List<Wishlist> list=WishlistDao.getWishlistByUid(uid);
	session.setAttribute("wishlist_count", list.size());
	response.sendRedirect("wishlist.jsp");
%>
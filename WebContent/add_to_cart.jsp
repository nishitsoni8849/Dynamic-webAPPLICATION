<%@page import="java.util.List"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%
	int uid=Integer.parseInt(request.getParameter("uid"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	Product p=ProductDao.getProduct(pid);
	int product_price=p.getProduct_price();
	int total_price=p.getProduct_price();
	Cart c=new Cart();
	c.setUid(uid);
	c.setPid(pid);
	c.setProduct_price(product_price);
	c.setTotal_price(total_price);
	CartDao.addToCart(c);
	List<Cart> list=CartDao.getCartByUid(uid);
	session.setAttribute("cart_count",list.size());
	response.sendRedirect("cart.jsp");
%>
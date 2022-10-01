<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
   <head>
   </head>
   <body class="sub_page">
      <div class="hero_area">
      </div>
      <!-- inner page section -->
      <section class="inner_page_head">
         <div class="container_fuild">
            <div class="row">
               <div class="col-md-12">
                  <div class="full">
                     <h3>Product Grid</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end inner page section -->
      <!-- product section -->
      <section class="product_section layout_padding">
         <div class="container">
            <div class="heading_container heading_center">
               <h2>
                  <span>Product Details</span>
               </h2>
            </div>
            <div class="row">
            
            	<%
            		Product p=ProductDao.getProduct(Integer.parseInt(request.getParameter("pid")));
            		boolean flag=WishlistDao.checkWishlist(u.getUid(), p.getPid());
            		boolean flag1=CartDao.checkCart(u.getUid(), p.getPid());
            		
            		
            	%>
               <div class="col-sm-6 col-md-4 col-lg-3">
                  <div class="box">
                     <div class="option_container">
                     
                     	<%
                     		if(session!=null)
                     		{
                     			if(session.getAttribute("u")!=null)
                     			{
                     	%>
                        <div class="options">
                        
                        	<%
                        		if(flag==true)
                        		{
                        	%>
                        			<a href="remove_from_wishlist.jsp?pid=<%=p.getPid() %>&uid=<%=u.getUid() %>" class="option1">
		                           		Remove From WishList
		                           </a>
                        	<%		
                        		}
                        		else
                        		{
                        	%>
                        			<a href="add_to_wishlist.jsp?pid=<%=p.getPid() %>&uid=<%=u.getUid() %>" class="option1">
		                           		Add To WishList
		                           </a>
                        	<%		
                        		}
                        	%>
                           
                          <%
                        		if(flag1==true)
                        		{
                        	%>
                        			<a href="remove_from_cart.jsp?pid=<%=p.getPid() %>&uid=<%=u.getUid() %>" class="option1">
		                           		Remove From Cart
		                           </a>
                        	<%		
                        		}
                        		else
                        		{
                        	%>
                        			<a href="add_to_cart.jsp?pid=<%=p.getPid() %>&uid=<%=u.getUid() %>" class="option1">
		                           		Add To Cart
		                           </a>
                        	<%		
                        		}
                        	%>
                        </div>
                        <% 	}
                     		else
                        	{
                        %>
                        <div class="options">
                           <a href="login.jsp" class="option1">
                           Login For More
                           </a>
                           
                        </div>		
                        <%	
                        	}
                     	}
                        %>
                     </div>
                     <div class="img-box">
                        <img src="product_images/<%=p.getProduct_image()%>" alt="">
                     </div>
                     
                  </div>
               </div>
               <div class="col-sm-6 col-md-4 col-lg-3">
                  <div class="box">
                     <div class="detail-box">
                        <h5>
                           <%=p.getProduct_type() %>
                        </h5>
                     </div>
                     <div class="detail-box">
                        <h6>
                           Price : <%=p.getProduct_price() %>
                        </h6>
                     </div>
                     <div class="detail-box">
                        <h6>
                          Detail : <%=p.getProduct_desc() %>
                        </h6>
                     </div>
                     <div class="detail-box">
                        <h6>
                           Size : <%=p.getProduct_size() %>
                        </h6>
                     </div>
                  </div>
               </div>
               
               
            </div>
         </div>
      </section>
      <!-- end product section -->
      <!-- footer section -->
      <footer class="footer_section">
         <div class="container">
            <div class="row">
               <div class="col-md-4 footer-col">
                  <div class="footer_contact">
                     <h4>
                        Reach at..
                     </h4>
                     <div class="contact_link_box">
                        <a href="">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>
                        Location
                        </span>
                        </a>
                        <a href="">
                        <i class="fa fa-phone" aria-hidden="true"></i>
                        <span>
                        Call +01 1234567890
                        </span>
                        </a>
                        <a href="">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <span>
                        demo@gmail.com
                        </span>
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 footer-col">
                  <div class="footer_detail">
                     <a href="index.jsp" class="footer-logo">
                     Famms
                     </a>
                     <p>
                        Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
                     </p>
                     <div class="footer_social">
                        <a href="">
                        <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                        <a href="">
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                        </a>
                        <a href="">
                        <i class="fa fa-linkedin" aria-hidden="true"></i>
                        </a>
                        <a href="">
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                        </a>
                        <a href="">
                        <i class="fa fa-pinterest" aria-hidden="true"></i>
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 footer-col">
                  <div class="map_container">
                     <div class="map">
                        <div id="googleMap"></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="footer-info">
               <div class="col-lg-7 mx-auto px-0">
                  <p>
                     &copy; <span id="displayYear"></span> All Rights Reserved By
                     <a href="https://html.design/">Free Html Templates</a><br>
         
                     Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                  </p>
               </div>
            </div>
         </div>
      </footer>
      <!-- footer section -->
      <!-- jQery -->
      <script src="js/jquery-3.4.1.min.js"></script>
      <!-- popper js -->
      <script src="js/popper.min.js"></script>
      <!-- bootstrap js -->
      <script src="js/bootstrap.js"></script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
   </body>
</html>
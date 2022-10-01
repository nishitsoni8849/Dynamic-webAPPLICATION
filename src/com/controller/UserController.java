package com.controller;

import java.io.IOException;
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("sign up"))
		{
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==false)
			{
				if(request.getParameter("password").equals(request.getParameter("cpassword")))
				{
					User u=new User();
					u.setFname(request.getParameter("fname"));
					u.setLname(request.getParameter("lname"));
					u.setEmail(request.getParameter("email"));
					u.setMobile(request.getParameter("mobile"));
					u.setAddress(request.getParameter("address"));
					u.setPassword(request.getParameter("password"));
					u.setUsertype(request.getParameter("usertype"));
					UserDao.insertUser(u);
					response.sendRedirect("login.jsp");
				}
				else
				{
					request.setAttribute("msg", "Password & Confirm Password Does Not Matched");
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("login"))
		{
			User u=UserDao.login(request.getParameter("email"), request.getParameter("password"));
			if(u==null)
			{
				request.setAttribute("msg", "Email or Password Is Incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else if(u.getUsertype().equals("user"))
			{
				List<Wishlist> list=WishlistDao.getWishlistByUid(u.getUid());
				List<Cart> list1=CartDao.getCartByUid(u.getUid());
				HttpSession session=request.getSession();
				session.setAttribute("u", u);
				session.setAttribute("wishlist_count", list.size());
				session.setAttribute("cart_count", list1.size());
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("u", u);
				request.getRequestDispatcher("seller_index.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("change password"))
		{
			HttpSession session=request.getSession();
			User u=(User)session.getAttribute("u");
			if(u.getPassword().equals(request.getParameter("old_password")))
			{
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
				{
					UserDao.changePassword(u.getEmail(), request.getParameter("new_password"));
					response.sendRedirect("logout.jsp");
				}
				else if(u.getUsertype().equals("user"))
				{
					request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
					request.getRequestDispatcher("change_password.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
					request.getRequestDispatcher("seller_change_password.jsp").forward(request, response);
				}
			}
			else if(u.getUsertype().equals("user"))
			{
				request.setAttribute("msg", "Old Password Does Not Matched");
				request.getRequestDispatcher("change_password.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
				request.getRequestDispatcher("seller_change_password.jsp").forward(request, response);
			}
		}
	}

}

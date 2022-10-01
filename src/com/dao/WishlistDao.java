package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Product;
import com.bean.Wishlist;
import com.util.ProjectUtil;

public class WishlistDao {

	public static void AddToWishlist(int uid,int pid)
	{
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="insert into wishlist(uid,pid) values(?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.setInt(2, pid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void RemoveFromWishlist(int uid,int pid)
	{
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="delete from wishlist where uid=? and pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.setInt(2, pid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Wishlist> getWishlistByUid(int uid)
	{
		List<Wishlist> list=new ArrayList<Wishlist>();
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="select * from wishlist where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Wishlist w=new Wishlist();
				w.setWid(rs.getInt("wid"));
				w.setUid(rs.getInt("uid"));
				w.setPid(rs.getInt("pid"));
				list.add(w);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static boolean checkWishlist(int uid,int pid)
	{
		boolean flag=false;
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="select * from wishlist where uid=? and pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.setInt(2, pid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}

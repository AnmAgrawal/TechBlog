/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.dao;

import java.sql.*;

//To get like count
public class LikeDao {

    Connection con;

    public LikeDao() {
    }

    public LikeDao(Connection con) {
        this.con = con;
    }

    //To store likes in Likes table
    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into likes(pid,uid) values(?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countPostLikes(int pid) {
        int count = 0;

        try {
            String query = "select count(*) from likes where pid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement ps = con.prepareStatement("select * from likes where pid=? and uid=?");
            ps.setInt(1,pid);
            ps.setInt(2,uid);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                f=true;
            }
        } catch (Exception e) {
        }
        return f;
    }
    
    public boolean disLike(int pid, int uid)
    {
        boolean f = false;
        try
        {
            PreparedStatement p = con.prepareStatement("delete from liked where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(2,uid);
            p.executeUpdate();
            f = true;
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}

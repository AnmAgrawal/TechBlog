package com.techblog.dao;

import com.techblog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //To insert user in database
    
    public boolean saveUser(User user)
    {
        boolean flag = false;
        try 
        {
            //user -> database
            String query = "insert into user(uname,email,password,contact,gender) values(?,?,?,?,?)";
            
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,user.getName());
            pst.setString(2,user.getEmail());
            pst.setString(3,user.getPassword());
            pst.setInt(4,user.getMobno());
            pst.setString(5,user.getGender());
            
            pst.executeUpdate();
            flag = true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public User getUserByEmailPassword(String email, String pass)
    {
        User user = null;
        
        try {
            
            String query = "select * from user where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next())
            {
                user = new User();
                user.setName(rs.getString("uname"));
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setMobno(rs.getInt("contact"));
                user.setDatTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                user.setPassword(rs.getString("password"));
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateUser(User user)
    {
        boolean f = false;
        try {
            
            String query = "update user set uname=?, email=?, password=?, contact=?, profile=? where id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setInt(4, user.getMobno());
            ps.setString(5, user.getProfile());
            ps.setInt(6, user.getId());
            
            ps.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByPostId(int uid)
    {
        User user = new User();
        try
        {
        String q = "select * from user where id=?";
        PreparedStatement ps = con.prepareStatement(q);
        ps.setInt(1, uid);
        
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
            user.setName(rs.getString("uname"));
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setMobno(rs.getInt("contact"));
                user.setDatTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                user.setPassword(rs.getString("password"));
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
        
    }
}

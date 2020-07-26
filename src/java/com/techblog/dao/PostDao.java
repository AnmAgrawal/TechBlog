package com.techblog.dao;

import com.techblog.entities.Cateogry;
import com.techblog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Cateogry> getAllCateogry() {
        ArrayList<Cateogry> catList = new ArrayList<>();

        try {

            String query = "select * from cateogry";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String desc = rs.getString("description");

                Cateogry c = new Cateogry(cid, cname, desc);
                catList.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catList;
    }

    public boolean savePost(Post post) {
        boolean flag = false;

        try {
            String q = "insert into post(pTitle, pContent, pcode, pPic, cid, id) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, post.getpTitle());
            ps.setString(2, post.getpContent());
            ps.setString(3, post.getpCode());
            ps.setString(4, post.getpPic());
            ps.setInt(5, post.getCid());
            ps.setInt(6, post.getUid());

            ps.executeUpdate();
            flag = true;

        } catch (Exception e) {

        }
        return flag;
    }

    public List<Post> getAllPost() {
        List<Post> posts = new ArrayList<>();

        try {
            PreparedStatement p = con.prepareStatement("select * from post");
            ResultSet rs = p.executeQuery();

            while (rs.next()) {
                Post po = new Post();
                po.setPid(rs.getInt("pid"));
                po.setpTitle(rs.getString("pTitle"));
                po.setpContent(rs.getString("pContent"));
                po.setpCode(rs.getString("pcode"));
                po.setpPic(rs.getString("pPic"));
                po.setPDate(rs.getTimestamp("pdate"));
                po.setCid(rs.getInt("cid"));
                po.setUid(rs.getInt("id"));

                posts.add(po);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return posts;
    }

    public List<Post> getPostByCatId(int catid) {
        List<Post> posts = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select * from post where cid=?");
            p.setInt(1, catid);
            ResultSet rs = p.executeQuery();

            while (rs.next()) {
                Post po = new Post();
                po.setPid(rs.getInt("pid"));
                po.setpTitle(rs.getString("pTitle"));
                po.setpContent(rs.getString("pContent"));
                po.setpCode(rs.getString("pcode"));
                po.setpPic(rs.getString("pPic"));
                po.setPDate(rs.getTimestamp("pdate"));

                po.setUid(rs.getInt("id"));

                posts.add(po);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public Post getPostById(int postId) {
        Post p = new Post();
        try {
            String que = "select * from post where pid=?";
            PreparedStatement pst = con.prepareStatement(que);
            pst.setInt(1, postId);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                p.setPid(rs.getInt("pid"));
                p.setpTitle(rs.getString("pTitle"));
                p.setpContent(rs.getString("pContent"));
                p.setpCode(rs.getString("pcode"));
                p.setpPic(rs.getString("pPic"));
                p.setPDate(rs.getTimestamp("pdate"));
                p.setCid(rs.getInt("cid"));
                p.setUid(rs.getInt("id"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
return p;
    }

}

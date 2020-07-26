/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.servlets;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.FileHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            
            // fetch
            
            String email = request.getParameter("uemail");
            String pass = request.getParameter("upass");
            String name = request.getParameter("uname");
            int mob = Integer.parseInt(request.getParameter("ucontact"));
            Part img = request.getPart("image");
            String imgName = img.getSubmittedFileName();
            out.println(email);
            // get user from session
            
            HttpSession se = request.getSession();
            User us = (User)se.getAttribute("currentUser");
            String im = us.getProfile();
            us.setEmail(email);
            us.setName(name);
            us.setPassword(pass);
            us.setMobno(mob);
            us.setProfile(imgName);
            
            //update database
            UserDao dao = new UserDao(ConnectionProvider.getConnect());
            boolean ans = dao.updateUser(us);
            
            if(ans)
            {
                out.print("updated");
                String old_path = request.getRealPath("/")+"profile_pics"+File.separator+im;
                String path = request.getRealPath("/")+"profile_pics"+File.separator+us.getProfile();
                
                if(!im.equals("default.png"))
                    FileHelper.deleteFile(old_path);
                
                if(FileHelper.saveFile(img.getInputStream(), path))
                {
                    
                    Message m = new Message("Profile Updated", "success", "alert-success");
                    se.setAttribute("msg",m);
                }
            }
            else
            {
                
                    Message m = new Message("Profile Not Updated", "error", "alert-danger");
                    se.setAttribute("msg",m);
            }
            
            response.sendRedirect("profile.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

<%-- 
    Document   : admin_page
    Created on : 21 Apr, 2020, 2:35:08 PM
    Author     : Santonio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Cateogry"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        
        <%@include file='navabr.jsp' %> 
        <!--end of navbar-->
<main>
            
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-3">
                        <!--cateogries-->

                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%
                                PostDao pd = new PostDao(ConnectionProvider.getConnect());
                                ArrayList<Cateogry> list1 = new ArrayList<Cateogry>();
                                list1 = pd.getAllCateogry();
                                for (Cateogry cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"> <%= cc.getCname()%></a>


                            <%
                                }
                            %>
                        </div>
                    </div>

                    <!--second column-->
                    <div class="col-md-9">
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h4 class="mt-2">Loading............</h4>
                        </div>

                        <div class="container-fluid" id="post-container">
                            
                        </div>
                    </div>
                </div>

            
        </main>

    </body>
</html>

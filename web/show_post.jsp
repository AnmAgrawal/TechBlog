<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Cateogry"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.User"%>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_404.jsp" %>
<!DOCTYPE html>
<%
    int pid = Integer.parseInt(request.getParameter("post_id"));
    PostDao pd = new PostDao(ConnectionProvider.getConnect());

    Post p = pd.getPostById(pid);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
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
        
        <style>
            .post-title
            {
                font-size: 40px;
                font-weight: 150;
            }
            .post-content
            {
                font-size: 25px;
                font-weight: 140;
            }
            .us
            {
                font-size: 14px;
            }
            body
            {
                background: url(img/show_blog.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v6.0"></script>
    </head>
    <body>

        <!--getting post id-->

        <!--navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-bath"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-briefcase"> </span>Hitech <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cateogries
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Python</a>
                            <a class="dropdown-item" href="#">Another python</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#" tabindex="-1" ><span class="fa fa-address-book"></span> Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="#" data-toggle="modal" data-target="#add-post-modal" tabindex="-1" ><span class="fa fa-asterisk"></span> New Post</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link " href="#" data-toggle="modal" data-target="#profile-modal" tabindex="-1" ><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet" tabindex="-1" ><span class="fa fa-address-book"></span> Log Out</a>
                    </li>

                </ul>
            </div>
        </nav>

        <!--end of navbar-->


        <!--main content body-->

        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card mt-4 h-100">
                            <div class="card-header primary-background text-white">
                                <h4 class="post-title"> <%= p.getpTitle()%></h4>
                            </div>

                            <div class="card-body h-100">

                                <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top" alt="blog_pics/tech.png" onerror="this.src='blog_pics/tech.png';">
                                <br>
                                <div class="row my-3 us">
                                    <div class="col-md-8">
                                       <%
                                       UserDao udao = new UserDao(ConnectionProvider.getConnect());
                                       User us = udao.getUserByPostId(p.getUid());
                                       %> 
                                        
                                        <p><a href="" > <%= us.getName() %></a> posted on </p>
                                    </div>
                                    <div class="col-md-4">
                                        <p> <%= DateFormat.getDateInstance().format(p.getPDate()) %></p>
                                    </div>
                                </div>
                                <p class="post-content"> <%= p.getpContent()%></p>
                                <div class="post-code">
                                <pre> <%= p.getpCode()%> </pre>
                                </div>
                            </div>

                            <div class="card-footer text-center primary-background">
                                
                                <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnect());
                                
                                %>
                                <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId()%>)" class="btn btn-outline-warning btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"> <%= ld.countPostLikes(p.getPid()) %></span></a>

                                <a href="#!" class="btn btn-outline-warning btn-sm"><i class="fa fa-commenting-o"></i> <span> 20</span></a>
                            </div>
                                <div class="card-footer">
                                <div class="fb-comments" data-href="http://localhost:8112/TechBlog/show_post.jsp?post_id=<%= p.getPid() %>" data-numposts="5" data-width=""></div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--end of main content body-->

        <!--profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title text-center" id="exampleModalLabel">TechBlogger</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="profile_pics/<%= user.getProfile()%>" class="img-fluid" style="max-width: 150px;">
                            <br>

                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--details-->

                            <div id="profile-details">
                                <table class="table table-hover table-dark">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Contact : </th>
                                            <td><%= user.getMobno()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered On : </th>
                                            <td><%= user.getDatTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none">
                                <h3 class="mt-3"> Edit Details</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table table-dark">
                                        <tr>
                                            <td scope="row">ID : </td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">Email : </td>
                                            <td> <input type="email" class="form-control" name="uemail" value="<%= user.getEmail()%>"</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">Name : </td>
                                            <td> <input type="text" class="form-control" name="uname" value="<%= user.getName()%>"</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">Password : </td>
                                            <td> <input type="text" class="form-control" name="upass" value="<%= user.getPassword()%>"</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">Contact : </td>
                                            <td> <input type="text" class="form-control" name="ucontact" value="<%= user.getMobno()%>"</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">Gender : </td>
                                            <td> <%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td scope="row"> Select new profile pic </td>
                                            <td> <div class="file-field input-field">
                                                    <div class="btn btn-danger">
                                                        <span>File</span>
                                                        <input name="image" type="file">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-danger">SAVE</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="profile-edit-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->

        <!--add mpost modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Provide Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" id="add-post-form" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>Select Cateogry</option>
                                    <%
                                        PostDao ps = new PostDao(ConnectionProvider.getConnect());

                                        ArrayList<Cateogry> clist = new ArrayList<Cateogry>();
                                        clist = ps.getAllCateogry();

                                        for (Cateogry c : clist) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getCname()%></option>
                                    <%
                                        }
                                    %>
                                </select>                                
                            </div>

                            <div class="form-group">
                                <input type="text" placeholder="Enter post title" name="ptitle" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter content" name="pcontent" class="form-control" style="height: 250px"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter code" name="pcode" class="form-control" style="height: 250px"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="file" name="pic"><label>Select your pic</label>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-danger">Post</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Understood</button>
                    </div>
                </div>
            </div>
        </div>
        <!--add post modal ends-->
    </body>
</html>

<%-- 
    Document   : login_page
    Created on : 13 Apr, 2020, 1:01:38 PM
    Author     : Santonio
--%>

<%@page import="com.techblog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        <%@include file="navabr.jsp" %>

        <main class="d-flex align-items-center primary-background" style="padding-top: 20px">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Login</p>

                            </div>
                            
                            <%
                            Message m = (Message)session.getAttribute("msg");
                            if(m!=null)
                            {
                            %>
                             <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            %>
                            
                           
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" required name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" name="pass" required id="exampleInputPassword1">
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-danger align">Login</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>

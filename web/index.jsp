

<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>

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

        <style>
            .banner-background
            {
                clip-path: polygon(30% 0%, 70% 0%, 100% 30%, 100% 89%, 70% 100%, 30% 85%, 2% 89%, 0% 30%);
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="navabr.jsp" %>

        <!--banner-->
        
        <div class="container-fluid p-0 m-0 b">


            <div class="jumbotron primary-background text-white">
                <div class="container">
                    
                    <h3 class="display-3">Technical Blog</h3>
                    <p class="display-8">welcome to world of technology
                        Computer programming is the process of designing and building an executable computer program to accomplish a specific computing result. Programming involves tasks such as: analysis, generating algorithms, profiling algorithms' accuracy and resource consumption, and the implementation of algorithms in a chosen programming language (commonly referred to as coding).[1][2] The source code of a program is written in one or more languages that are intelligible to programmers, rather than machine code, which is directly executed by the central processing unit. The purpose of programming is to find a sequence of instructions that will automate the performance of a task (which can be as complex as an operating system) on a computer, often for solving a given problem. The process of programming thus often requires expertise in several different subjects, including knowledge of the application domain, specialized algorithms, and formal logic.</p>
                    <button class="btn btn-outline-warning text-white btn-lg"> <span class="fa fa-coffee"></span> Start</button>
                    <a href="login_page.jsp" class="btn btn-outline-warning text-white btn-lg" > <span class="fa fa-flag fa-spin"></span> Login</a>
                
            </div>

</div>
        </div>

        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Learn about python for free in this techblog.</p>
                            <a href="#" class="btn btn-danger">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Learn about python for free in this techblog.</p>
                            <a href="#" class="btn btn-danger">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Learn about python for free in this techblog.</p>
                            <a href="#" class="btn btn-danger">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Learn about python for free in this techblog.</p>
                            <a href="#" class="btn btn-danger">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Learn about python for free in this techblog.</p>
                            <a href="#" class="btn btn-danger">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Learn about python for free in this techblog.</p>
                            <a href="#" class="btn btn-danger">Read more</a>
                        </div>
                    </div>
                </div>
                
                
            </div>
            
        </div>
    </body>

</html>

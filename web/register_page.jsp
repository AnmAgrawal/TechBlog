<%-- 
    Document   : register_page
    Created on : 13 Apr, 2020, 1:23:07 PM
    Author     : Santonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
        <%@include file="navabr.jsp" %>

        <main class="primary-background p-5" style="padding-bottom: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4>Register</h4>
                        </div>
                        <div class="card-body">
                            <form id="register" action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text" name="u_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="u_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="u_pass" class="form-control" id="exampleInputPassword1">
                                </div>

                                <div class="form-group">
                                    <label>Mobile</label>
                                    <input type="number" class="form-control" name="contact" id="contact">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <br>

                                    <input type="radio" value="Male" name="gender"> Male
                                    <input type="radio" value="Female"  name="gender"> Female
                                </div>

                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" name="check1" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree T&C</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait</h4>
                                </div>

                                <button id="sub" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <!--                        <div class="card-footer">
                                                    
                                                </div>-->
                    </div>
                </div>
            </div>
        </main>
        <script>
            $(document).ready(function () {
            console.log("loaded")

                    $('#register').on('submit', function(event) {

            event.preventDefault();
            let form = new FormData(this);
            $("#sub").hide();
            $("#loader").show();
            //send to register servlet

            $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                    console.log(data)

                            $("#sub").show();
                    $("#loader").hide();
                    if (data.trim() == "done")
                    {


                    swal("REgistration Successful... Redirecting to Login page")
                            .then((value) => {
                            window.location = "login_page.jsp"
                            });
                    }
                    else
                    {
                    swal(data);
                    }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    $("#sub").show();
                    $("#loader").hide();
                    swal("Something went wrong");
                    },
                    processData: false,
                    contentType: false
            });
            });
            });
        </script>
    </body>
</html>

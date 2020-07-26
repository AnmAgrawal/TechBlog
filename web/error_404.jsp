<%-- 
    Document   : exception
    Created on : 9 Apr, 2020, 9:53:35 PM
    Author     : Santonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Page Not found</title>
    </head>
    <body>
        <div class="container p-3 text-center">
            <img src="img/error_404.jpg" class="img-fluid"/>
        <h1 class="display-3">Sorry Page not found!</h1>
       Root cause-> <%= exception %>
        <a class="btn btn-primary" href="index.jsp">Home Page</a>
        </div>
    </body>
</html>

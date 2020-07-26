<%@page import="com.techblog.entities.User"%>
<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<head><link href="css/style.css" rel="stylesheet" type="text/css"/>
<script src="js/myjs.js" type="text/javascript"></script>
</head>
<div class="row">
    
<%
    
    User user = (User)session.getAttribute("currentUser");
PostDao pd = new PostDao(ConnectionProvider.getConnect());

int cid = Integer.parseInt(request.getParameter("cid"));

List<Post> li = new ArrayList<Post>();

if(cid==0)
{
    li = pd.getAllPost();
}
else
{
    li = pd.getPostByCatId(cid);
}

if(li.size() == 0)
{
    out.println("<h3 class='display-fluid text-center'>No Posts in this Cateogry.</h3>");
}
for(Post p : li)
{
%>

<div class="col-md-6">
    <div class="card">
        <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="blog_pics/tech.png" onerror="this.src='blog_pics/tech.png';">
 
        <div class="card-body">
            <h3> <%= p.getpTitle() %></h3>
            
        </div>
        
        <div class="card-footer text-center primary-background">
            <%
            LikeDao ld = new LikeDao(ConnectionProvider.getConnect());
            %>
            <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId()%>)" class="btn btn-outline-warning btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="link-counter"> <%= ld.countPostLikes(p.getPid()) %></span></a>
            <a href="show_post.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-warning btn-sm">Read More</a>
            <a href="#!" class="btn btn-outline-warning btn-sm"><i class="fa fa-commenting-o"></i> <span> 20</span></a>
        </div>
    </div>
</div>

<%
    }
    %>
</div>
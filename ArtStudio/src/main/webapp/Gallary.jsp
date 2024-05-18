<%@page import="model.GallaryDao"%>
<%@page import="model.GallaryDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>ArtStudio</title>
 <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-rose-100 to-teal-100">
<%@include file="includes/Navbar.jsp" %>
<section class="text-gray-600 body-font">
  <div class="container px-5 py-10 mx-auto">
	<h1 class="text-center text-5xl font-bold mb-10">Our Work</h1>
    <div class="flex flex-wrap -m-4">
	<%ArrayList<GallaryDto> data=(ArrayList<GallaryDto>)GallaryDao.fetchImage();
	for(GallaryDto g:data){
	%>
      <div class="lg:w-1/4 md:w-1/2 p-4 w-full" onclick="window.location.href='order'"> 
        <a class="block relative h-48 rounded overflow-hidden">
          <img alt="ecommerce" class="object-cover object-center w-full h-full block"    src="data:image/jpg;base64,<%=g.getBase64Image() %>">
        </a>
        <div class="mt-4">
          <h3 class="text-gray-500 text-xs tracking-widest title-font mb-1"><%=g.getImgType() %></h3>
          <h2 class="text-gray-900 title-font text-lg font-medium"><%=g.getImgTitle() %></h2>
         <!--  <p class="mt-1">$16.00</p> -->
        </div>
      </div>
	<%} %>
    </div>
  </div>
</section>


<%@include file="includes/footer.jsp" %>

</body>
</html>
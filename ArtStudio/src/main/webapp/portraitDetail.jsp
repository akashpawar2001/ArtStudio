<%@page import="model.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ArtStudio</title>
 <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-rose-100 to-teal-100">
<%@include file="includes/Navbar.jsp" %>
<%session = request.getSession(false); %>
<%if(session.getAttribute("AUTH") !=null){ %>
<div class="min-h-screen p-6  flex items-center justify-center">
  <div class="container max-w-screen-lg mx-auto">
    <form id="portraitForm" action="orderLink" method="post" enctype='multipart/form-data'>
      <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
        <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3 mb-10">
          <div class="text-gray-600">
            <p class="font-medium text-lg">Portrait Details</p>
            <p>Please fill out all the fields.</p>
          </div>

          <div class="lg:col-span-2">
            <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
              <div class="md:col-span-5">
                <p class=" mb-3">No of Faces</p>
                <div class="flex gap-5 items-center">
                <label>
                <input type="radio" id="face1" name="faces" class=" border mt-1 rounded px-4 bg-gray-50" value="single" /> Single Face
                </label>
                <label>
                <input type="radio" id="face2" name="faces" class=" border mt-1 rounded px-4 bg-gray-50" value="two" /> Two Faces
                </label>
                </div>
              </div>

              <div class="md:col-span-5 mt-2">
                 <p class=" mb-3">Portrait Type</p>
                <div class="flex gap-5 items-center">
                <label>
                <input type="radio" id="type1" name="type"  class=" border mt-1 rounded px-4 bg-gray-50" value="pencil" /> Pencil Sketch
                </label>
                <label>
                <input type="radio" id="type2" name="type" class=" border mt-1 rounded px-4 bg-gray-50" value="color" /> Color pencil sketch 
                </label>
                <label>
                <input type="radio" id="type3" name="type" class=" border mt-1 rounded px-4 bg-gray-50" value="watercolor" /> Water color sketch 
                </label>
                </div>
              </div>
			
              <div class="md:col-span-5 mt-3">
                <p class=" mb-3">Portrait Size</p>
                <div class="flex gap-5 items-center lg:flex-">
             
                <label>
                <input type="radio" name="size"  class=" border mt-1 rounded px-4 bg-gray-50" value="A1" /> A1
                </label>
             	  <label>
                <input type="radio" name="size"  class=" border mt-1 rounded px-4 bg-gray-50" value="A2" />A2
                  </label>
                  <label>
                <input type="radio" name="size"  class=" border mt-1 rounded px-4 bg-gray-50" value="A3" /> A3
                </label>
                  <label>
                <input type="radio" name="size"  class=" border mt-1 rounded px-4 bg-gray-50" value="A4" /> A4
                </label>
                </div>
              </div>

              <div class="md:col-span-2 mt-2">
                <label for="price">Price</label>
               <p> &#8377; <span id="price"></span></p>
               <input type="hidden" id="pricetag" name="price">
              </div>
             
             <div class="md:col-span-2 mt-2">
                <label for="img">Image File</label>
               <input type="file" id="img" name="file">
              </div>
             
            </div>
          </div>
        </div>
        
        <hr>
        
        <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3 mt-5">
          <div class="text-gray-600">
            <p class="font-medium text-lg">Personal Details</p>
            <p>Please fill out all the fields.</p>
          </div>

          <div class="lg:col-span-2">
            <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
              <div class="md:col-span-5">
                <label for="full_name">Full Name</label>
                <input type="text" name="fullName" id="full_name" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50"  placeholder="John doe"/>
              </div>

              <div class="md:col-span-5">
                <label for="email">Email Address</label>
                <input type="text" name="emailAddress" id="email" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" placeholder="email@domain.com" />
              </div>
				
				<div class="md:col-span-5">
                <label for="contact">Contact</label>
                <input type="text" name="contactNo" id="contact" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" placeholder="+9199223364566" />
              </div>
			
              <div class="md:col-span-5">
                <label for="address">Address / Street</label>
                <textarea name="deliveryAddress" id="address" class="border mt-1 rounded px-4 py-1 w-full bg-gray-50" placeholder="Address.." rows="5" ></textarea>
              </div>
              <div class="md:col-span-5 text-right">
                <div class="inline-flex items-end">
                  <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Make Payment</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>
<%}else{ %>
<%
response.sendRedirect("login.jsp");
} %>
<%@include file="includes/footer.jsp" %>
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("portraitForm");
    const priceDisplay = document.getElementById("price");
    const priceTag = document.getElementById("pricetag");
    priceDisplay.textContent=0;
    priceTag.value=0;
    let basePrice = 1000; // Set your base price here
    form.addEventListener("change", function() {
        const face = form.querySelector('input[name="faces"]:checked').value;
        const type = form.querySelector('input[name="type"]:checked').value;
        const size = form.querySelector('input[name="size"]:checked').value;
        let totalPrice = basePrice;

        // Adjust price based on the options selected
        if (face === "two") {
            totalPrice *= 2; // Double the price for two faces
        }
        if (type === "color") {
            totalPrice += 500; // Add extra cost for color pencil sketch
        }
        if (type === "watercolor") {
            totalPrice += 1000; // Add extra cost for watercolor sketch
        }
        // Adjust price based on size
        switch (size) {
            case "A1":
                totalPrice *= 1.5; // Example: Increase price by 50% for A1 size
                break;
            case "A2":
                totalPrice *= 1.2; // Example: Increase price by 20% for A2 size
                break;
            case "A3":
                totalPrice *= 1.1; // Example: Increase price by 10% for A3 size
                break;
            case "A4":
                // No adjustment needed for A4 size
                break;
            default:
                console.error("Invalid size selected");
        }

        priceDisplay.innerHTML =  totalPrice.toFixed(2);
        priceTag.value= totalPrice.toFixed(2);// Display price with 2 decimal places
    });
});

</script>
</html>
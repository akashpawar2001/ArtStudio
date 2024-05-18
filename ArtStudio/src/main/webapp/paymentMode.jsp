<%@page import="model.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ArtStudio</title>
 <script src="https://cdn.tailwindcss.com"></script>
</head>
<body  class="bg-gradient-to-r from-rose-100 to-teal-100">
<%@include file="includes/Navbar.jsp" %>
<%HttpSession session1=request.getSession(false);
if(session1.getAttribute("ISVALIDATE")!=null){
%>
<div class="container mx-auto py-10">
        <form action="checkout" method="post" class="max-w-xl mx-auto 
                                bg-white p-8 rounded 
                                shadow-lg">
            <div class="grid grid-cols-1 gap-6">
                <div>
                    <h3 class="text-lg font-semibold 
                               text-red-600 mb-4">
                        Payment
                    </h3>
                    <div class="mb-4">
                        <label for="cName"
                               class="block text-sm font-medium
                                      text-gray-700">
                            Name On Card:
                        </label>
                        <input type="text" id="cName" name="cardName"
                               placeholder="Enter card name"
                               required
                               class="mt-1 p-2 outline-none block w-full 
                                      border-gray-300 rounded-md 
                                      shadow-sm focus:ring-red-500
                                      focus:border-red-500">
                    </div>
                    <div class="mb-4">
                        <label for="cNumber"
                               class="block text-sm font-medium 
                                      text-gray-700">
                            Credit Card Number:
                        </label>
                        <input type="text" id="cNumber" name="cardNumber"
                               placeholder="Enter card number"
                               required
                               class="mt-1 p-2 outline-none block w-full 
                                      border-gray-300 rounded-md
                                      shadow-sm focus:ring-red-500
                                      focus:border-red-500">
                    </div>
                    <div class="flex justify-between mb-4">
                        <div class="w-1/2 mr-2">
                            <label for="expMonth"
                                   class="block text-sm font-medium
                                          text-gray-700">
                                Expiration Month:
                            </label>
                            <input type="text" id="expMonth"
                                   placeholder="MM" required
                                   class="mt-1 p-2 outline-none block w-full 
                                          border-gray-300 rounded-md
                                          shadow-sm focus:ring-red-500
                                          focus:border-red-500">
                        </div>
                        <div class="w-1/2 ml-2">
                            <label for="expYear"
                                   class="block text-sm 
                                          font-medium 
                                          text-gray-700">
                                Expiration Year:
                            </label>
                            <input type="text" id="expYear"
                                   placeholder="YYYY" required
                                   class="mt-1 p-2 outline-none block w-full 
                                          border-gray-300 
                                          rounded-md shadow-sm
                                          focus:ring-red-500 
                                          focus:border-red-500">
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="cvv"
                               class="block text-sm 
                                      font-medium 
                                      text-gray-700">
                            CVV:
                        </label>
                        <input type="text" id="cvv"
                               placeholder="Enter CVV"
                               required
                               class="mt-1 p-2 outline-none block w-full 
                                      border-gray-300 rounded-md
                                      shadow-sm focus:ring-red-500
                                      focus:border-red-500">
                                      <input type="hidden" name="invoiceID" id="invoiceGenerator">
                    </div>
                </div>
            </div>
            <input type="submit" value="Proceed to Checkout"
                   id="checkoutBtn"
                   class="mt-6 px-4 py-2 bg-red-600 text-white
                          rounded-md hover:bg-red-700">
        </form>
    </div>
    <%}else{ %>
    	<%response.sendRedirect("portraitDetail.jsp"); %>
    <%} %>
<%@include file="includes/footer.jsp" %>
</body>
<script type="text/javascript">
let invoice=document.getElementById("invoiceGenerator");
invoice.value= "INV" + Date.now();
</script>
</html>
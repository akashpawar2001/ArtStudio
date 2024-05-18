<%@page import="model.CheckoutDto"%>
<%@page import="model.OrderDao"%>
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
<body class="bg-gradient-to-r from-rose-100 to-teal-100 relative">
<%@include file="includes/Navbar.jsp" %>
<%HttpSession session1=request.getSession(false);
HttpSession session2=request.getSession(false);
if(session1.getAttribute("ISVALIDATE")!=null){
%>
<%if(session2.getAttribute("ORDERMSG")!=null){ %>
<div id="toast" class="w-[400px] fixed right-1 top-20 bg-green-100 border-l-4 border-green-500 text-green-700 p-4 rounded-lg">
    <p class="text-lg font-semibold">Order Status: Confirmed</p>
    <p>Your order has been successfully confirmed.</p>
</div>
<%}%>
<div id="printableArea" class="bg-white border rounded-lg shadow-lg px-6 py-10 max-w-md mx-auto mt-8 mb-5">
    <h1 class="font-bold text-2xl my-4 text-center text-black-600">Art Studio</h1>
    <hr class="mb-2">
    <%OrderDto dto=OrderDao.invoiceOrder();
    	CheckoutDto cDto=OrderDao.invoiceBill();%>
    <div class="flex justify-between mb-6">
        <h1 class="text-lg font-bold">Invoice</h1>
        <div class="text-gray-700">
            <div>Date: <%=cDto.getDate() %></div>
            <div>Invoice : <%=cDto.getPaymentInvoiceNumber() %></div>
        </div>
    </div>
    <div class="mb-8">
        <h2 class="text-lg font-bold mb-4">Bill To:</h2>
        <div class="text-gray-700 mb-2"><%=cDto.getCardOwnerName() %></div>
        <div class="text-gray-700 mb-2"><%=dto.getCustomerAddress() %></div>
        <div class="text-gray-700"><%=dto.getCustomerEmail() %></div>
    </div>
    <table class="w-full mb-8">
        <thead>
            <tr>
                <th class="text-left font-bold text-gray-700">Description</th>
                <th class="text-right font-bold text-gray-700">Amount</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-left text-gray-700"><%=dto.getOrderSketchType() %> sketch</td>
                <td class="text-right text-gray-700"><%=dto.getPortraitPrice() %></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="text-left font-bold text-gray-700">Total</td>
                <td class="text-right font-bold text-gray-700">&#8377; <%=dto.getPortraitPrice() %></td>
            </tr>
        </tfoot>
    </table>
    <div class="text-gray-700 mb-2">Thank you!</div>
    <div class="text-gray-700 text-sm">You Will Get Your Order Within Week.</div>
    <button type="button" class="bg-blue-500 rounded mt-3 px-2 text-white py-1 mr-2" onclick="window.location.href='home'">Go home</button>
    <button type="button" class="bg-purple-500 rounded mt-3 px-2 text-white py-1" onclick="printDiv('printableArea')">download print</button>
</div>
<%} else{%>
<%response.sendRedirect("home"); %>
<%} %>

<%@include file="includes/footer.jsp" %>
</body>
<script type="text/javascript">
setTimeout(()=>{
	document.getElementById("toast").classList.add("hidden")
},2000)

function printDiv(divId) {
     var printContents = document.getElementById(divId).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}

</script>
</html>
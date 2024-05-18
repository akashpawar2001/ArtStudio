package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CheckoutDto;
import model.OrderDao;
import model.OrderDto;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session1=req.getSession(false);
		OrderDto dto=(OrderDto)session1.getAttribute("LIST");
		System.out.println(dto);	
		String cardOwnerName=req.getParameter("cardName");
		String cardNumber=req.getParameter("cardNumber");
		String invoiceID=req.getParameter("invoiceID");
		CheckoutDto cDto=new CheckoutDto();
		cDto.setCardOwnerName(cardOwnerName);
		cDto.setCardNumber(cardNumber);
		cDto.setPaymentInvoiceNumber(invoiceID);
		
		
		int count1=OrderDao.checkoutTable(cDto);
		int count=OrderDao.orderTable(dto);
		
		if(count>0 && count1>0) {
			HttpSession session2=req.getSession();
			session2.setAttribute("ORDERMSG", "Order Confirm");
			resp.sendRedirect("invoice.jsp");
			
		}else {
			resp.sendRedirect("order");
		}
	}
}

package Controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.OrderDao;
import model.OrderDto;

@WebServlet("/orderLink")
@MultipartConfig(maxFileSize = 16177215)
public class OrderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sketchType=req.getParameter("type");
		String faces=req.getParameter("faces");
		String size=req.getParameter("size");
		Part file=req.getPart("file");
		double price=Double.parseDouble(req.getParameter("price"));
		
		String cName=req.getParameter("fullName");
		String cEmail=req.getParameter("emailAddress");
		String cContact=req.getParameter("contactNo");
		String cAddress=req.getParameter("deliveryAddress");
		
		
		OrderDto dto=new OrderDto();
		dto.setOrderSketchType(sketchType);
		dto.setOrderNoOfFaces(faces);
		dto.setPortraitSize(size);
		dto.setPortraitPrice(price);
		dto.setInputStream(file.getInputStream());
		dto.setCustomerName(cName);
		dto.setCustomerEmail(cEmail);
		dto.setCustomerContact(cContact);
		dto.setCustomerAddress(cAddress);
		
		RequestDispatcher rd=req.getRequestDispatcher("paymentMode.jsp");
		
		HttpSession session1=req.getSession();
		session1.setAttribute("ISVALIDATE", "validate");
		session1.setAttribute("LIST", dto);
		rd.forward(req, resp);
	}
}

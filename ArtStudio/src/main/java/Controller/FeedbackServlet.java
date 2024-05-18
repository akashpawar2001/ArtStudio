package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FeedbackDao;
import model.FeedbackDto;

@WebServlet("/feedbackLink")
public class FeedbackServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fName=req.getParameter("feedbackName");
		String fEmail=req.getParameter("feedbackEmail");
		String fMessage=req.getParameter("feedbackMessage");
		
		FeedbackDto fDto=new FeedbackDto();
		fDto.setFeedbackerName(fName);
		fDto.setFeedbackerEmail(fEmail);
		fDto.setFeedbackMessage(fMessage);
		
		int count = FeedbackDao.addFeedback(fDto);
		if(count>0) {
			resp.sendRedirect("home");
		}
	}
}

package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/home","/about","/gallary","/contact","/pricing","/order"})
public class NavServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
      
        switch (path) {
            case "/home":
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                break;
            case "/about":
                req.getRequestDispatcher("About-US.jsp").forward(req, resp);
               break;
            case "/gallary":
                req.getRequestDispatcher("Gallary.jsp").forward(req, resp); // Corrected typo
                break;
            case "/order":
                req.getRequestDispatcher("portraitDetail.jsp").forward(req, resp); // Corrected typo
                break;
            case "/contact":
                    req.getRequestDispatcher("contact.jsp").forward(req, resp);
                break;
            case "/pricing":
                    req.getRequestDispatcher("pricing.jsp").forward(req, resp); // Assuming pricing page exists
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}


package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.ConsumerPojo;
import models.SellerPojo;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ConsumerPojo consumerPojo = new ConsumerPojo();
    SellerPojo sellerPojo = new SellerPojo();
    HttpSession session = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String portid = request.getParameter("portId");
        String pass = request.getParameter("password");

        System.out.println("Role: " + role);
        System.out.println("Port ID: " + portid);
        System.out.println("Password: " + pass);

        // Handle consumer login
        if ("Consumer".equals(role)) {
            consumerPojo.setCon_port_id(Integer.parseInt(portid));
            consumerPojo.setCon_password(pass);
            consumerPojo.setRole(role);
            boolean auth_status = consumerPojo.LoginConsumer(consumerPojo);
            System.out.println("Consumer Auth Status: " + auth_status);

            if (auth_status) {
                session = request.getSession(); // Get or create a session
                session.setAttribute("userId", portid);
                session.setAttribute("role", role);
                String location = consumerPojo.getConsumerLocation(Integer.parseInt(portid));
                session.setAttribute("location", location);
                System.out.println(location);

                session.setMaxInactiveInterval(60 * 60); // Set session timeout
                System.out.println("Session ID: " + session.getId());
                System.out.println("User ID in session: " + session.getAttribute("userId"));
                System.out.println("Role in session: " + session.getAttribute("role"));
                response.sendRedirect("consumer_dashboard.jsp");
            } else {
                request.setAttribute("message", "Invalid Port ID, Password, or Role.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } 
        // Handle seller login
        else if ("Seller".equals(role)) {
            sellerPojo.setPort_id(Integer.parseInt(portid));
            sellerPojo.setPassword(pass);
            sellerPojo.setRole(role);
            boolean auth_status = sellerPojo.LoginSeller(sellerPojo);
            System.out.println("Seller Auth Status: " + auth_status);

            if (auth_status) {
                session = request.getSession(); // Get or create a session
                session.setAttribute("userId", portid);
                session.setAttribute("role", role);
                session.setMaxInactiveInterval(60 * 60); // Set session timeout
                System.out.println("Session ID: " + session.getId());
                System.out.println("User ID in session: " + session.getAttribute("userId"));
                System.out.println("Role in session: " + session.getAttribute("role"));
                response.sendRedirect("seller-dashboard.jsp");
            } else {
                request.setAttribute("message", "Invalid Port ID, Password, or Role.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } 
        // Invalid role handling
        else {
            request.setAttribute("message", "Invalid Role selected.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

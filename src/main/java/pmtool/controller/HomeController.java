package pmtool.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import pmtool.dao.UserDao;
import pmtool.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDao userDao;

	@RequestMapping("/")
	public String home() {

		return "home";
	}
	@RequestMapping("/home")
	public String homePage() {

		return "home";
	}

	@RequestMapping("/admin")
	public String admin() {

		return "admin";
	}

	@RequestMapping("/user")
	public String user() {

		return "user";
	}

	@RequestMapping("/register")
	public String register() {

		return "register";
	}

	@RequestMapping(path = "/registerform", method = RequestMethod.POST)
	public String processForm(User user) {

		userDao.createUser(user);
		return "login";

	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping(value="/loginProcess",method = RequestMethod.POST)
	public String processRequest(@ModelAttribute("user") User user,HttpServletRequest request, HttpServletResponse response, Model m) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String usertype=request.getParameter("usertype");
            user = userDao.getUserByEmailAndPassword(email, password,usertype);
            HttpSession httpSession = request.getSession();
            if(user==null)
            {
               
               httpSession.setAttribute("message","Invalid Details !! Try with another one");
               return "login";
            }else
            {
                
                //login
                httpSession.setAttribute("current-user",user);
                
                if(user.getUsertype().equals("manager"))
                {
                    //admin.jsp
                	m.addAttribute("username",user.getName());
                    return "redirect:/mdashboard";
                    
                }else if (user.getUsertype().equals("developer")){
                    //normal.jsp
                	m.addAttribute("id", user.getId());
                	m.addAttribute("username",user.getName());
                    return "redirect:/ddashboard";
                    
                }else
                {
                   System.out.println("We have not identified user type"); 
                }
                
                
                return "register";
              
                
            }
           
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
            HttpSession httpSession = request.getSession();
            httpSession.removeAttribute("current-user");
            return "redirect:/login";
	}
	
}

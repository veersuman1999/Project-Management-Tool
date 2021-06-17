package pmtool.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.util.NestedServletException;

import pmtool.dao.ProjectDao;
import pmtool.dao.UserDao;
import pmtool.entities.Project;
import pmtool.entities.User;

@Controller
public class ManagerController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ProjectDao projectDao;
	@RequestMapping("/mdashboard")
	public String managerDashboard(Model m,@ModelAttribute User user){
		List<User> users=userDao.getDeveloper();
		List<User> users1=userDao.getDeveloperbyPId();
		int usersize=0;
		try {
			
			usersize=users.size();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		List<Project> projects=projectDao.getProjects();
		List<Project> projectPending=projectDao.getPendingProject();
		int projectsize=0;
		try {
			
			projectsize=projects.size();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
    	m.addAttribute("username",user.getName());
    	m.addAttribute("user",users);
    	m.addAttribute("usize",usersize);
    	m.addAttribute("psize",projectsize);
    	m.addAttribute("project", projects);
    	m.addAttribute("projectPending", projectPending);
    	m.addAttribute("user1",users1);    
		return "mdashboard";
	}
	@RequestMapping("/data_error_page")
	public String dataErrorShow() {
		return "data_error_page";
		}
	
	@RequestMapping(value="/addProject",method = RequestMethod.POST)
	public String addProject(@ModelAttribute("project") Project project,HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession httpSession = request.getSession();
		System.out.println(project);
		//int pId=Integer.parseInt(request.getParameter(null))
		//String status=request.getParameter("status");
		projectDao.createProject(project);
		System.out.println();
		httpSession.setAttribute("message", "Project added successfully !! ");
		
		return "redirect:/mdashboard";
	}
	
	@RequestMapping("/delete/{pId}")
	public String deleteProject(@PathVariable("pId") int pId)
	{
		this.projectDao.deleteProject(pId);
		return "redirect:/mdashboard";
	}
	
	@RequestMapping("/update/{pId}")
	public String updateProject(@PathVariable("pId") int pId, Model model)
	{
		Project project=this.projectDao.getProject(pId);
		model.addAttribute("project",project);
		return "update_project";
	}
	
	@RequestMapping("/updateuserproject/{id}")
	public String updateuserproject(@PathVariable("id") int id,Model model) {
		User user=this.userDao.getUser(id);
		List<Project> projects=projectDao.getProjects();
		model.addAttribute("user", user);
		model.addAttribute("project", projects);
		return "update_user_project";
	}
	
	@RequestMapping(path = "/adduserproject", method = RequestMethod.POST)
	public String adduserproject(@ModelAttribute("user") User user,BindingResult result, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, NestedServletException
			{
				
				HttpSession httpSession = request.getSession();
				
				//int pId=Integer.parseInt(request.getParameter("pId"));
					//Project project=new Project();
					//project = projectDao.getProject(pId);
					//user.setProject(project);
					userDao.createUser(user);
					if(result.hasErrors()) {
						return "mdashboard";
					}
				
				System.out.println(user);
				httpSession.setAttribute("message", "Project assigned successfully !! ");
				return "redirect:/mdashboard";
	}
	
	@ExceptionHandler({DataIntegrityViolationException.class})
	public String exceptionHandler(HttpServletRequest request,HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("message", "Cannot Delete because User is Assigned to that Project !! ");
		return "redirect:/mdashboard";
	}
	
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value=Exception.class)
	public String exceptionHandlerGeneric() {
		return "data_error_page";
	}
}


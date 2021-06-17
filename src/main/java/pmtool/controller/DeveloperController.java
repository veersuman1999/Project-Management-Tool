package pmtool.controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import pmtool.dao.ProjectDao;
import pmtool.dao.UserDao;
import pmtool.entities.Project;
import pmtool.entities.User;

@Controller
public class DeveloperController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ProjectDao projectDao;
	
	@RequestMapping("/ddashboard")
	public String developerDashboard(@ModelAttribute User user,Model m,HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		int id=Integer.parseInt(request.getParameter("id"));
		List<User> user1=userDao.getUserDeveloper(id);
		m.addAttribute("username",user.getName());
    	m.addAttribute("id",id);
    	m.addAttribute("userproject",user1);
		
		return "ddashboard";
	}
	
	@RequestMapping("/updateproject/{pId}/{id}")
	public String updateProjectDeveloper(@PathVariable("pId") int pId,@PathVariable("id") int id, Model model)
	{
		Project project=this.projectDao.getProject(pId);
		model.addAttribute("project",project);
		model.addAttribute("id", id);
		return "update_project_developer";
	}
	
	@RequestMapping(value="/updateDeveloperProject/{id}",method = RequestMethod.POST)
	public String addProject(@PathVariable("id") int id, @ModelAttribute("project") Project project,Model m,HttpServletRequest request,HttpServletResponse response)
	{
		List<Project> projects=projectDao.getProjects();
		HttpSession httpSession = request.getSession();
		System.out.println(project);
		projectDao.createProject(project);
		
    	
		m.addAttribute("id", id);
		m.addAttribute("project", projects);
		httpSession.setAttribute("message", "Querie added successfully !! ");
		
		return "redirect:/ddashboard";
	}
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value=Exception.class)
	public String exceptionHandlerGeneric() {
		
		return "data_error_page";
	}
}

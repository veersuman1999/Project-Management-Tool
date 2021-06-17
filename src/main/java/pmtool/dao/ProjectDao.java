package pmtool.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import pmtool.entities.Project;
import pmtool.entities.User;

@Component
public class ProjectDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	private SessionFactory factory;

    public ProjectDao(SessionFactory factory) {
    this.factory = factory;
}
	
	@Transactional
	public void createProject(Project project)
	{
		this.hibernateTemplate.saveOrUpdate(project);
		
	}
	
	public List<Project> getProjects(){
		
		List<Project> project=this.hibernateTemplate.loadAll(Project.class);
		return project;
	}
	
	@Transactional
	public void deleteProject(int pid)
	{
		Project u=this.hibernateTemplate.load(Project.class,pid);
		this.hibernateTemplate.delete(u);
	}
	
	@Transactional
	public Project getProject(int pid)
	{
		Project project=null;
		try {
			project=this.hibernateTemplate.get(Project.class,pid);
	}catch(Exception e) {
		e.printStackTrace();
	}
		return project;
	}
	
	@Transactional
	public List<Project> getPendingProject() {
		List<Project> project=null;
	 	try {
         String query = "from Project where status = 'Pending'";
         Session session = this.factory.openSession();
         Query q = session.createQuery(query);
         
         project =  q.list();
         session.close();
	 	}catch(Exception e) {
	 		e.printStackTrace();
	 	}
	 
		
		return project;
	}
}

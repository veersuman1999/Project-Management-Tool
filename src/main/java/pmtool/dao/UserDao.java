package pmtool.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import pmtool.entities.Project;
import pmtool.entities.User;

@Component
public class UserDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	private SessionFactory factory;

    public UserDao(SessionFactory factory) {
    this.factory = factory;
}
	
	@Transactional
	public void createUser(User user)
	{
		this.hibernateTemplate.saveOrUpdate(user);
	}
	/*public void updateUser(int pId)
	{
		String query = "update User as p set p.project.pId = null where p.project.pId=: id";
        Session session = this.factory.openSession();
        Query q = session.createQuery(query);
        
        q.setParameter("id", pId);
	}*/
	
	public List<User> getUsers(){
		
		List<User> user=this.hibernateTemplate.loadAll(User.class);
		return user;
	}
	
	@Transactional
	public void deleteUser(int uid)
	{
		User u=this.hibernateTemplate.load(User.class,uid);
		this.hibernateTemplate.delete(u);
	}
	
	public User getUser(int uid)
	{
		return this.hibernateTemplate.get(User.class, uid);
		
		}
	public List<User> getUserDeveloper(int uid)
	{
		List<User> user=null;
	 	try {
         String query = "from User where id =: id";
         Session session = this.factory.openSession();
         Query q = session.createQuery(query);
         q.setParameter("id", uid);
         user=q.list();
         session.close();
	 	}catch(Exception e) {
	 		e.printStackTrace();
	 	}
	 
	 	return user;
		
		}
	
	 /*public User getUserByEmailAndPassword(String email,String password,String usertype)
     {
         User user=null;
         try {
             String query = "from User where email =: e and password =: p and usertype =: t";
             Session session = this.factory.openSession();
             Query q = session.createQuery(query);
             
             q.setParameter("e", email);
             q.setParameter("p", password);
             q.setParameter("t", usertype);
            
             user = (User) q.uniqueResult();
             session.close();
             
         } catch (Exception e) {
             e.printStackTrace();
         }
         return user;
         }*/
	 @SuppressWarnings("unchecked")
     public User getUserByEmailAndPassword(String email,String password,String usertype){
         DetachedCriteria detachedCriteria =  DetachedCriteria.forClass(User.class);
         detachedCriteria.add(Restrictions.eq("email", email));
         detachedCriteria.add(Restrictions.eq("password", password));
         detachedCriteria.add(Restrictions.eq("usertype", usertype));
         List<User> findByCriteria = (List<User>) hibernateTemplate.findByCriteria(detachedCriteria);
         if(findByCriteria !=null && findByCriteria.size()>0)
         return findByCriteria.get(0);
         else
             return null;
     }
	 
	 public List<User> getDeveloper() {
		 	List<User> developer=null;
		 	try {
             String query = "from User where usertype = 'developer'";
             Session session = this.factory.openSession();
             Query q = session.createQuery(query);
             
             developer =  q.list();
             session.close();
		 	}catch(Exception e) {
		 		e.printStackTrace();
		 	}
		 
		 return developer;
	 }
	 
	 public List<User> getAllUsersById(int pId)
	    {
	        Session s = this.factory.openSession();
	        Query query = s.createQuery("from User as p where p.project.pId =: id");
	        query.setParameter("id", pId);
	        List<User> list = query.list();
	        s.close();
	        return list;
	    }
	 
	 public List<User> getDeveloperbyPId(){
		 Session s = this.factory.openSession();
	        Query query = s.createQuery("from User as p where usertype = 'developer' and p.project.pId = null");
	        List<User> list = query.list();
	        s.close();
	        return list;
	 }
	 public List<User> getDeveloperbyProjectAssigned(){
		 Session s = this.factory.openSession();
	        Query query = s.createQuery("from User as p where usertype = 'developer' and p.project.pId = not null");
	        List<User> list = query.list();
	        s.close();
	        return list;
	 }
 }

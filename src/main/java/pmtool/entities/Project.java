package pmtool.entities;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;


@Entity
public class Project{
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int pId;
	private String pName;
	private String pDesc;
	private String oldDate;
	private String newDate;
	private String remarks;
	private String querie;
	private String status;
	@OneToMany(mappedBy = "project")
	private List<User> user=new ArrayList<User>();
	
	public List<User> getUser() {
		return user;
	}
	public void setUser(List<User> user) {
		this.user = user;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getOldDate() {
		return oldDate;
	}
	public void setOldDate(String oldDate) {
		this.oldDate = oldDate;
	}
	public String getNewDate() {
		return newDate;
	}
	public void setNewDate(String newDate) {
		this.newDate = newDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	public String getQuerie() {
		return querie;
	}
	public void setQuerie(String querie) {
		this.querie = querie;
	}
	
	public Project(int pId, String pName, String pDesc, String oldDate, String newDate, String remarks, String querie,
			String status, List<User> user) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDesc = pDesc;
		this.oldDate = oldDate;
		this.newDate = newDate;
		this.remarks = remarks;
		this.querie = querie;
		this.status = status;
		this.user = user;
	}
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Project [pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", oldDate=" + oldDate + ", newDate="
				+ newDate + ", remarks=" + remarks + ", querie=" + querie + ", status=" + status + ", user=" + user
				+ "]";
	}
	

}

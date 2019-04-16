package footwearwebportal;

public class Employee extends User {
	private String companyID, programID;

	Employee(String companyID, String programID){
		super();
		this.companyID = companyID;
		this.programID = programID;
	}

	Employee(String UID, String username, String password, String group,
			 String firstName, String lastName, String email, String companyID, String programID){
		super(UID, username, password, group, firstName, lastName, email);
		this.companyID = companyID;
		this.programID = programID;
	}

	Employee(String username, String password, String group,
			 String firstName, String lastName, String email, String companyID, String programID){
		super(username, password, group, firstName, lastName, email, companyID);
		this.companyID = companyID;
		this.programID = programID;
	}

	Employee(User user, String companyID, String programID){
		super(user);
		this.companyID = companyID;
		this.programID = programID;
	}

	public String getCompanyID() {
		return companyID;
	}

	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}

	public String getProgramID() {
		return programID;
	}

	public void setProgramID(String programID) {
		this.programID = programID;
	}
}

package footwearwebportal;

public class Supervisor extends User implements Comparable<User> {
	private String companyID;

	public Supervisor(String companyID){
		super();
		this.companyID = companyID;
	}

	public Supervisor(String UID, String username, String password, String group,
			   String firstName, String lastName, String email, String companyID){
		super(UID, username, password, group, firstName, lastName, email);
		this.companyID = companyID;
	}

	public Supervisor(String username, String password, String group,
			   String firstName, String lastName, String email, String companyID){
		super(username, password, group, firstName, lastName, email);
		this.companyID = companyID;
	}

	public Supervisor(User user, String companyID){
		super(user);
		this.companyID = companyID;
	}

	public String getCompanyID() {
		return companyID;
	}

	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}

	public User getUser(){
		return new User(super.getUsername(), super.getPassword(),
				super.getGroup(), super.getFirstName(), super.getLastName(), super.getEmail());
	}

	@Override
	public String toString() {
		return super.toString() + ", " + companyID;
	}
}

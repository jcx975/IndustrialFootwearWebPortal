package footwearwebportal;

public class CompanyData implements Comparable<CompanyData> {
	private String companyID, companyName, city, state, email, comments;

	public CompanyData(String companyID, String companyName, String city, String state, String email, String comments){
		this.companyID = companyID;
		this.companyName = companyName;
		this.city = city;
		this.state = state;
		this.email = email;
		this.comments = comments;
	}

	public CompanyData(String companyName, String city, String state, String email, String comments) {
		this.companyID = "0";
		this.companyName = companyName;
		this.city = city;
		this.state = state;
		this.email = email;
		this.comments = comments;
	}

	@Override
	public String toString() {
		return companyID + ", " + companyName + ", " + city + ", " + state + ", " + email + ", " + comments;
	}

	public String getCompanyID() {
		return companyID;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public int compareTo(CompanyData s){
		return this.getCompanyName().toUpperCase().compareTo(s.getCompanyName().toUpperCase());
	}
}

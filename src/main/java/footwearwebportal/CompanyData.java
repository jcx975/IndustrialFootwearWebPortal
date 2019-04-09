package footwearwebportal;

public class CompanyData implements Comparable<CompanyData> {
	public String companyID, companyName, city, state;

	public CompanyData(String companyID, String companyName, String city, String state){
		this.companyID = companyID;
		this.companyName = companyName;
		this.city = city;
		this.state = state;
	}

	@Override
	public String toString() {
		return companyID + ", " + companyName + ", " + city + ", " + state;
	}

	public String getCompanyID() {
		return companyID;
	}

	public void setCompanyID(String companyID) {
		this.companyID = companyID;
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

	@Override
	public int compareTo(CompanyData s){
		return this.getCompanyName().toUpperCase().compareTo(s.getCompanyName().toUpperCase());
	}
}

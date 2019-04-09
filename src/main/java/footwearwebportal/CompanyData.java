package footwearwebportal;

public class CompanyData {
	private String companyID, companyName, city, state;

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
}

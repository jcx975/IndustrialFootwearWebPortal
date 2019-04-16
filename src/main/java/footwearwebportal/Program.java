package footwearwebportal;

public class Program {
	private String programID, companyID, programName, programDesc, discount;

	public Program(String programID, String companyID, String programName, String programDesc, String discount) {
		this.programID = programID;
		this.companyID = companyID;
		this.programName = programName;
		this.programDesc = programDesc;
		this.discount = discount;
	}

	public Program(String companyID, String programName, String programDesc, String discount) {
		this.companyID = companyID;
		this.programName = programName;
		this.programDesc = programDesc;
		this.discount = discount;
	}

	public String getProgramID() {
		return programID;
	}

	public void setProgramID(String programID) {
		this.programID = programID;
	}

	public String getCompanyID() {
		return companyID;
	}

	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public String getProgramDesc() {
		return programDesc;
	}

	public void setProgramDesc(String programDesc) {
		this.programDesc = programDesc;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}
}

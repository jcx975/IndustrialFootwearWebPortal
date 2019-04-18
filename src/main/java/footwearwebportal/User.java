package footwearwebportal;

public class User {
	private String UID, username, password, group, firstName, lastName, email;

	public User(String UID, String username, String password,
				String group, String firstName, String lastName, String email) {
		this.UID = UID;
		this.username = username;
		this.password = password;
		this.group = group;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}

	// overloaded constructor
	public User(String username, String password, String group,
				String firstName, String lastName, String email) {
		this.UID = "0"; // set UID to 0 since we still need to create it
		this.username = username;
		this.password = password;
		this.group = group;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}

	public User(){

	}

	public User(User user){
		this.UID = user.UID;
		this.username = user.username;
		this.password = user.password;
		this.group = user.group;
		this.firstName = user.firstName;
		this.lastName = user.lastName;
		this.email = user.email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUID() {
		return UID;
	}

	public void setUID(String UID) {
		this.UID = UID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return UID + ", " + username + ", " + password + ", " + group + ", " + firstName + ", " + lastName + ", " + email;
	}
}

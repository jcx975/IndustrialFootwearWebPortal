package footwearwebportal;

public class Shoe implements Comparable<Shoe> {
	private String shoeID, shoeName, shoePrice;

	public Shoe(String shoeID, String shoeName, String shoePrice) {
		this.shoeID = shoeID;
		this.shoeName = shoeName;
		this.shoePrice = shoePrice;
	}

	public Shoe(String shoeName, String shoePrice) {
		this.shoeName = shoeName;
		this.shoePrice = shoePrice;
	}

	public String getShoeID() {
		return shoeID;
	}

	public void setShoeID(String shoeID) {
		this.shoeID = shoeID;
	}

	public String getShoeName() {
		return shoeName;
	}

	public void setShoeName(String shoeName) {
		this.shoeName = shoeName;
	}

	public String getShoePrice() {
		return shoePrice;
	}

	public void setShoePrice(String shoePrice) {
		this.shoePrice = shoePrice;
	}

	@Override
	public int compareTo(Shoe s){
		return this.getShoeName().toUpperCase().compareTo(s.getShoeName().toUpperCase());
	}
}

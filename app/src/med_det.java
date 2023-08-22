package src;
public class med_det {
		    private String name;
    private String email;
    private String phone;
    private String allergies;
    private String med;
	public med_det(String name,String email,String phone,String allergies,String med){
	this.name = name;
    this.email = email;
    this.phone = phone;
    this.allergies = allergies;
    this.med = med;
	}
   public String getEmail() { return email; }
    public String getName() { return name; }
  public String getPhone() { return phone; }
public String getAllergies() { return allergies; }
public String getMed() { return med; }
    // constructors
    // standard getters and setters.
}
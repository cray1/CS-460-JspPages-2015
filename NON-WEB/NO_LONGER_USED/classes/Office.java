

/**
 **+----------------------------------------------------------------------
 * @Class:  
 *
 * @Author:
 *
 * @Purpose:
 * 
 * @Inherits From:
 * 
 * @Interfaces: 
 * 
 * @Constants: 
 * 
 * @Constructors:
 * 
 * @Static Class Methods:
 * 
 * @Inst. Methods: 
 *  
 *
 **+----------------------------------------------------------------------
 */
public class Office {

	public int officeId;
	public String officeName;
	public String city;
	public String state;
	public String address;
	public String zipCode;
	
	/**
	 * 
	 * @Method:  Office
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param officeId
	 * @Params: @param officeName
	 * @Params: @param city
	 * @Params: @param state
	 * @Params: @param address
	 * @Params: @param zipCode 
	 * 
	 */
	public Office(int officeId, String officeName, String city, String state, String address, String zipCode) {
		this.officeId = officeId;
		this.officeName = officeName;
		this.city = city;
		this.state = state;
		this.address = address;
		this.zipCode = zipCode;
	}
	
	 
}

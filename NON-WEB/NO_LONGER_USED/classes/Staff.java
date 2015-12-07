/**
 * 
 */


import java.util.Date;

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
public class Staff {

	public int emplid;
	public String firstName;
	public String lastName;
	public String phoneNumber;
	public Date birthDate;
	
	/**
	 * 
	 * @Method:  Staff
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param emplid
	 * @Params: @param firstName
	 * @Params: @param lastName
	 * @Params: @param phoneNumber
	 * @Params: @param birthDate 
	 * 
	 */
	public Staff(int emplid, String firstName, String lastName, String phoneNumber, Date birthDate) {
		this.emplid = emplid;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.birthDate = birthDate;
	}
	
	 
}

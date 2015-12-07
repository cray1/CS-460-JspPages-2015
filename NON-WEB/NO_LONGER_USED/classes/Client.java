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
public class Client {

	public int clientId;
	public String firstName;
	public String lastName;
	public String phoneNumber;
	public String email;
	public Date birthDate;
	public String sex;
	public Office office;
	
	/**
	 * 
	 * @Method:  Client
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param clientId
	 * @Params: @param firstName
	 * @Params: @param lastName
	 * @Params: @param phoneNumber
	 * @Params: @param email
	 * @Params: @param birthDate
	 * @Params: @param sex
	 * @Params: @param office 
	 * 
	 */
	public Client(int clientId, String firstName, String lastName, String phoneNumber, String email, Date birthDate,
			String sex, Office office) {
		this.clientId = clientId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.birthDate = birthDate;
		this.sex = sex;
		this.office = office;
	}
	 
	
}

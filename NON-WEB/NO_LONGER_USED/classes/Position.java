/**
 * 
 */


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
public class Position {

	public int positionId;
	public JobTitle jobTitle;
	public Staff staff;
	public Office office;
	public Car car;
	
	/**
	 * 
	 * @Method:  Position
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param positionId
	 * @Params: @param jobTitle
	 * @Params: @param staff
	 * @Params: @param office
	 * @Params: @param car 
	 * 
	 */
	public Position(int positionId, JobTitle jobTitle, Staff staff, Office office, Car car) {
		this.positionId = positionId;
		this.jobTitle = jobTitle;
		this.staff = staff;
		this.office = office;
		this.car = car;
	}
	
 
}

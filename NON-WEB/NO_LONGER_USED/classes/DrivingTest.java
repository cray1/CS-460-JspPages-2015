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
public class DrivingTest {

	public int drivingTestId; 
    public Client client;  
    public Boolean passed; 
    public Date testDate;
    
    /**
	 * 
	 * @Method:  DrivingTest
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param drivingTestId
	 * @Params: @param client
	 * @Params: @param passed
	 * @Params: @param testDate 
	 * 
	 */
	public DrivingTest(int drivingTestId, Client client, Boolean passed, Date testDate) {
		this.drivingTestId = drivingTestId;
		this.client = client;
		this.passed = passed;
		this.testDate = testDate;
	}

}

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
public class WrittenTest {

	public int writtentestId ;
	public Client client ;
    public Boolean passed;
    public Date testDate ;
    
    /**
	 * 
	 * @Method:  WrittenTest
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param writtentestId
	 * @Params: @param client
	 * @Params: @param passed
	 * @Params: @param testDate 
	 * 
	 */
	public WrittenTest(int writtentestId, Client client, Boolean passed, Date testDate) {
		this.writtentestId = writtentestId;
		this.client = client;
		this.passed = passed;
		this.testDate = testDate;
	}

}

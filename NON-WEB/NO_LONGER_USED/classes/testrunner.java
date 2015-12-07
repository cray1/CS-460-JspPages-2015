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
public class testrunner {

	/**
	 * 
	 * @Method: main
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: void
	 * 
	 * @Params: @param args 
	 * 
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		cray1DBController db = new cray1DBController();
		db.Open();
		db.InsertCar(1, "Red Volvo", "123456789");
		db.InsertOffice(1, "Downtown Office", "Tucson", "AZ", "123 E Nowhere St.", "1234567");
	}

}

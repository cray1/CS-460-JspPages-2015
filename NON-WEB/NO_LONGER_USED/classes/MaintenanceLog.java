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
public class MaintenanceLog {

	 public int maintenanceLogId;
	 public Car car;
	 public Date maintenanceDate;
	 public Boolean faultsFound;
	 public String maintenanceNotes;
	 
	/**
	 * 
	 * @Method:  MaintenanceLog
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param maintenanceLogId
	 * @Params: @param car
	 * @Params: @param maintenanceDate
	 * @Params: @param faultsFound
	 * @Params: @param maintenanceNotes 
	 * 
	 */
	public MaintenanceLog(int maintenanceLogId, Car car, Date maintenanceDate, Boolean faultsFound,
			String maintenanceNotes) {
		this.maintenanceLogId = maintenanceLogId;
		this.car = car;
		this.maintenanceDate = maintenanceDate;
		this.faultsFound = faultsFound;
		this.maintenanceNotes = maintenanceNotes;
	}  
	 
	 
	
	  
}

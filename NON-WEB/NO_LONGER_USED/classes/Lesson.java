/**
 * 
 */


import java.util.Date;

/**
 ** +----------------------------------------------------------------------
 * 
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
 * 		@Inst. Methods:
 * 
 *
 **         +--------------------------------------------------------------------
 *         --
 */
public class Lesson {

	public int lessonId;
	public Client client;
	public Date startDate;
	public Date stopDate;
	public Position position;
	public Car car;
	public int mileageUsed;
	public String progressNotes;
	
	/**
	 * 
	 * @Method:  Lesson
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition: 
	 * 
	 * @Params: @param lessonId
	 * @Params: @param client
	 * @Params: @param startDate
	 * @Params: @param stopDate
	 * @Params: @param position
	 * @Params: @param car
	 * @Params: @param mileageUsed
	 * @Params: @param progressNotes 
	 * 
	 */
	public Lesson(int lessonId, Client client, Date startDate, Date stopDate, Position position, Car car,
			int mileageUsed, String progressNotes) {
		this.lessonId = lessonId;
		this.client = client;
		this.startDate = startDate;
		this.stopDate = stopDate;
		this.position = position;
		this.car = car;
		this.mileageUsed = mileageUsed;
		this.progressNotes = progressNotes; 
	}

	 

}

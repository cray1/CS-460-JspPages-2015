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
public class Interview {

	public Position position;
    public Client client;
    public String interviewNotes;
    public Date interviewDate;
    
    /**
     * 
     * @Method:  Interview
     *
     * @Purpose:
     *
     * @Pre-condition:
     *
     * @Post-condition: 
     * 
     * @Params: @param position
     * @Params: @param client
     * @Params: @param interviewNotes
     * @Params: @param interviewDate 
     *
     */
    public Interview(Position position, Client client, String interviewNotes, Date interviewDate){
    	this.position = position;
    	this.client = client;
    	this.interviewNotes = interviewNotes;
    	this.interviewDate = interviewDate;
    }
}

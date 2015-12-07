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
public class ProvisionalLicense {

	public int  licenseId ;
    public Client client;
    public Date expireDate;
    
    /**
     * 
     * 
     * @Method:  ProvisionalLicense
     *
     * @Purpose:
     *
     * @Pre-condition:
     *
     * @Post-condition: 
     * 
     * @Params: @param licenseId
     * @Params: @param client
     * @Params: @param expireDate 
     *
     */
    public ProvisionalLicense(int licenseId, Client client, Date expireDate){
    	this.licenseId = licenseId;
    	this.client = client;
    	this.expireDate = expireDate;
    }
}

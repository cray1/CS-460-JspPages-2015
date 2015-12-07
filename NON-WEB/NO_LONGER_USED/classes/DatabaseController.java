



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;
import java.util.*;

/**
 * Servlet implementation class for Servlet: DatabaseController
 *
 */
public class DatabaseController {
  static final long serialVersionUID = 1L;
  /**
   * A handle to the connection to the DBMS.
   */
  protected Connection connection_;
  /**
   * A handle to the statement.
   */
  protected Statement statement_;
  /**
   * The connect string to specify the location of DBMS
   */
  protected String connect_string_ = null;
  /**
   * The password that is used to connect to the DBMS.
   */
  protected String password = null;
  /**
   * The username that is used to connect to the DBMS.
   */
  protected String username = null;


  public DatabaseController() {
    // your cs login name
    username = "cray1"; 
    // your Oracle password, NNNN is the last four digits of your CSID
    password = "a6574";
    connect_string_ = "jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle";
  }


  /**
   * Closes the DBMS connection that was opened by the open call.
   */
  public void Close() {
    try {
      statement_.close();
      connection_.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    connection_ = null;
  }


  /**
   * Commits all update operations made to the dbms.
   * If auto-commit is on, which is by default, it is not necessary to call
   * this method.
   */
  public void Commit() {
    try {
      if (connection_ != null && !connection_.isClosed())
        connection_.commit();
    } catch (SQLException e) {
      System.err.println("Commit failed");
      e.printStackTrace();
    }
  }


  public void Open() {
    boolean opened = false;
    while (!opened) {
      try {
        Class.forName("oracle.jdbc.OracleDriver");
        connection_ = DriverManager.getConnection(
            connect_string_, username, password);
        statement_ = connection_.createStatement();
        opened = true;
        return;
      } catch (SQLException sqlex) {
        sqlex.printStackTrace();
        opened  = false;
      } catch (ClassNotFoundException e) {
        e.printStackTrace();
        System.exit(1); //programemer/dbsm error
      } catch (Exception ex) {
        ex.printStackTrace();
        System.exit(2);
      }
    }
  }

/**
 * 
 * 
 * @Method: FindAllEmployees
 *
 * @Purpose:
 *
 * @Pre-condition:
 *
 * @Post-condition:
 *
 * @Return: Vector<String>
 * 
 * @Params: @return 
 *
 */
  public Vector<String> FindAllEmployees() {
    String sql_query = "SELECT * FROM mccann.employee";
    try {
      ResultSet rs  = statement_.executeQuery(sql_query);
      Vector<String> result_employees = new Vector<String>();
      while (rs.next()) {
         String temp_record = rs.getString("fname") + "##" + rs.getString("minit") +
             "##" + rs.getString("lname") + "##" + rs.getString("ssn") + "##" +
             rs.getString("bdate") + "##" + rs.getString("address") + "##" +
	     rs.getString("sex") + "##" + rs.getString("salary") +
	     "##" + rs.getString("superssn") + "##" + rs.getString("dno");
        result_employees.add(temp_record);
      }
      return result_employees;
    } catch (SQLException sqlex) {
      sqlex.printStackTrace();
    }
    return null;
  }
  
  /**
   * 
   * 
   * @Method: FindAllOffices
   *
   * @Purpose:
   *
   * @Pre-condition:
   *
   * @Post-condition:
   *
   * @Return: Vector<String>
   * 
   * @Params: @return 
   *
   */
  public Vector<String> FindAllOffices() {
		String sql_query = "SELECT * FROM cray1.office";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("officeid") + "##" + rs.getString("officename") +
	             "##" + rs.getString("city") + "##" + rs.getString("state") + "##" +
	             rs.getString("address") + "##" + rs.getString("zipcode");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

  /**
   * 
   * 
   * @Method: FindAllStaff
   *
   * @Purpose:
   *
   * @Pre-condition:
   *
   * @Post-condition:
   *
   * @Return: Vector<String>
   * 
   * @Params: @return 
   *
   */
	public Vector<String> FindAllStaff() {
		String sql_query = "SELECT * FROM cray1.staff";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("emplid") + "##" + rs.getString("firstname") +
	             "##" + rs.getString("lastname") + "##" + rs.getString("phonenumber") + "##" +
	             rs.getDate("birthdate") + "##" + rs.getString("zipcode");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllPositions
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllPositions() {
		String sql_query = "SELECT * FROM cray1.position";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("positionid") + "##" + rs.getInt("jobtitleid") +
	             "##" + rs.getInt("emplid") + "##" + rs.getInt("officeid") + "##" +
	             rs.getInt("carid");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

/**
 * 
 * 
 * @Method: FindAllJobTitles
 *
 * @Purpose:
 *
 * @Pre-condition:
 *
 * @Post-condition:
 *
 * @Return: Vector<String>
 * 
 * @Params: @return 
 *
 */
	public Vector<String> FindAllJobTitles() {
		String sql_query = "SELECT * FROM cray1.jobtitle";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("jobtitleid") + "##" + rs.getString("title");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllInterviews
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllInterviews() {
		String sql_query = "SELECT * FROM cray1.interview";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("positionid") + "##" + rs.getInt("clientid") +
	             "##" + rs.getString("interviewnotes") + "##" + rs.getDate("interviewdate");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllClients
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllClients() {
		String sql_query = "SELECT * FROM cray1.client";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("clientid") + "##" + rs.getString("firstname") +
	             "##" + rs.getString("lastname") + "##" + rs.getString("phonenumber") + "##" +
	             rs.getString("email") + "##" + rs.getDate("birthdate") + "##" + rs.getString("sex")
	             + "##" + rs.getInt("officeid");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllProvisionalLicenses
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllProvisionalLicenses() {
		String sql_query = "SELECT * FROM cray1.provisionallicense";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("licenseid") + "##" + rs.getInt("clientit") +
	             "##" + rs.getDate("expiredate");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllLessons
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllLessons() {
		String sql_query = "SELECT * FROM cray1.lesson";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("lessonid") + "##" + rs.getInt("clientid") +
	             "##" + rs.getDate("starttime") + "##" + rs.getDate("stoptime") + "##" +
	             rs.getInt("positionid") + "##" + rs.getInt("carid") + "##" + rs.getInt("mileageused")
	             + "##" + rs.getString("progressnotes");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllCars
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllCars() {
		String sql_query = "SELECT * FROM cray1.car";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("carid") + "##" + rs.getString("description") +
	             "##" + rs.getString("registrationnumber");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllDrivingTests
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllDrivingTests() {
		String sql_query = "SELECT * FROM cray1.drivingtest";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("drivingtestid") + "##" + rs.getInt("clientid") +
	             "##" + rs.getBoolean("passed") + "##" + rs.getDate("testdate");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllWrittenTests
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllWrittenTests() {
		String sql_query = "SELECT * FROM cray1.writtentest";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("writtentestid") + "##" + rs.getInt("clientid") +
	             "##" + rs.getBoolean("passed") + "##" + rs.getDate("testdate");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}

	/**
	 * 
	 * 
	 * @Method: FindAllMaintenanceLogs
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Vector<String>
	 * 
	 * @Params: @return 
	 *
	 */
	public Vector<String> FindAllMaintenanceLogs() {
		String sql_query = "SELECT * FROM cray1.maintenancelog";
	    try {
	      ResultSet rs  = statement_.executeQuery(sql_query);
	      Vector<String> result = new Vector<String>();
	      while (rs.next()) {
	         String temp_record = rs.getInt("logid") + "##" + rs.getInt("carid") +
	             "##" + rs.getDate("maintenancedate") + "##" + rs.getBoolean("faultsfound") + "##" +
	             rs.getString("maintenancenotes");
	        result.add(temp_record);
	      }
	      return result;
	    } catch (SQLException sqlex) {
	      sqlex.printStackTrace();
	    }
	    return null;
	}
	/**
	 * 
	 * 
	 * @Method: recordExists_OnePK
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: boolean
	 * 
	 * @Params: @param tableName
	 * @Params: @param pkName1
	 * @Params: @param pkValue1
	 * @Params: @return
	 * @Params: @throws SQLException
	 *
	 */
	private boolean recordExists_OnePK(String tableName, String pkName1, String pkValue1) {
		try {
			String sql = "Select * from " + tableName + " where " + pkName1 + " = " + pkValue1;

			PreparedStatement ps = connection_.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	 * 
	 * @Method: recordExists_TwoPK
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: boolean
	 * 
	 * @Params: @param tableName
	 * @Params: @param pkName1
	 * @Params: @param pkValue1
	 * @Params: @param pkName2
	 * @Params: @param pkValue2
	 * @Params: @return
	 * @Params: @throws SQLException
	 *
	 */
	private boolean recordExists_TwoPK(String tableName, String pkName1, String pkValue1, String pkName2,
			String pkValue2) {
		try {

			String sql = "Select * from " + tableName + " where " + pkName1 + " = " + pkValue1 + " AND " + pkName2
					+ " = " + pkValue2;

			PreparedStatement ps = connection_.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	private boolean recordExists_ThreePK(String tableName, String pkName1, String pkValue1, String pkName2,
			String pkValue2, String pkName3, String pkValue3) {
		try {

			String sql = "Select * from " + tableName + " where " + pkName1 + " = " + pkValue1 + " AND " + pkName2
					+ " = " + pkValue2 + " AND " + pkName3 + " = " + pkValue3;

			PreparedStatement ps = connection_.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	 * 
	 * @Method: InsertOffice
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Office
	 * 
	 * @Params: @param officeId
	 * @Params: @param officeName
	 * @Params: @param city
	 * @Params: @param state
	 * @Params: @param address
	 * @Params: @param zipCode
	 * @Params: @return
	 *
	 */
	public Office InsertOffice(int officeId, String officeName, String city, String state, String address,
			String zipCode) {

		if (!recordExists_OnePK("cray1.Office", "OfficeId", officeId + "")) {
			String sql_insert = "INSERT INTO cray1.Office (OfficeId, OfficeName, City, State, Address, ZipCode) "
					+ "VALUES (?,?,?,?,?,?)";

			try {
				PreparedStatement preparedStatement = connection_.prepareStatement(sql_insert);
				preparedStatement.setInt(1, officeId);
				preparedStatement.setString(2, officeName);
				preparedStatement.setString(3, city);
				preparedStatement.setString(4, state);
				preparedStatement.setString(5, address);
				preparedStatement.setString(6, zipCode);
				preparedStatement.executeUpdate();

				Office office = new Office(officeId, officeName, city, state, address, zipCode);
				return office;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		} else {
			return UpdateOffice(officeId, officeName, city, state, address, zipCode);
		}
	}

	/**
	 * 
	 * 
	 * @Method: UpdateOffice
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Office
	 * 
	 * @Params: @param officeId
	 * @Params: @param officeName
	 * @Params: @param city
	 * @Params: @param state
	 * @Params: @param address
	 * @Params: @param zipCode
	 * @Params: @return
	 *
	 */
	public Office UpdateOffice(int officeId, String officeName, String city, String state, String address,
			String zipCode) {
		if (recordExists_OnePK("cray1.Office", "OfficeId", officeId + "")) {
			String sql_update = "UPDATE cray1.Office"
					+ "SET OfficeName = ?, City = ?, State = ?, Address = ?, ZipCode = ?" + "WHERE OfficeId = ?";
			try {
				PreparedStatement preparedStatement = connection_.prepareStatement(sql_update);

				preparedStatement.setString(1, officeName);
				preparedStatement.setString(2, city);
				preparedStatement.setString(3, state);
				preparedStatement.setString(4, address);
				preparedStatement.setString(5, zipCode);
				preparedStatement.setInt(6, officeId);
				preparedStatement.executeUpdate();

				Office office = new Office(officeId, officeName, city, state, address, zipCode);
				return office;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			return InsertOffice(officeId, officeName, city, state, address, zipCode);
		}
		return null;
	}

	/**
	 * 
	 * 
	 * @Method: InsertStaff
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Staff
	 * 
	 * @Params: @param firstName
	 * @Params: @param lastName
	 * @Params: @param phoneNumber
	 * @Params: @param birthDate
	 * @Params: @return
	 *
	 */
	public Staff InsertStaff(int emplId, String firstName, String lastName, String phoneNumber, Date birthDate) {

		String sql_insert = "INSERT INTO cray1.Staff (Emplid, FirstName, LastName, PhoneNumber, BirthDate)"
				+ " VALUES(?,?,?,?,?)";
		try {
			PreparedStatement ps = connection_.prepareStatement(sql_insert);
			ps.setInt(1, emplId);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.setString(4, phoneNumber);

			// important to note here: java.util.date contains date and time
			// information, however
			// java.sql.date only contains date information, thus setTimeStamp
			// is needed.
			ps.setTimestamp(5, new java.sql.Timestamp(birthDate.getTime()) );

			ps.executeUpdate();

			Staff staff = new Staff(emplId, firstName, lastName, phoneNumber, birthDate);
			return staff;
		} catch (SQLException e) {
			e.printStackTrace();

			return null;
		}
	}

	/**
	 * 
	 * 
	 * @Method: InsertJobTitle
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: JobTitle
	 * 
	 * @Params: @param title
	 * @Params: @return
	 *
	 */
	public JobTitle InsertJobTitle(int jobTitleId, String title) {
		String sql_insert = "INSERT INTO cray1.JobTitle (JobTitleId, Title) " + " VALUES (?,?)";

		try {
			PreparedStatement ps = connection_.prepareStatement(sql_insert);
			ps.setInt(1, jobTitleId);

			ps.setString(2, title);
			ps.executeUpdate();

			JobTitle jobTitle = new JobTitle(jobTitleId, title);
			return jobTitle;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * 
	 * 
	 * @Method: InsertCar
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Car
	 * 
	 * @Params: @param description
	 * @Params: @param registrationNumber
	 * @Params: @return
	 *
	 */
	public Car InsertCar(int carId, String description, String registrationNumber) {
		String sql_insert = "INSERT INTO cray1.Car (CarId, Description, RegistrationNumber) " + "VALUES (?,?,?)";
		try {
			PreparedStatement ps = connection_.prepareStatement(sql_insert);
			ps.setInt(1, carId);
			ps.setString(2, description);
			ps.setString(3, registrationNumber);
			ps.executeUpdate();
			Car car = new Car(carId, description, registrationNumber);
			return car;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * 
	 * @Method: InsertPosition
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Position
	 * 
	 * @Params: @param jobTitle
	 * @Params: @param staff
	 * @Params: @param office
	 * @Params: @param car
	 * @Params: @return
	 *
	 */
	public Position InsertPosition(int positionId, JobTitle jobTitle, Staff staff, Office office, Car car) {
		if (jobTitle != null && staff != null && office != null && car != null) {

			String sql_insert = "INSERT INTO cray1.Position (PositionId, JobTitleId, Emplid, OfficeId, CarId) "
					+ " VALUES(?,?,?,?,?)";

			try {
				PreparedStatement ps = connection_.prepareStatement(sql_insert);

				ps.setInt(1, positionId);
				ps.setInt(2, jobTitle.jobTitleId);
				ps.setInt(3, staff.emplid);
				ps.setInt(4, office.officeId);
				ps.setInt(5, car.carId);

				ps.executeUpdate();
				Position pos = new Position(positionId, jobTitle, staff, office, car);
				return pos;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return null;

	}

	/**
	 * 
	 * 
	 * @Method: InsertClient
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Client
	 * 
	 * @Params: @param clientId
	 * @Params: @param firstName
	 * @Params: @param lastName
	 * @Params: @param phoneNumber
	 * @Params: @param email
	 * @Params: @param birthDate
	 * @Params: @param sex
	 * @Params: @param office
	 * @Params: @return
	 *
	 */
	public Client InsertClient(int clientId, String firstName, String lastName, String phoneNumber, String email,
			Date birthDate, String sex, Office office) {

		if (office != null) {

			String sql_insert = "INSERT INTO cray1.Client "
					+ " (clientId, firstName, lastName, phoneNumber, email, birthDate, sex, officeId) "
					+ " VALUES(?,?,?,?,?,?,?,?)";

			try {
				PreparedStatement ps = connection_.prepareStatement(sql_insert);
				ps.setInt(1, clientId);
				ps.setString(2, firstName); 
				ps.setString(3, lastName);
				ps.setString(4, phoneNumber);
				ps.setString(5, email);
				ps.setTimestamp(6, new java.sql.Timestamp(birthDate.getTime()));
				ps.setString(7, sex);
				ps.setInt(8, office.officeId);

				ps.executeUpdate();

				Client client = new Client(clientId, firstName, lastName, phoneNumber, email, birthDate, sex, office);
				return client;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return null;

	}

	/**
	 * 
	 * 
	 * @Method: InsertDrivingTest
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: DrivingTest
	 * 
	 * @Params: @param drivingTestId
	 * @Params: @param client
	 * @Params: @param passed
	 * @Params: @param testDate
	 * @Params: @return
	 *
	 */
	public DrivingTest InsertDrivingTest(int drivingTestId, Client client, Boolean passed, Date testDate) {
		if (client != null) {

			String sql_insert = "INSERT INTO cray1.DrivingTest " + " (drivingTestId, clientId, passed, testDate) "
					+ " VALUES(?,?,?,?)";

			try {
				PreparedStatement ps = connection_.prepareStatement(sql_insert);
				ps.setInt(1, drivingTestId);
				ps.setInt(2, client.clientId);
				ps.setBoolean(3, passed);
				ps.setTimestamp(4, new java.sql.Timestamp(testDate.getTime()));

				ps.executeUpdate();

				DrivingTest test = new DrivingTest(drivingTestId, client, passed, testDate);
				return test;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return null;
	}

	/**
	 * 
	 * 
	 * @Method: InsertWrittenTest
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: WrittenTest
	 * 
	 * @Params: @param writtentestId
	 * @Params: @param client
	 * @Params: @param passed
	 * @Params: @param testDate
	 * @Params: @return
	 *
	 */
	public WrittenTest InsertWrittenTest(int writtentestId, Client client, Boolean passed, Date testDate) {
		if (client != null) {

			String sql_insert = "INSERT INTO cray1.WrittenTest " + " (writtentestId, clientId, passed, testDate) "
					+ " VALUES(?,?,?,?)";

			try {
				PreparedStatement ps = connection_.prepareStatement(sql_insert);
				ps.setInt(1, writtentestId);
				ps.setInt(2, client.clientId);
				ps.setBoolean(3, passed);
				ps.setTimestamp(4, new java.sql.Timestamp(testDate.getTime()));

				ps.executeUpdate();

				WrittenTest test = new WrittenTest(writtentestId, client, passed, testDate);
				return test;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return null;
	}

	/**
	 * 
	 * 
	 * @Method: InsertInterview
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Interview
	 * 
	 * @Params: @param position
	 * @Params: @param client
	 * @Params: @param interviewNotes
	 * @Params: @param interviewDate
	 * @Params: @return
	 *
	 */
	public Interview InsertInterview(Position position, Client client, String interviewNotes, Date interviewDate) {
		if (client != null && position != null) {
			if (!recordExists_TwoPK("cray1.Interview", "positionId", position.positionId + "", "clientId",
					client.clientId + "")) {

				String sql_insert = "INSERT INTO cray1.Interview "
						+ " (positionId, clientId, interviewNotes, interviewDate) " + " VALUES(?,?,?,?)";

				try {
					PreparedStatement ps = connection_.prepareStatement(sql_insert);
					ps.setInt(1, position.positionId);
					ps.setInt(2, client.clientId);
					ps.setString(3, interviewNotes);
					ps.setTimestamp(4, new java.sql.Timestamp(interviewDate.getTime()));

					ps.executeUpdate();

					Interview interview = new Interview(position, client, interviewNotes, interviewDate);
					return interview;

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

				}
			}

		}
		return null;
	}

	/**
	 * 
	 * 
	 * @Method: InsertLesson
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: Lesson
	 * 
	 * @Params: @param lessonId
	 * @Params: @param client
	 * @Params: @param startDate
	 * @Params: @param stopDate
	 * @Params: @param position
	 * @Params: @param car
	 * @Params: @param mileageUsed
	 * @Params: @param progressNotes
	 * @Params: @return 
	 *
	 */
	public Lesson InsertLesson(int lessonId, Client client, Date startDate, Date stopDate, Position position, Car car,
			int mileageUsed, String progressNotes) {

		if (client != null && position != null && car != null) {
			if (!recordExists_OnePK("cray1.Lesson", "lessonId", lessonId + "")) {
				String sql_insert = "INSERT INTO cray1.Lesson "
						+ " (lessonId, clientId, startDate, stopDate, positionId, carId, mileageUsed, progressNotes) "
						+ " VALUES(?,?,?,?,?,?,?,?)";

				try {
					PreparedStatement ps = connection_.prepareStatement(sql_insert);
					ps.setInt(1, lessonId);
					ps.setInt(2, client.clientId);
					ps.setTimestamp(3, new java.sql.Timestamp(startDate.getTime()));
					ps.setTimestamp(4, new java.sql.Timestamp(stopDate.getTime()));
					ps.setInt(5, position.positionId);
					ps.setInt(6, car.carId);
					ps.setInt(7, mileageUsed);
					ps.setString(8, progressNotes);
					ps.executeUpdate();

					Lesson lesson = new Lesson(lessonId, client, startDate, stopDate, position, car, mileageUsed,
							progressNotes);
					return lesson;

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

				}
			}
		}

		return null;

	}
	
	/**
	 * 
	 * 
	 * @Method: InsertMaintenanceLog
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: MaintenanceLog
	 * 
	 * @Params: @param maintenanceLogId
	 * @Params: @param car
	 * @Params: @param maintenanceDate
	 * @Params: @param faultsFound
	 * @Params: @param maintenanceNotes
	 * @Params: @return 
	 *
	 */
	public MaintenanceLog InsertMaintenanceLog(int maintenanceLogId, Car car, Date maintenanceDate, Boolean faultsFound,
			String maintenanceNotes){
		if(car != null && !recordExists_OnePK("cray1.MaintenanceLog", "maintenanceLogId", maintenanceLogId+"")){
			String sql_insert = "INSERT INTO cray1.MaintenanceLog "
					+ " (maintenancelogid, carid, maintenancedate, faultsfound, maintenancenotes) "
					+ " VALUES(?,?,?,?,?)";
			try {
				PreparedStatement ps = connection_.prepareStatement(sql_insert);
				ps.setInt(1, maintenanceLogId);
				ps.setInt(2, car.carId);
				ps.setTimestamp(3, new java.sql.Timestamp(maintenanceDate.getTime()));
				ps.setBoolean(4, faultsFound);
				ps.setString(5, maintenanceNotes);
				
				ps.executeUpdate();

				MaintenanceLog log = new MaintenanceLog(maintenanceLogId, car, maintenanceDate, faultsFound, maintenanceNotes);
				return log;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
			 
		}
		return null;
	}
	
	/**
	 * 
	 * 
	 * @Method: InsertProvisionalLicense
	 *
	 * @Purpose:
	 *
	 * @Pre-condition:
	 *
	 * @Post-condition:
	 *
	 * @Return: ProvisionalLicense
	 * 
	 * @Params: @param licenseId
	 * @Params: @param client
	 * @Params: @param expireDate
	 * @Params: @return 
	 *
	 */
	public ProvisionalLicense InsertProvisionalLicense(int licenseId, Client client, Date expireDate){
		if(client != null && !recordExists_OnePK("ProvisionalLicense", "licenseId", licenseId+"")){
			String sql_insert = "INSERT INTO cray1.ProvisionalLicense "
					+ " (licenseid, clientid, expiredate) "
					+ " VALUES(?,?,?)";
			try {
				PreparedStatement ps = connection_.prepareStatement(sql_insert);
				ps.setInt(1, licenseId);
				ps.setInt(2, client.clientId);
				ps.setTimestamp(3, new java.sql.Timestamp(expireDate.getTime()));
				ps.executeUpdate();

				ProvisionalLicense lic = new ProvisionalLicense(licenseId, client, expireDate);
				return lic;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return null;
	}
}

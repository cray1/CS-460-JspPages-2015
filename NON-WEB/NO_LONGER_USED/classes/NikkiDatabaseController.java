



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;
import java.util.*;

/**
 * Servlet implementation class for Servlet: DatabaseController
 *
 */
public class NikkiDatabaseController {
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


  public NikkiDatabaseController() {
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
}

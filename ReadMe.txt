/*=====================================================================================================
 |   Assignment:  Program #4
 |       Author:  Nicole Attea (neattea@email.arizona.edu)
 |                Chris Ray (cray1@email.arizona.edu
 |
 |       Course:  CSC 460 (Database Design), Fall 2015
 |   Instructor:  L. McCann
 | Sect. Leader:  Shuo Yang
 |     Due Date:  December 8th, at the beginning of class
 |
 |     Language:  Java, html, jsp, jstl
 |     Packages:  java.io
 |                java.util
 |                java.sql
 |
 |  Compile/Run:  move ROOT directory into existing tomcat directory
 |                in web browser go to: (where XXXXX is port number of your choice)
 |
 |                lectura.cs.arizona.edu:XXXXX
 |
 +-----------------------------------------------------------------------------------------------------
 |
 |  Description:  The purpose of this program is to embed the SQL language within the Java
 |                programming language in order to access and manipulate database queries
 |                from a web based interface. Through the tomcat server and oracle database
 |                system, jsp pages implement the structure and functionality of the database
 |                of “The EasyDrive School of Motoring” case study.
 |                
 |        Input:  The user can provide data input for all 12 tables and their respective keys.
 |                The input is received through web based forms. The tables included are:
 |                       Office           WrittenTest
 |                       Staff            Client
 |                       JobTitle         ProvisionalLicense
 |                       Car              MaintenanceLog
 |                       Position         Interview
 |                       DrivingTest      Lesson
 |
 |       Output:  There are 12 “select all” pages that prints a table of all the contents of each
 |                database table and 5 queries. The queries included are: 
 |                       1. The names and telephone numbers of the Managers of each office.
 |                       2. The full address of all offices in Glasgow.
 |                       3. The total number of female clients.
 |                       4. The cars and progress notes taken in lessons longer than 10 miles.
 |                       5. The total number of clients in each city.
 |
 |   Techniques:  The teammate responsibilities are as follows:
 |                       Chris Ray: ER diagram, normalization analysis, complete tomcat server setup,
 |                                  detailed template for insert, delete, update and select functions,
 |                                  query 1, query 5, completion of all functionality for 7/12 tables,
 |
 |                       Nicole Attea: full documentation, completion of functionality for 5/12 tables,
 |                                     query 2, query 3, query 4, provided energy drinks
 |
 |   Required Features Not Included: All required features are included.
 |
 |   Known Bugs:  There are no known bugs, the program runs correctly with many test cases.
 |
 *=================================================================================================*/

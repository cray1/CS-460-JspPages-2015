	<sql:query dataSource="${dbsource}" var="jobTitles">
		SELECT * from cray1.JobTitle
	</sql:query>
	<sql:query dataSource="${dbsource}" var="Staff">
		SELECT emplid, firstname, lastname from cray1.Staff
	</sql:query>
	<sql:query dataSource="${dbsource}" var="Offices">
		SELECT officeid, officename, state from cray1.Office
	</sql:query>
	<sql:query dataSource="${dbsource}" var="Cars">
		SELECT * from cray1.Car
	</sql:query>
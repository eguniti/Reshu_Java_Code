<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix = "form" %>
<%@ page import= "com.luv2code.springdemo.util.SortUtil" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- Reference style sheet -->
	<link type ="text/css"
		  rel = "stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>

<body>

	<div id = "wrapper">
		<div id = "header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id = "container">
	
		<div id = "content">
		
			<!-- add button to add customers -->
			<input type ="button" value = "Add Customer"
					onclick = "window.location.href='showFormForAdd'; return false;"
					class="add-button"
					 />
				
				<!-- add funtionality to search -->
				
				<form:form action="search" method="GET">
                Search customer: <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
            </form:form>
				
			<!--  add html table here -->
			<table>
			<!-- creating sorting link -->
			
				<c:url var="sortLinkFirstName" value="/customer/list">
				 <c:param name="sort" value="<%= Integer.toString(SortUtil.FIRST_NAME) %>" />
				</c:url>
				
				<c:url var="sortLinkLastName" value="/customer/list">
				 <c:param name="sort" value="<%= Integer.toString(SortUtil.LAST_NAME) %>" />
				</c:url>
				
				<c:url var="sortLinkEmail" value="/customer/list">
				 <c:param name="sort" value="<%= Integer.toString(SortUtil.EMAIL) %>" />
				</c:url>
				
				<tr>
					<th><a href="${sortLinkFirstName}">First Name</a></th>
					<th><a href="${sortLinkLastName}">Last Name</a></th>
					<th><a href="${sortLinkEmail}">Email</a></th>
					<th>Action </th>
				</tr>
				<!--  loop over and print customers -->
				
				<c:forEach var = "tempCustomer" items = "${customers}">
				
				<!-- construct an update link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
				 <c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
				
				<!-- construct a delete link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
				 <c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
				
				
				
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td>
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
							Delete</a>
						</td> 
						</td> 
						
					</tr>
				</c:forEach>
				
			</table>
			
		</div>
		
	</div>
</body>

</html>
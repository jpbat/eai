<%@include file="header.jsp" %>

<%
	if (as == null || as.getCurrentUser() == null) { %>
		<%@include file="login.jsp" %>
	<% } else { %>
		<%@include file="movie_list.jsp" %>
	<% }
%>
	
<%@include file="footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ include file="UserDAO.jsp" %>

<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
User User = (User)request.getAttribute("User");
if(User == null){
	User = new User();
	request.setAttribute("User", User);
}
User.setUserID(request.getParameter("userID"));
User.setUserPassword(request.getParameter("userPassword"));
User.setUserName(request.getParameter("userName"));
User.setUserGender(request.getParameter("userGender"));
User.setUserEmail(request.getParameter("userEmail"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�̹� �α����� �Ǿ��ֽ��ϴ�.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if(User.getUserID() == null || User.getUserPassword() == null || User.getUserName() == null || User.getUserGender() == null || User.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(User);
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�̹� �����ϴ� ���̵��Դϴ�')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", User.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			} 
		}
	
	%>

</body>
</html>
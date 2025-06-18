<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
  <head><title>Test JSTL</title></head>
  <body>
    <c:set var="name" value="Nghĩa Bùi"/>
    <h1>Hello <c:out value="${name}"/></h1>
  </body>
</html>

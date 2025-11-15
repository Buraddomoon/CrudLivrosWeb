<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.LivroDAO" %>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    
    LivroDAO dao = new LivroDAO();
    
    dao.excluir(id);
    
    response.sendRedirect("index.jsp");
%>
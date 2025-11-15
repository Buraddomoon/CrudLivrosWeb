<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.LivroDAO" %>
<%@ page import="model.Livro" %>

<%
    request.setCharacterEncoding("UTF-8");
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    int ano = Integer.parseInt(request.getParameter("ano"));
    String idParam = request.getParameter("id");

    Livro livro = new Livro();
    livro.setTitulo(titulo);
    livro.setAutor(autor);
    livro.setAnoPublicacao(ano);

    LivroDAO dao = new LivroDAO();

    if (idParam != null && !idParam.isEmpty()) {
        livro.setId(Integer.parseInt(idParam));
        dao.atualizar(livro);
    } else {
        dao.adicionar(livro);
    }

    response.sendRedirect("index.jsp");
%>

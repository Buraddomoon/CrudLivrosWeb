<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.LivroDAO" %>
<%@ page import="model.Livro" %>
<%@ page import="java.util.List" %>

<%
    LivroDAO dao = new LivroDAO();
    List<Livro> listaDeLivros = dao.listar();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD de Livros - JSP</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; }
        .btn-add { display: inline-block; margin-bottom: 20px; padding: 10px; background-color: #007bff; color: white; border-radius: 5px; }
    </style>
</head>
<body>

    <h2>Gerenciador de Livros</h2>

    <a href="form.jsp" class="btn-add">Adicionar Novo Livro</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <% for (Livro livro : listaDeLivros) { %>
            <tr>
                <td><%= livro.getId() %></td>
                <td><%= livro.getTitulo() %></td>
                <td><%= livro.getAutor() %></td>
                <td><%= livro.getAnoPublicacao() %></td>
                <td>
                    <a href="form.jsp?id=<%= livro.getId() %>">Editar</a>
                    <a href="excluir.jsp?id=<%= livro.getId() %>" 
                       onclick="return confirm('Tem certeza que deseja excluir?');">Excluir</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
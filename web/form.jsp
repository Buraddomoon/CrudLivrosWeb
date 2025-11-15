<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.LivroDAO" %>
<%@ page import="model.Livro" %>

<%
    String titulo = "";
    String autor = "";
    String ano = "";
    String id = "";
    
    boolean modoEdicao = (request.getParameter("id") != null);
    
    if (modoEdicao) {
        int idLivro = Integer.parseInt(request.getParameter("id"));
        LivroDAO dao = new LivroDAO();
        Livro livro = dao.buscarPorId(idLivro);
        
        if (livro != null) {
            titulo = livro.getTitulo();
            autor = livro.getAutor();
            ano = String.valueOf(livro.getAnoPublicacao());
            id = String.valueOf(livro.getId());
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Livro</title>
    <style>
        body { font-family: sans-serif; }
        form { width: 400px; margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        div { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; }
        button { padding: 10px 15px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>

    <h2><%= (modoEdicao ? "Editar Livro" : "Adicionar Novo Livro") %></h2>

    <form action="salvar.jsp" method="POST">
        <% if (modoEdicao) { %>
            <input type="hidden" name="id" value="<%= id %>">
        <% } %>

        <div>
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" value="<%= titulo %>" required>
        </div>
        <div>
            <label for="autor">Autor:</label>
            <input type="text" id="autor" name="autor" value="<%= autor %>">
        </div>
        <div>
            <label for="ano">Ano de Publicação:</label>
            <input type="number" id="ano" name="ano" value="<%= ano %>">
        </div>
        
        <button type="submit">Salvar</button>
        <a href="index.jsp">Cancelar</a>
    </form>

</body>
</html>
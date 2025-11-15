# 📚 CRUD de Livros com JSP e PostgreSQL

Um projeto web acadêmico simples que demonstra operações **CRUD** (Create, Read, Update, Delete) para gerenciar uma biblioteca de livros.

Todo o backend é construído usando **JSP (Java Server Pages)** puro, sem o uso de Servlets ou frameworks MVC complexos, e se conecta a um banco de dados **PostgreSQL**.



## ✨ Funcionalidades

* **Listar (Read):** Exibe todos os livros cadastrados no banco de dados na página principal.
* **Adicionar (Create):** Permite a inserção de novos livros através de um formulário.
* **Editar (Update):** Permite a atualização dos dados de um livro existente.
* **Excluir (Delete):** Permite a remoção de um livro do banco.

---

## 💻 Tecnologias Utilizadas

* **Java (JSP):** Utilizado para processar toda a lógica de backend, incluindo a comunicação com o banco de dados e a renderização dinâmica do HTML.
* **PostgreSQL:** Banco de dados relacional (BDR) usado para armazenar os dados dos livros.
* **JDBC:** Driver de conectividade Java para o PostgreSQL.
* **Apache Tomcat:** Servidor web (container) para executar a aplicação JSP.
* **HTML & CSS:** Estrutura e estilização básica do frontend.

---

## 🚀 Como Executar o Projeto

Siga estes passos para configurar e rodar o projeto em seu ambiente local.

### 1. Pré-requisitos

* **Java JDK:** Versão 17 ou superior.
* **Apache NetBeans:** (Ou outra IDE Java, mas o projeto foi pensado para o NetBeans).
* **Apache Tomcat:** Versão 10.0 ou superior.
* **PostgreSQL:** Servidor de banco de dados (recomenda-se usar o **pgAdmin** para gerenciamento).

### 2. Configuração do Banco de Dados

1.  Abra o **pgAdmin** e crie um novo banco de dados (ex: `crud_jsp`).
2.  Abra uma janela de Query e execute o seguinte script SQL para criar a tabela `livros`:

    ```sql
    CREATE TABLE livros (
        id SERIAL PRIMARY KEY,
        titulo VARCHAR(255) NOT NULL,
        autor VARCHAR(150),
        ano_publicacao INT
    );
    ```

### 3. Configuração do Projeto no NetBeans

1.  Clone este repositório para sua máquina local.
2.  Abra o projeto no NetBeans (`Arquivo` > `Abrir Projeto...`).
3.  **Adicione o Driver JDBC:**
    * Clique com o botão direito em **"Bibliotecas"** (Libraries).
    * Selecione **"Adicionar Biblioteca..."** (Add Library...).
    * Escolha **"PostgreSQL JDBC Driver"** e adicione-o.
4.  **Configure a Conexão:**
    * Navegue até `Pacotes de Códigos-Fonte` > `br.com.projeto.db`.
    * Abra o arquivo **`ConexaoDB.java`**.
    * **Altere** as constantes `URL`, `USER` e `PASSWORD` para corresponder às credenciais do seu banco PostgreSQL:

    ```java
    // Exemplo:
    private static final String URL = "jdbc:postgresql://localhost:5432/crud_jsp";
    private static final String USER = "postgres";
    private static final String PASSWORD = "sua_senha_secreta";
    ```

### 4. Configuração do Servidor Tomcat

1.  Certifique-se de que seu Tomcat tenha um usuário com as permissões de `manager-script`. Edite o arquivo `conf/tomcat-users.xml` na pasta do seu Tomcat:

    ```xml
    <role rolename="manager-script"/>
    <user username="admin" password="admin" roles="manager-script"/>
    ```
    *(Lembre-se de reiniciar o Tomcat após salvar!)*

2.  No NetBeans, vá para a aba **"Serviços"** (Services).
3.  Clique com o botão direito em **"Servidores"** (Servers) > **"Adicionar Servidor..."**.
4.  Escolha `Apache Tomcat` e aponte para a pasta de instalação.
5.  Na etapa de "Login Details", insira o `username` e `password` que você configurou no `tomcat-users.xml`.

### 5. Executar

Tudo pronto! Clique com o botão direito no projeto e selecione **"Executar"** (Run). O NetBeans fará o deploy automático no Tomcat e abrirá a aplicação no seu navegador.

---

## 📁 Estrutura dos Arquivos (Arquitetura JSP)

Este projeto usa JSP para processar o backend, eliminando a necessidade de Servlets separados. A lógica é dividida da seguinte forma:

* **`index.jsp`**
    * **Função:** Página principal (Read).
    * **Backend:** Contém *scriptlets* Java (`<% ... %>`) que instanciam o `LivroDAO`, chamam o método `listar()` e fazem um loop `for` para exibir os resultados em uma tabela HTML.

* **`form.jsp`**
    * **Função:** Formulário de Adição/Edição (Create/Update).
    * **Backend:** Verifica se um `id` foi passado pela URL.
        * **Sem ID:** Exibe um formulário em branco (Modo Adição).
        * **Com ID:** Busca o livro no banco (`dao.buscarPorId()`) e preenche os campos do formulário (Modo Edição).

* **`salvar.jsp`**
    * **Função:** Página de processamento (Backend Puro). **Não contém HTML.**
    * **Backend:** Recebe os dados (`request.getParameter()`) do `form.jsp`.
        * **Sem ID:** Cria um novo objeto `Livro` e chama `dao.adicionar()`.
        * **Com ID:** Atualiza o objeto `Livro` e chama `dao.atualizar()`.
    * No final, redireciona (`response.sendRedirect()`) o usuário de volta para o `index.jsp`.

* **`excluir.jsp`**
    * **Função:** Página de processamento (Backend Puro). **Não contém HTML.**
    * **Backend:** Recebe o `id` da URL, chama `dao.excluir(id)` e redireciona de volta para o `index.jsp`.

* **`Livro.java`**
    * Uma classe simples que representa a estrutura de um livro.

* **`LivroDAO.java`**
    * **DAO (Data Access Object):** A classe mais importante. Isola toda a lógica de banco de dados (comandos SQL, `PreparedStatement`, etc.) do resto da aplicação.

* **`web.xml`**
    * Define a página de boas-vindas (`<welcome-file-list>`) para que `index.jsp` seja carregado por padrão em vez do `index.html`.

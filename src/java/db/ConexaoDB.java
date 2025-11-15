package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDB {

    // ATENÇÃO: Substitua por seus dados do Postgres
    private static final String URL = "jdbc:postgresql://localhost:5432/seu_banco";
    private static final String USER = "postgres";
    private static final String PASSWORD = "sua_senha";

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Erro ao conectar ao banco de dados", e);
        }
    }
}
package locacaodvds.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    // A conexão volta a ser static, como seu projeto espera.
    private static Connection conn;

    // O método volta a ser static.
    public static Connection getConnection() throws SQLException {

        try {
            // A verificação inteligente: se a conexão está nula OU se já foi fechada...
            if (conn == null || conn.isClosed()) {
                
                // ...então, carregue o driver e crie uma NOVA conexão.
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection(
                        "jdbc:mariadb://localhost/locacao_dvds",
                        "root",
                        "" ); // Mantendo sua senha em branco
            }
        } catch (ClassNotFoundException e) {
            throw new SQLException("ERRO: Driver do MariaDB não encontrado!", e);
        }
        
        // Retorna a conexão (a nova ou a que já estava aberta e funcionando)
        return conn;
    }

}
package locacaodvds.dao;

import java.sql.Date;
import locacaodvds.entidades.Dvd;
import locacaodvds.entidades.Ator;
import locacaodvds.entidades.Genero;
import locacaodvds.entidades.ClassificacaoEtaria;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static locacaodvds.jdbc.ConnectionFactory.getConnection;

public class DvdDAO extends DAO<Dvd> {

    public DvdDAO() throws SQLException {
    }
    
    @Override
    public void salvar(Dvd obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            """
            INSERT INTO dvd (
                titulo, url_cartaz, ano_lancamento, ator_principal_id, 
                ator_coadjuvante_id, data_lancamento, duracao_minutos, 
                classificacao_etaria_id, genero_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
            """);

        stmt.setString(1, obj.getTitulo());
        stmt.setString(2, obj.getUrlCartaz());
        stmt.setInt(3, obj.getAnoLancamento());
        stmt.setInt(4, obj.getAtorPrincipal().getId());
        stmt.setInt(5, obj.getAtorCoadjuvante().getId());
        stmt.setDate(6, new java.sql.Date(obj.getDataLancamento().getTime()));
        stmt.setInt(7, obj.getDuracaoMinutos());
        stmt.setInt(8, obj.getClassificacaoEtaria().getId());
        stmt.setInt(9, obj.getGenero().getId());
        stmt.executeUpdate();
        stmt.close();
    }
    
    @Override
    public void atualizar(Dvd obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            """
            UPDATE dvd SET
                titulo = ?, url_cartaz = ?, ano_lancamento = ?, 
                ator_principal_id = ?, ator_coadjuvante_id = ?, data_lancamento = ?, 
                duracao_minutos = ?, classificacao_etaria_id = ?, genero_id = ?
            WHERE id = ?;
            """);

        stmt.setString(1, obj.getTitulo());
        stmt.setString(2, obj.getUrlCartaz());
        stmt.setInt(3, obj.getAnoLancamento());
        stmt.setInt(4, obj.getAtorPrincipal().getId());
        stmt.setInt(5, obj.getAtorCoadjuvante().getId());
        stmt.setDate(6, new java.sql.Date(obj.getDataLancamento().getTime()));
        stmt.setInt(7, obj.getDuracaoMinutos());
        stmt.setInt(8, obj.getClassificacaoEtaria().getId());
        stmt.setInt(9, obj.getGenero().getId());
        stmt.setInt(10, obj.getId());
        stmt.executeUpdate();
        stmt.close();
    }
    
    @Override
    public void excluir(Dvd obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement("DELETE FROM dvd WHERE id = ?;");
        stmt.setInt(1, obj.getId());
        stmt.executeUpdate();
        stmt.close();
    }
    
    @Override
    public List<Dvd> listarTodos() throws SQLException {
        List<Dvd> lista = new ArrayList<>();
        PreparedStatement stmt = getConnection().prepareStatement(
            """
            SELECT
                d.id idDvd, d.titulo tituloDvd, d.url_cartaz urlCartazDvd, 
                d.ano_lancamento anoLancamentoDvd, d.data_lancamento dataLancamentoDvd, 
                d.duracao_minutos duracaoDvd, a1.id idAtorPrincipal, a1.nome nomeAtorPrincipal, 
                a1.sobrenome sobrenomeAtorPrincipal, a1.data_estreia estreiaAtorPrincipal, 
                a2.id idAtorCoadjuvante, a2.nome nomeAtorCoadjuvante, a2.sobrenome sobrenomeAtorCoadjuvante, 
                a2.data_estreia estreiaAtorCoadjuvante, c.id idClassificacao, 
                c.descricao descClassificacao, g.id idGenero, g.descricao descGenero
            FROM dvd d
            LEFT JOIN ator a1 ON d.ator_principal_id = a1.id
            LEFT JOIN ator a2 ON d.ator_coadjuvante_id = a2.id
            LEFT JOIN classificacao_etaria c ON d.classificacao_etaria_id = c.id
            LEFT JOIN genero g ON d.genero_id = g.id
            ORDER BY d.id ASC;
            """);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Dvd d = new Dvd();
            d.setId(rs.getInt("idDvd"));
            d.setTitulo(rs.getString("tituloDvd"));
            d.setUrlCartaz(rs.getString("urlCartazDvd"));
            d.setAnoLancamento(rs.getInt("anoLancamentoDvd"));
            d.setDataLancamento(rs.getDate("dataLancamentoDvd"));
            d.setDuracaoMinutos(rs.getInt("duracaoDvd"));

            Ator atorP = new Ator();
            atorP.setId(rs.getInt("idAtorPrincipal"));
            atorP.setNome(rs.getString("nomeAtorPrincipal"));
            atorP.setSobrenome(rs.getString("sobrenomeAtorPrincipal"));
            atorP.setDataEstreia(rs.getDate("estreiaAtorPrincipal"));
            d.setAtorPrincipal(atorP);

            Ator atorC = new Ator();
            atorC.setId(rs.getInt("idAtorCoadjuvante"));
            atorC.setNome(rs.getString("nomeAtorCoadjuvante"));
            atorC.setSobrenome(rs.getString("sobrenomeAtorCoadjuvante"));
            atorC.setDataEstreia(rs.getDate("estreiaAtorCoadjuvante"));
            d.setAtorCoadjuvante(atorC);

            ClassificacaoEtaria c = new ClassificacaoEtaria();
            c.setId(rs.getInt("idClassificacao"));
            c.setDescricao(rs.getString("descClassificacao"));
            d.setClassificacaoEtaria(c);

            Genero g = new Genero();
            g.setId(rs.getInt("idGenero"));
            g.setDescricao(rs.getString("descGenero"));
            d.setGenero(g);

            lista.add(d);
        }

        rs.close();
        stmt.close();
        return lista;
    }

    @Override
    public Dvd obterPorId(int id) throws SQLException {
        Dvd dvd = null;
        PreparedStatement stmt = getConnection().prepareStatement(
            """
            SELECT
                d.id idDvd, d.titulo tituloDvd, d.url_cartaz urlCartazDvd, 
                d.ano_lancamento anoLancamentoDvd, d.data_lancamento dataLancamentoDvd, 
                d.duracao_minutos duracaoDvd, a1.id idAtorPrincipal, a1.nome nomeAtorPrincipal, 
                a1.sobrenome sobrenomeAtorPrincipal, a1.data_estreia estreiaAtorPrincipal, 
                a2.id idAtorCoadjuvante, a2.nome nomeAtorCoadjuvante, a2.sobrenome sobrenomeAtorCoadjuvante, 
                a2.data_estreia estreiaAtorCoadjuvante, c.id idClassificacao, 
                c.descricao descClassificacao, g.id idGenero, g.descricao descGenero
            FROM dvd d
            LEFT JOIN ator a1 ON d.ator_principal_id = a1.id
            LEFT JOIN ator a2 ON d.ator_coadjuvante_id = a2.id
            LEFT JOIN classificacao_etaria c ON d.classificacao_etaria_id = c.id
            LEFT JOIN genero g ON d.genero_id = g.id
            WHERE d.id = ?;
            """);

        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            dvd = new Dvd();
            dvd.setId(rs.getInt("idDvd"));
            dvd.setTitulo(rs.getString("tituloDvd"));
            dvd.setUrlCartaz(rs.getString("urlCartazDvd"));
            dvd.setAnoLancamento(rs.getInt("anoLancamentoDvd"));
            dvd.setDataLancamento(rs.getDate("dataLancamentoDvd"));
            dvd.setDuracaoMinutos(rs.getInt("duracaoDvd"));

            Ator atorP = new Ator();
            atorP.setId(rs.getInt("idAtorPrincipal"));
            atorP.setNome(rs.getString("nomeAtorPrincipal"));
            atorP.setSobrenome(rs.getString("sobrenomeAtorPrincipal"));
            atorP.setDataEstreia(rs.getDate("estreiaAtorPrincipal"));
            dvd.setAtorPrincipal(atorP);

            Ator atorC = new Ator();
            atorC.setId(rs.getInt("idAtorCoadjuvante"));
            atorC.setNome(rs.getString("nomeAtorCoadjuvante"));
            atorC.setSobrenome(rs.getString("sobrenomeAtorCoadjuvante"));
            atorC.setDataEstreia(rs.getDate("estreiaAtorCoadjuvante"));
            dvd.setAtorCoadjuvante(atorC);

            ClassificacaoEtaria c = new ClassificacaoEtaria();
            c.setId(rs.getInt("idClassificacao"));
            c.setDescricao(rs.getString("descClassificacao"));
            dvd.setClassificacaoEtaria(c);

            Genero g = new Genero();
            g.setId(rs.getInt("idGenero"));
            g.setDescricao(rs.getString("descGenero"));
            dvd.setGenero(g);
        }

        rs.close();
        stmt.close();
        return dvd;
    }
}
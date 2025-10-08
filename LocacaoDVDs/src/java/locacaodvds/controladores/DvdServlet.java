/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locacaodvds.controladores;

import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import locacaodvds.dao.AtorDAO;
import locacaodvds.dao.ClassificacaoEtariaDAO;
import locacaodvds.dao.DvdDAO;
import locacaodvds.dao.GeneroDAO;
import locacaodvds.entidades.Ator;
import locacaodvds.entidades.ClassificacaoEtaria;
import locacaodvds.entidades.Dvd;
import locacaodvds.entidades.Genero;

/**
 *
 * @author laris
 */
@WebServlet(name = "DvdServlet", urlPatterns = {"/processaDvds"})
public class DvdServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        DvdDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new DvdDAO();

            if (acao.equals("inserir")) {

                String titulo = request.getParameter("titulo");
                String urlCartaz = request.getParameter("urlCartaz");
                int anoLancamento = Integer.parseInt(request.getParameter("anoLancamento"));
                int idAtorPrincipal = Integer.parseInt(request.getParameter("atorPrincipal_id"));
                int idAtorCoadjuvante = Integer.parseInt(request.getParameter("atorCoadjuvante_id"));
                String dataLancamentoStr = request.getParameter("dataLancamento");
                int duracaoMinutos = Integer.parseInt(request.getParameter("duracaoMinutos"));
                int idGenero = Integer.parseInt(request.getParameter("genero_id"));
                int idClassificacao = Integer.parseInt(request.getParameter("classificacao_id"));

                Ator atorPrincipal = new Ator();
                atorPrincipal.setId(idAtorPrincipal);

                Ator atorCoadjuvante = new Ator();
                atorCoadjuvante.setId(idAtorCoadjuvante);

                Genero genero = new Genero();
                genero.setId(idGenero);

                ClassificacaoEtaria classificacao = new ClassificacaoEtaria();
                classificacao.setId(idClassificacao);

                Dvd dvd = new Dvd();
                dvd.setTitulo(titulo);
                dvd.setUrlCartaz(urlCartaz);
                dvd.setAnoLancamento(anoLancamento);
                dvd.setAtorPrincipal(atorPrincipal);
                dvd.setAtorCoadjuvante(atorCoadjuvante);
                dvd.setDataLancamento(java.sql.Date.valueOf(dataLancamentoStr));
                dvd.setDuracaoMinutos(duracaoMinutos);
                dvd.setGenero(genero);
                dvd.setClassificacaoEtaria(classificacao);

                dao.salvar(dvd);
                disp = request.getRequestDispatcher("/formularios/dvd/listagem.jsp");

            } else if (acao.equals("alterar")) {

                int id = Integer.parseInt(request.getParameter("id"));
                String titulo = request.getParameter("titulo");
                String urlCartaz = request.getParameter("urlCartaz");
                int anoLancamento = Integer.parseInt(request.getParameter("anoLancamento"));
                int idAtorPrincipal = Integer.parseInt(request.getParameter("atorPrincipal_id"));
                int idAtorCoadjuvante = Integer.parseInt(request.getParameter("atorCoadjuvante_id"));
                String dataLancamentoStr = request.getParameter("dataLancamento");
                int duracaoMinutos = Integer.parseInt(request.getParameter("duracaoMinutos"));
                int idGenero = Integer.parseInt(request.getParameter("genero_id"));
                int idClassificacao = Integer.parseInt(request.getParameter("classificacao_id"));

                Ator atorPrincipal = new Ator();
                atorPrincipal.setId(idAtorPrincipal);

                Ator atorCoadjuvante = new Ator();
                atorCoadjuvante.setId(idAtorCoadjuvante);

                Genero genero = new Genero();
                genero.setId(idGenero);

                ClassificacaoEtaria classificacao = new ClassificacaoEtaria();
                classificacao.setId(idClassificacao);

                Dvd dvd = new Dvd();
                dvd.setId(id);
                dvd.setTitulo(titulo);
                dvd.setUrlCartaz(urlCartaz);
                dvd.setAnoLancamento(anoLancamento);
                dvd.setAtorPrincipal(atorPrincipal);
                dvd.setAtorCoadjuvante(atorCoadjuvante);
                dvd.setDataLancamento(java.sql.Date.valueOf(dataLancamentoStr));
                dvd.setDuracaoMinutos(duracaoMinutos);
                dvd.setGenero(genero);
                dvd.setClassificacaoEtaria(classificacao);

                dao.atualizar(dvd);
                disp = request.getRequestDispatcher("/formularios/dvd/listagem.jsp");

            } else if (acao.equals("excluir")) {

                int id = Integer.parseInt(request.getParameter("id"));
                Dvd dvd = new Dvd();
                dvd.setId(id);
                dao.excluir(dvd);
                disp = request.getRequestDispatcher("/formularios/dvd/listagem.jsp");

            } else if (acao.equals("prepararInsercao")) {
                AtorDAO atorDAO = new AtorDAO();
                GeneroDAO generoDAO = new GeneroDAO();
                ClassificacaoEtariaDAO classifDAO = new ClassificacaoEtariaDAO();

                request.setAttribute("atores", atorDAO.listarTodos());
                request.setAttribute("generos", generoDAO.listarTodos());
                request.setAttribute("classificacoes", classifDAO.listarTodos());

                disp = request.getRequestDispatcher("/formularios/dvd/novo.jsp");
            } else if (acao.equals("prepararAlteracao")) {

                // Lógica para carregar as listas de Atores, Gêneros e Classificações
                // para preencher os <select> (dropdowns) no formulário.
                AtorDAO atorDAO = new AtorDAO();
                GeneroDAO generoDAO = new GeneroDAO();
                ClassificacaoEtariaDAO classifDAO = new ClassificacaoEtariaDAO();

                request.setAttribute("atores", atorDAO.listarTodos());
                request.setAttribute("generos", generoDAO.listarTodos());
                request.setAttribute("classificacoes", classifDAO.listarTodos());

                if (acao.equals("prepararAlteracao")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Dvd dvd = dao.obterPorId(id);
                    request.setAttribute("dvd", dvd);
                }

                disp = request.getRequestDispatcher("/formularios/dvd/alterar.jsp");

            } else if (acao.equals("prepararExclusao")) {

                int id = Integer.parseInt(request.getParameter("id"));
                Dvd dvd = dao.obterPorId(id);
                request.setAttribute("dvd", dvd);
                disp = request.getRequestDispatcher("/formularios/dvd/excluir.jsp");
            }

        } catch (SQLException exc) {
            exc.printStackTrace();
        } finally {
            if (dao != null) {
                try {
                    dao.fecharConexao();
                } catch (SQLException exc) {
                    exc.printStackTrace();
                }
            }
        }

        if (disp != null) {
            disp.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "DvdServlet";
    }
}

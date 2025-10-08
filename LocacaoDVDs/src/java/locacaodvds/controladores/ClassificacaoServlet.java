package locacaodvds.controladores;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import locacaodvds.dao.ClassificacaoEtariaDAO;
import locacaodvds.entidades.ClassificacaoEtaria;


@WebServlet(name = "ClassificacaoServlet", urlPatterns = { "/processaClassificacoes" })
public class ClassificacaoServlet extends jakarta.servlet.http.HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        ClassificacaoEtariaDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new ClassificacaoEtariaDAO();

            if (acao.equals("inserir")) {
                String descricao = request.getParameter("descricao");

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setDescricao(descricao);

                dao.salvar(ce);
                
                disp = request.getRequestDispatcher(
                 "/formularios/classificacao/listagem.jsp" );

            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String descricao = request.getParameter("descricao");

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setId(id);
                ce.setDescricao(descricao);

                dao.atualizar(ce);

                disp = request.getRequestDispatcher("/formularios/classificacao/listagem.jsp");

            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                ClassificacaoEtaria ce = new ClassificacaoEtaria();
                ce.setId(id);

                dao.excluir(ce);

                disp = request.getRequestDispatcher("/formularios/classificacao/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                ClassificacaoEtaria ce = dao.obterPorId(id);
                request.setAttribute("classificacao", ce);

                if ("prepararAlteracao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formularios/classificacao/alterar.jsp");
                } else if ("prepararExclusao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formularios/classificacao/excluir.jsp");
                }
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "ClassificacaoEtariaServlet";
    }
}
